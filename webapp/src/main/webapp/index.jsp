<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>DevOps Learning Registration</title>

  <style>
    :root{
      --bg: #0b1220;
      --card: rgba(255,255,255,0.08);
      --card-border: rgba(255,255,255,0.14);
      --text: #e8eefc;
      --muted: rgba(232,238,252,0.72);
      --input: rgba(255,255,255,0.10);
      --input-border: rgba(255,255,255,0.18);
      --primary: #4f8cff;
      --primary-2: #2f6fff;
      --danger: #ff5a6a;
      --success: #25d366;
      --shadow: 0 20px 60px rgba(0,0,0,0.45);
      --radius: 14px;
    }

    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
      color: var(--text);
      background: radial-gradient(1200px 600px at 20% 10%, rgba(79,140,255,0.25), transparent 60%),
                  radial-gradient(900px 500px at 80% 30%, rgba(37,211,102,0.18), transparent 60%),
                  linear-gradient(180deg, #070b14 0%, #0b1220 100%);
      min-height: 100vh;
      display: grid;
      place-items: center;
      padding: 28px 16px;
    }

    .shell {
      width: 100%;
      max-width: 980px;
      display: grid;
      grid-template-columns: 1.1fr 0.9fr;
      gap: 18px;
      align-items: start;
    }

    @media (max-width: 900px) {
      .shell { grid-template-columns: 1fr; }
    }

    .card {
      border: 1px solid var(--card-border);
      background: var(--card);
      box-shadow: var(--shadow);
      border-radius: var(--radius);
      overflow: hidden;
      backdrop-filter: blur(10px);
    }

    .card-header {
      padding: 22px 22px 18px;
      border-bottom: 1px solid rgba(255,255,255,0.12);
      background: linear-gradient(135deg, rgba(79,140,255,0.16), rgba(255,255,255,0.02));
    }

    .badge {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      font-size: 12px;
      padding: 6px 10px;
      border-radius: 999px;
      background: rgba(79,140,255,0.18);
      border: 1px solid rgba(79,140,255,0.35);
      color: var(--text);
      letter-spacing: 0.2px;
    }

    .title {
      margin: 12px 0 6px;
      font-size: 26px;
      line-height: 1.15;
      letter-spacing: 0.2px;
    }

    .subtitle {
      margin: 0;
      color: var(--muted);
      line-height: 1.5;
      font-size: 14.5px;
    }

    .card-body {
      padding: 18px 22px 22px;
    }

    .grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 14px;
    }

    @media (max-width: 560px) {
      .grid { grid-template-columns: 1fr; }
    }

    .field {
      display: grid;
      gap: 7px;
    }

    label {
      font-weight: 600;
      font-size: 13px;
      color: rgba(232,238,252,0.92);
    }

    .hint {
      font-size: 12px;
      color: rgba(232,238,252,0.62);
      margin-top: -2px;
    }

    input {
      width: 100%;
      padding: 12px 12px;
      border-radius: 10px;
      border: 1px solid var(--input-border);
      background: var(--input);
      color: var(--text);
      outline: none;
      transition: border 0.2s ease, transform 0.05s ease, background 0.2s ease;
    }

    input::placeholder { color: rgba(232,238,252,0.45); }

    input:focus {
      border-color: rgba(79,140,255,0.75);
      background: rgba(255,255,255,0.12);
    }

    .row {
      display: grid;
      grid-template-columns: 1fr auto;
      gap: 10px;
      align-items: center;
    }

    .toggle-btn {
      padding: 10px 12px;
      border-radius: 10px;
      border: 1px solid var(--input-border);
      background: rgba(255,255,255,0.08);
      color: var(--text);
      cursor: pointer;
      transition: background 0.2s ease, border 0.2s ease;
      font-size: 13px;
      white-space: nowrap;
    }
    .toggle-btn:hover {
      background: rgba(255,255,255,0.12);
      border-color: rgba(79,140,255,0.45);
    }

    .divider {
      height: 1px;
      background: rgba(255,255,255,0.10);
      margin: 18px 0;
    }

    .policy {
      margin: 0;
      color: rgba(232,238,252,0.70);
      font-size: 13px;
      line-height: 1.5;
    }

    .policy a {
      color: rgba(79,140,255,0.95);
      text-decoration: none;
    }
    .policy a:hover { text-decoration: underline; }

    .actions {
      display: grid;
      gap: 10px;
      margin-top: 14px;
    }

    .btn {
      width: 100%;
      padding: 12px 14px;
      border: none;
      border-radius: 12px;
      cursor: pointer;
      color: white;
      font-weight: 700;
      font-size: 15px;
      letter-spacing: 0.2px;
      background: linear-gradient(135deg, var(--primary), var(--primary-2));
      box-shadow: 0 10px 25px rgba(79,140,255,0.28);
      transition: transform 0.06s ease, filter 0.2s ease;
    }
    .btn:hover { filter: brightness(1.03); }
    .btn:active { transform: translateY(1px); }

    .status {
      font-size: 12.5px;
      margin-top: 6px;
      color: rgba(232,238,252,0.65);
    }

    .status.ok { color: rgba(37,211,102,0.95); }
    .status.bad { color: rgba(255,90,106,0.95); }

    /* Right panel */
    .side {
      padding: 22px;
      display: grid;
      gap: 14px;
    }

    .side h2 {
      margin: 0;
      font-size: 18px;
      letter-spacing: 0.2px;
    }

    .side p {
      margin: 0;
      color: rgba(232,238,252,0.70);
      line-height: 1.6;
      font-size: 14px;
      text-align: left;
    }

    .list {
      margin: 0;
      padding-left: 18px;
      color: rgba(232,238,252,0.72);
      line-height: 1.7;
      font-size: 14px;
    }

    .signin {
      padding: 16px 22px;
      border-top: 1px solid rgba(255,255,255,0.12);
      background: rgba(255,255,255,0.03);
      text-align: center;
      color: rgba(232,238,252,0.75);
      font-size: 13.5px;
    }
    .signin a {
      color: rgba(79,140,255,0.95);
      text-decoration: none;
      font-weight: 700;
    }
    .signin a:hover { text-decoration: underline; }

    .footer-msg {
      text-align: center;
      color: rgba(232,238,252,0.78);
      margin-top: 14px;
      font-size: 13px;
    }
  </style>
