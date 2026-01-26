
---

# DevOps CI/CD Project Documentation

**Project:** Build and Deploy Java WebApp (WAR) to Tomcat using Jenkins on AWS
**CI/CD Flow:** GitHub → Jenkins (Maven Build) → Tomcat (Deploy WAR)
**Automation:** Poll SCM (Auto build/deploy on each code push)

---

## 1. Architecture Overview

### Components

1. **Jenkins Server (EC2-1)**

   * Amazon Linux 2023 / RHEL-like
   * Jenkins + Java 21 + Maven
   * Plugins: Maven Integration, Git, Deploy to Container, etc.

2. **Tomcat Server (EC2-2)**

   * Amazon Linux 2023
   * Java 21
   * Apache Tomcat 9
   * Manager App enabled (for remote deployment from Jenkins)

3. **GitHub Repository**

   * Java Maven WebApp (`war`) project
   * JSP pages: `index.jsp`, `register.jsp`, `register-success.jsp`

---

## 2. AWS EC2 Setup

### 2.1 Create Jenkins Server EC2 Instance

* AMI: Amazon Linux 2023 (recommended)
* Instance type: t2.medium or t3.medium (for stable Jenkins)
* Storage: minimum 15–20 GB (recommended)
* Security Group inbound:

  * **22** SSH (your IP)
  * **8080** Jenkins UI (your IP or controlled access)
* Outbound: allow all (default)

### 2.2 Create Tomcat Server EC2 Instance

* AMI: Amazon Linux 2023
* Instance type: t2.micro (ok for demo) / t3.small (better)
* Storage: 10–20 GB
* Security Group inbound:

  * **22** SSH (your IP)
  * **8080** Tomcat (your IP or Jenkins SG)
* Outbound: allow all

---

## 3. Jenkins Server Installation (EC2-1)

### 3.1 Update OS packages

```bash
sudo yum update -y
```

### 3.2 Add Jenkins repo

```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo \
  https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
```

### 3.3 Install Java 21 (Amazon Corretto)

```bash
sudo yum install java-21-amazon-corretto -y
```

### 3.4 Install Jenkins

```bash
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
```

### 3.5 Access Jenkins UI

Open:

```
http://<JENKINS_PUBLIC_IP>:8080
```

### 3.6 Unlock Jenkins

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### 3.7 Install suggested plugins

* Click **Install suggested plugins**
* Create **First Admin User**
* Save and continue

---

## 4. Maven Setup on Jenkins Server

### 4.1 Download Maven in `/opt`

```bash
cd /opt
sudo wget https://downloads.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
sudo tar -xvzf apache-maven-3.9.9-bin.tar.gz
sudo mv apache-maven-3.9.9 maven
```

### 4.2 Configure environment variables (PATH)

Edit:

```bash
sudo nano ~/.bashrc
```

Add:

```bash
M2_HOME=/opt/maven
M2=/opt/maven/bin
JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto.x86_64
PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2_HOME:$M2
export PATH
```

Reload:

```bash
source ~/.bashrc
```

Verify:

```bash
mvn -version
java -version
```

---

## 5. Jenkins Plugin Configuration

### 5.1 Recommended plugins

* **Git plugin**
* **Maven Integration plugin**
* **Deploy to Container plugin**
* (Optional) Pipeline plugins if you plan Jenkinsfile

### 5.2 Disable GitHub Branch Source Plugin (if causing conflicts)

Go to:
**Manage Jenkins → Manage Plugins → Installed**

* Disable **GitHub Branch Source Plugin**
* Ensure **Git plugin** is enabled

---

## 6. Jenkins Troubleshooting: Node Offline (Swap/Temp issue)

### Symptom

Jenkins node shows offline due to:

* Swap space: **0 B**
* Temp space low (e.g., **451 MiB**)

### 6.1 Increase AWS disk size

AWS Console:

* EC2 → Volumes → Modify volume → Increase size (8GB → 20GB)

On EC2:

```bash
sudo growpart /dev/nvme0n1 1
sudo xfs_growfs /
```

### 6.2 Create Swap (2 GB)

```bash
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

Permanent swap:

```bash
sudo nano /etc/fstab
```

Add:

```
/swapfile none swap sw 0 0
```

Verify:

```bash
free -h
swapon --show
```

### 6.3 Cleanup temp space

```bash
sudo find /tmp -type f -atime +1 -delete
sudo rm -rf /tmp/hudson*
sudo rm -rf /tmp/jna*
```

### 6.4 Bring node online

Jenkins → Nodes → Built-In Node → **Bring this node online**

---

## 7. Tomcat Server Setup (EC2-2)

### 7.1 Install Java 21

```bash
sudo yum update -y
sudo yum install java-21-amazon-corretto -y
java -version
```

### 7.2 Install Tomcat 9 (example approach)

You likely installed Tomcat under:

```
/opt/tomcat
```

Verify:

```bash
/opt/tomcat/bin/version.sh
```

Start:

```bash
sudo /opt/tomcat/bin/startup.sh
```

Access:

```
http://<TOMCAT_PUBLIC_IP>:8080
```

---

## 8. Tomcat Manager Remote Deployment Setup

### 8.1 Edit manager/host-manager context.xml to allow remote access

You edited:

```bash
nano /opt/tomcat/webapps/host-manager/META-INF/context.xml
nano /opt/tomcat/webapps/manager/META-INF/context.xml
```

In both files, comment/remove the restrictive Valve (common requirement). Example:

```xml
<!--
<Valve className="org.apache.catalina.valves.RemoteAddrValve"
       allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
