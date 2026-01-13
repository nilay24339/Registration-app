<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>DevOps Learning Registration</title>

  <style>
    :root{
      --bg1:#0b1220;
      --bg2:#0c1a3b;
      --card: rgba(255,255,255,0.10);
      --border: rgba(255,255,255,0.18);
      --text: #eef3ff;
      --muted: rgba(238,243,255,0.72);

      --blue:#4f8cff;
      --indigo:#6a5cff;
      --pink:#ff5cab;
      --green:#2ee59d;
      --yellow:#ffd66b;

      --shadow: 0 20px 60px rgba(0,0,0,0.45);
      --radius: 16px;
    }

    *{ box-sizing:border-box; }
    body{
      margin:0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
      color: var(--text);
      min-height: 100vh;
      display:grid;
      place-items:center;
      padding: 28px 16px;
      background:
        radial-gradient(1100px 600px at 12% 10%, rgba(79,140,255,0.32), transparent 60%),
        radial-gradient(1000px 550px at 85% 25%, rgba(255,92,171,0.26), transparent 55%),
        radial-gradient(900px 500px at 50% 95%, rgba(46,229,157,0.18), transparent 55%),
        linear-gradient(180deg, var(--bg1) 0%, var(--bg2) 100%);
    }

    .shell{
      width:100%;
      max-width: 1000px;
      display:grid;
      grid-template-columns: 1.15fr 0.85fr;
      gap: 18px;
      align-items:start;
    }
    @media (max-width: 900px){
      .shell{ grid-template-columns: 1fr; }
    }

    .card{
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      overflow:hidden;
      backdrop-filter: blur(10px);
    }

    .header{
      padding: 22px 22px 18px;
      border-bottom: 1px solid rgba(255,255,255,0.12);
      background:
        linear-gradient(135deg, rgba(79,140,255,0.20), rgba(106,92,255,0.12), rgba(255,92,171,0.12));
    }

    .badge{
      display:inline-flex;
      align-items:center;
      gap:8px;
      padding: 7px 12px;
      border-radius: 999px;
      font-size: 12px;
      letter-spacing: .2px;
      color: var(--text);
      border: 1px solid rgba(255,255,255,0.20);
      background: rgba(255,255,255,0.08);
    }

    .title{
      margin: 12px 0 6px;
      font-size: 28px;
      line-height: 1.15;
      letter-spacing: .2px;
    }

    .subtitle{
      margin:0;
      color: var(--muted);
      line-height: 1.6;
      font-size: 14.5px;
    }

    .body{
      padding: 18px 22px 22px;
    }

    .grid{
      display:grid;
      grid-template-columns: 1fr 1fr;
      gap: 14px;
    }
    @media (max-width: 580px){
      .grid{ grid-template-columns: 1fr; }
    }

    label{
      font-weight: 700;
      font-size: 13px;
      color: rgba(238,243,255,0.92);
      display:block;
      margin-bottom: 7px;
    }

    .field{ display:grid; gap: 6px; }

    input{
      width:100%;
      padding: 12px 12px;
      border-radius: 12px;
      border: 1px solid rgba(255,255,255,0.20);
      background: rgba(255,255,255,0.08);
      color: var(--text);
      outline:none;
      transition: border .2s ease, background .2s ease;
    }
    input::placeholder{ color: rgba(238,243,255,0.45); }
    input:focus{
      border-color: rgba(79,140,255,0.75);
      background: rgba(255,255,255,0.11);
    }

    .hint{
      font-size: 12px;
      color: rgba(238,243,255,0.62);
      margin-top: -2px;
    }

    .row{
      display:grid;
      grid-template-columns: 1fr auto;
      gap: 10px;
      align-items:center;
    }

    .toggle{
      padding: 10px 12px;
      border-radius: 12px;
      border: 1px solid rgba(255,255,255,0.20);
      background: rgba(255,255,255,0.08);
      color: var(--text);
      cursor:pointer;
      font-weight: 700;
      font-size: 13px;
      transition: background .2s ease, border .2s ease;
      white-space: nowrap;
    }
    .toggle:hover{
      border-color: rgba(255,92,171,0.55);
      background: rgba(255,255,255,0.11);
    }

    .divider{
      height:1px;
      background: rgba(255,255,255,0.12);
      margin: 18px 0;
    }

    .policy{
      margin:0;
      color: rgba(238,243,255,0.72);
      font-size: 13px;
      line-height: 1.55;
    }
    .policy a{
      color: rgba(255,214,107,0.95);
      text-decoration:none;
      font-weight: 800;
    }
    .policy a:hover{ text-decoration: underline; }

    .btn{
      width:100%;
      margin-top: 14px;
      padding: 12px 14px;
      border: none;
      border-radius: 14px;
      cursor:pointer;
      font-weight: 900;
      font-size: 15px;
      letter-spacing: .3px;
      color: #0b1220;
      background: linear-gradient(135deg, var(--yellow), var(--green), var(--blue));
      box-shadow: 0 14px 30px rgba(46,229,157,0.18);
      transition: transform .06s ease, filter .2s ease;
    }
    .btn:hover{ filter: brightness(1.03); }
    .btn:active{ transform: translateY(1px); }

    .status{
      font-size: 12.5px;
      margin-top: 6px;
      color: rgba(238,243,255,0.65);
    }
    .status.ok{ color: rgba(46,229,157,0.98); }
    .status.bad{ color: rgba(255,92,171,0.98); }

    .signin{
      padding: 16px 22px;
      border-top: 1px solid rgba(255,255,255,0.12);
      background: rgba(255,255,255,0.03);
      text-align:center;
      color: rgba(238,243,255,0.75);
      font-size: 13.5px;
    }
    .signin a{
      color: rgba(79,140,255,0.95);
      text-decoration:none;
      font-weight: 900;
    }
    .signin a:hover{ text-decoration: underline; }

    .side{
      padding: 22px;
      display:grid;
      gap: 14px;
    }
    .side h2{
      margin:0;
      font-size: 18px;
      letter-spacing: .2px;
    }
    .side p{
      margin:0;
      color: rgba(238,243,255,0.72);
      line-height: 1.65;
      font-size: 14px;
    }
    .list{
      margin:0;
      padding-left: 18px;
      color: rgba(238,243,255,0.75);
      line-height: 1.75;
      font-size: 14px;
    }

    .mini{
      padding: 12px 14px;
      border-radius: 12px;
      border: 1px solid rgba(255,255,255,0.14);
      background: rgba(255,255,255,0.06);
      color: rgba(238,243,255,0.78);
      font-size: 12.5px;
      line-height: 1.5;
    }
  </style>