</head>

<body>

  <div class="shell">

    <!-- Main registration card -->
    <div class="card">
      <div class="card-header">
        <span class="badge">CI/CD Demo • Jenkins → Tomcat</span>
        <h1 class="title">DevOps Learning Registration</h1>
        <p class="subtitle">
          Join <b>DevOps Learning YouTube Channel</b> and start your DevOps journey with structured learning and hands-on practice.
        </p>
      </div>

      <div class="card-body">
        <form action="action_page.php" method="post" autocomplete="on">

          <div class="grid">
            <div class="field">
              <label for="name">Full Name</label>
              <input type="text" id="name" name="name" placeholder="e.g., Nilay Mishra" required />
              <div class="hint">Enter your first and last name.</div>
            </div>

            <div class="field">
              <label for="mobile">Mobile Number</label>
              <input
                type="tel"
                id="mobile"
                name="mobile"
                placeholder="10-digit mobile number"
                inputmode="numeric"
                pattern="[0-9]{10}"
                title="Enter a valid 10-digit mobile number"
                required
              />
              <div class="hint">Digits only (example: 9876543210).</div>
            </div>

            <div class="field" style="grid-column: 1 / -1;">
              <label for="email">Email Address</label>
              <input type="email" id="email" name="email" placeholder="e.g., name@example.com" required />
              <div class="hint">We will use this email for communication only.</div>
            </div>

            <div class="field">
              <label for="psw">Password</label>
              <div class="row">
                <input
                  type="password"
                  id="psw"
                  name="psw"
                  placeholder="Minimum 8 characters"
                  minlength="8"
                  required
                />
                <button type="button" class="toggle-btn" onclick="togglePassword()">Show</button>
              </div>
              <div class="hint">Use at least 8 characters with numbers and symbols.</div>
            </div>

            <div class="field">
              <label for="psw-repeat">Confirm Password</label>
              <input
                type="password"
                id="psw-repeat"
                name="psw-repeat"
                placeholder="Re-enter password"
                minlength="8"
                required
                oninput="checkPasswordMatch()"
              />
              <div id="matchStatus" class="status">Please re-enter the same password.</div>
            </div>
          </div>

          <div class="divider"></div>

          <p class="policy">
            By creating an account, you agree to our
            <a href="#" target="_blank" rel="noopener noreferrer">Terms</a> &
            <a href="#" target="_blank" rel="noopener noreferrer">Privacy Policy</a>.
          </p>

          <div class="actions">
            <button type="submit" class="btn">Create Account</button>
          </div>

        </form>
      </div>

      <div class="signin">
        Already have an account? <a href="#">Sign in</a>
      </div>
    </div>

    <!-- Side info card -->
    <div class="card">
      <div class="side">
        <h2>What you will learn</h2>
        <p>
          This form page is part of a CI/CD project where changes are pushed to GitHub,
          Jenkins automatically builds the WAR file, and Tomcat redeploys the updated application.
        </p>

        <ul class="list">
          <li>GitHub → Jenkins automation (Poll SCM/Webhook)</li>
          <li>Maven build and WAR packaging</li>
          <li>Tomcat deployment and verification</li>
          <li>End-to-end CI/CD validation</li>
        </ul>

        <div class="divider"></div>

        <p><b>Thank you and happy learning.</b><br/>See you again.</p>
        <p class="footer-msg">Tip: After every commit, refresh the Tomcat URL to confirm deployment.</p>
      </div>
    </div>

  </div>

  <script>
    function togglePassword() {
      const psw = document.getElementById("psw");
      const btn = document.querySelector(".toggle-btn");
      const isHidden = psw.type === "password";
      psw.type = isHidden ? "text" : "password";
      btn.textContent = isHidden ? "Hide" : "Show";
    }

    function checkPasswordMatch() {
      const p1 = document.getElementById("psw").value;
      const p2 = document.getElementById("psw-repeat").value;
      const el = document.getElementById("matchStatus");

      if (!p2) {
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