-->
```

Restart Tomcat after change:

```bash
sudo /opt/tomcat/bin/shutdown.sh
sudo /opt/tomcat/bin/startup.sh
```

### 8.2 Configure Tomcat users (tomcat-users.xml)

Edit:

```bash
sudo nano /opt/tomcat/conf/tomcat-users.xml
```

Add roles and users:

```xml
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>

<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
<user username="deployer" password="deployer" roles="manager-script"/>
<user username="tomcat" password="s3cret" roles="manager-gui"/>
```

Restart Tomcat.

---

## 9. Validate Tomcat Credentials (Important for Jenkins Deploy)

### 9.1 Test in browser

Open:

```
http://<TOMCAT_IP>:8080/manager/html
```

Login using:

* `tomcat / s3cret` (manager-gui)
  or admin user.

### 9.2 Test manager script endpoint (must work for Jenkins)

Use:

```bash
curl -u deployer:deployer http://<TOMCAT_IP>:8080/manager/text/list
```

**Expected:** A text response listing deployed apps.

### If still 401 Unauthorized

Most common causes:

* Tomcat not restarted after updating users
* Wrong username/password
* User does not have **manager-script**
* context.xml still restricting access
* Jenkins server IP not allowed by security group

---

## 10. Jenkins Job: Build and Deploy WAR to Tomcat

### 10.1 Create Maven Project Job

Jenkins → **New Item**

* Name: `Build_and_deploy_to_tomcat`
* Type: **Maven project**

### 10.2 Source Code Management

* Git
* Repository URL: your repo
* Branch: `*/main`
* Credentials: optional (for public repo not required)

### 10.3 Build

Goals:

```bash
clean install
```

### 10.4 Post-build Action: Deploy war/ear to a container

* Container: **Tomcat 9.x Remote**
* Tomcat URL:

  ```
  http://<TOMCAT_IP>:8080
  ```
* Credentials:

  * Username: `deployer`
  * Password: `deployer`
* WAR file:

  ```
  **/webapp.war
  ```

  (or your generated war path)

---

## 11. Common Build Errors and Fixes

### 11.1 Maven compilation error: Source option 7 not supported

Error:

```
Source option 7 is no longer supported. Use 8 or later.
Target option 7 is no longer supported.
```

Fix: update `pom.xml` compiler settings to 8/11/17/21. Example:

```xml
<properties>
  <maven.compiler.release>21</maven.compiler.release>
</properties>
```

Or:

```xml
<configuration>
  <source>21</source>
  <target>21</target>
</configuration>
```

You fixed this in your repo later and build succeeded.

---

## 12. Deploy Failure: Tomcat 401 Unauthorized (Jenkins Deploy Step)

Error:

```
TomcatManagerException: HTTP request failed, response code: 401 Unauthorized
```

### Fix checklist

1. Ensure user has `manager-script` role:

```xml
<user username="deployer" password="deployer" roles="manager-script"/>
```

2. Restart Tomcat after changes
3. Ensure `/manager/text/list` works via curl from Tomcat or Jenkins server:

```bash
curl -u deployer:deployer http://<TOMCAT_IP>:8080/manager/text/list
```

4. Confirm security group allows traffic from Jenkins to Tomcat port 8080.

---

## 13. JSP Form Handling (Tomcat does NOT support PHP)

### Issue

You were hitting:

```
http://<IP>:8080/webapp/action_page.php
```

This fails because **Tomcat cannot run PHP**.

### Correct approach

* Use JSP:

  * `register.jsp` submits to `register-success.jsp`

Form action must be:

```html
<form action="register-success.jsp" method="post">
```

---

## 14. JSP Error: HTTP 500 Unable to compile JSP (esc undefined)

### Symptom

`register-success.jsp` shows:

```
method esc(String) is undefined
```

### Root cause

Tomcat is compiling a JSP where `esc()` is missing or cached old class exists.

### Fix

* Ensure `esc()` is in **JSP declaration block** `<%! ... %>`
* Clear Tomcat JSP cache:

```bash
sudo rm -rf /opt/tomcat/work/Catalina/localhost/webapp
sudo systemctl restart tomcat
```

---

## 15. Connecting Pages (UI Flow)

1. `index.jsp` → links to `register.jsp`
2. `register.jsp` → form submits to `register-success.jsp`
3. `register-success.jsp` → shows values and links back to index/register

---

## 16. Automation: Poll SCM (CI/CD)

### Enable Poll SCM

Job → Configure → Build Triggers → check **Poll SCM**

Example schedule:

* Every minute:

```
* * * * *
```

### Verification

1. Change any text in JSP (like title)
2. Commit and push to GitHub
3. Jenkins automatically builds + deploys
4. Refresh Tomcat app page → should show updated UI

This is your **CI/CD proof**.

---

## 17. Final Verification Checklist

### Jenkins Server

* Jenkins running
* Java and Maven configured
* Node online (swap + disk ok)
* Job builds successfully

### Tomcat Server

* Tomcat running
* manager/html works
* manager/text/list works via curl
* tomcat-users.xml has correct roles
* context.xml allows remote access

### App

* WAR deployed successfully
* `/webapp/index.jsp` loads
* registration flow works end-to-end
* Poll SCM redeploys on push

---

## 18. Suggested README Section (For Resume/GitHub)

**Project:** Automated CI/CD Pipeline for Java Web Application
**Tools:** AWS EC2, Jenkins, Maven, GitHub, Tomcat 9, Java 21
**Highlights:**

* Automated build and deployment using Poll SCM
* Maven build produces WAR artifact and Jenkins deploys to Tomcat using Manager API
* Implemented server-side JSP handling for registration flow
* Troubleshot critical infra issues: swap/temp threshold, EBS resize, Tomcat 401 authentication, Maven compatibility, JSP compilation cache