</head>

<body>
  <div class="shell">

    <!-- MAIN CARD -->
    <div class="card">
      <div class="header">
        <span class="badge">CI/CD Demo • GitHub → Jenkins → Tomcat</span>
        <h1 class="title">DevOps Learning Registration</h1>
        <p class="subtitle">
          Register to join our learning community and practice CI/CD deployments with real updates.
        </p>
      </div>

      <div class="body">
        <form action="register-success.jsp" method="post" autocomplete="on">

          <div class="grid">
            <div class="field">
              <label for="name">Full Name</label>
              <input type="text" id="name" name="name" placeholder="e.g., Nilay Mishra" required />
              <div class="hint">Enter your first and last name.</div>
            </div>

            <div class="field">
              <label for="mobile">Mobile Number</label>
              <input type="tel" id="mobile" name="mobile"
                     placeholder="10-digit mobile number"
                     inputmode="numeric"
                     pattern="[0-9]{10}"
                     title="Enter a valid 10-digit mobile number"
                     required />
              <div class="hint">Digits only (example: 9876543210).</div>
            </div>

            <div class="field" style="grid-column: 1 / -1;">
              <label for="email">Email Address</label>
              <input type="email" id="email" name="email" placeholder="e.g., name@example.com" required />
              <div class="hint">Used only for communication and verification.</div>
            </div>

            <div class="field">
              <label for="psw">Password</label>
              <div class="row">
                <input type="password" id="psw" name="psw"
                       placeholder="Minimum 8 characters"
                       minlength="8" required oninput="checkPasswordMatch()" />
                <button type="button" class="toggle" onclick="togglePassword()">Show</button>
              </div>
              <div class="hint">Use a strong password (letters + numbers + symbols).</div>
            </div>

            <div class="field">
              <label for="pswRepeat">Confirm Password</label>
              <input type="password" id="pswRepeat" name="pswRepeat"
                     placeholder="Re-enter password"
                     minlength="8" required oninput="checkPasswordMatch()" />
              <div id="matchStatus" class="status">Please re-enter the same password.</div>
            </div>
          </div>

          <div class="divider"></div>

          <p class="policy">
            By creating an account, you agree to our
            <a href="#" target="_blank" rel="noopener noreferrer">Terms</a> and
            <a href="#" target="_blank" rel="noopener noreferrer">Privacy Policy</a>.
          </p>

          <button type="submit" class="btn">Create Account</button>

        </form>
      </div>

      <div class="signin">
        Already have an account? <a href="#">Sign in</a>
      </div>
    </div>

    <!-- SIDE CARD -->
    <div class="card">
      <div class="side">
        <h2>Project Highlights</h2>
        <p>
          This page is part of a CI/CD demo project where code changes trigger Jenkins builds and deploy updates to Tomcat automatically.
        </p>

        <ul class="list">
          <li>Poll SCM / Webhook triggers Jenkins automatically</li>
          <li>Maven builds WAR artifact</li>
          <li>Tomcat Manager deploys updated WAR</li>
          <li>Verification using URL health check</li>
        </ul>

        <div class="mini">
          Tip: Make a small change in this page (title/text), commit to GitHub, and verify Jenkins redeploy by refreshing the Tomcat URL.
        </div>

        <div class="divider"></div>

        <p><b>Thank you & happy learning.</b><br/>See you again.</p>
      </div>
    </div>

  </div>

  <script>
    function togglePassword() {
      const psw = document.getElementById("psw");
      const btn = document.querySelector(".toggle");
      const isHidden = psw.type === "password";
      psw.type = isHidden ? "text" : "password";
      btn.textContent = isHidden ? "Hide" : "Show";
    }

    function checkPasswordMatch() {
      const p1 = document.getElementById("psw").value;
      const p2 = document.getElementById("pswRepeat").value;
      const el = document.getElementById("matchStatus");

      if (!p1 || !p2) {
        el.className = "status";
        el.textContent = "Please re-enter the same password.";
        return;
      }

      if (p1 === p2) {
        el.className = "status ok";
        el.textContent = "Passwords match.";
      } else {
        el.className = "status bad";
        el.textContent = "Passwords do not match.";
      }
    }
  </script>
</body>
</html>
