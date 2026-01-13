<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>DevOps Learning | Home</title>

  <style>
    :root{
      --bg1:#070b14; --bg2:#0b1838;
      --card:rgba(255,255,255,0.10);
      --border:rgba(255,255,255,0.18);
      --text:#eef3ff; --muted:rgba(238,243,255,0.72);
      --blue:#4f8cff; --indigo:#6a5cff; --pink:#ff5cab; --green:#2ee59d; --yellow:#ffd66b;
      --shadow:0 18px 55px rgba(0,0,0,0.45);
      --radius:18px;
    }
    *{box-sizing:border-box}
    body{
      margin:0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
      color:var(--text);
      min-height:100vh;
      display:grid;
      place-items:center;
      padding:28px 16px;
      background:
        radial-gradient(1100px 600px at 12% 10%, rgba(79,140,255,0.33), transparent 60%),
        radial-gradient(1000px 550px at 85% 22%, rgba(255,92,171,0.26), transparent 55%),
        radial-gradient(900px 520px at 52% 96%, rgba(46,229,157,0.18), transparent 55%),
        linear-gradient(180deg, var(--bg1) 0%, var(--bg2) 100%);
    }
    .shell{width:100%; max-width:980px; display:grid; gap:18px; grid-template-columns:1.2fr 0.8fr; align-items:start;}
    @media(max-width:900px){.shell{grid-template-columns:1fr}}
    .card{
      background:var(--card);
      border:1px solid var(--border);
      border-radius:var(--radius);
      box-shadow:var(--shadow);
      overflow:hidden;
      backdrop-filter: blur(10px);
    }
    .header{
      padding:22px 22px 18px;
      border-bottom:1px solid rgba(255,255,255,0.12);
      background: linear-gradient(135deg, rgba(79,140,255,0.22), rgba(106,92,255,0.12), rgba(255,92,171,0.12));
    }
    .badge{
      display:inline-flex; align-items:center; gap:8px;
      padding:7px 12px; border-radius:999px; font-size:12px; letter-spacing:.2px;
      background:rgba(255,255,255,0.08); border:1px solid rgba(255,255,255,0.20);
    }
    .title{margin:12px 0 6px; font-size:30px; line-height:1.12; letter-spacing:.2px;}
    .subtitle{margin:0; color:var(--muted); line-height:1.7; font-size:14.5px;}
    .body{padding:18px 22px 22px;}
    .ctaRow{display:flex; flex-wrap:wrap; gap:10px; margin-top:14px;}
    .btn{
      display:inline-flex; align-items:center; justify-content:center;
      padding:12px 14px; border-radius:14px; text-decoration:none;
      font-weight:900; letter-spacing:.25px; border:1px solid rgba(255,255,255,0.18);
      cursor:pointer;
    }
    .btnPrimary{
      color:#0b1220;
      background: linear-gradient(135deg, var(--yellow), var(--green), var(--blue));
      box-shadow: 0 14px 30px rgba(46,229,157,0.18);
      border:none;
    }
    .btnGhost{
      color:var(--text);
      background: rgba(255,255,255,0.06);
    }
    .btn:hover{filter:brightness(1.03)}
    .grid2{display:grid; gap:12px; grid-template-columns:1fr 1fr; margin-top:14px;}
    @media(max-width:650px){.grid2{grid-template-columns:1fr}}
    .mini{
      border-radius:14px;
      border:1px solid rgba(255,255,255,0.14);
      background: rgba(255,255,255,0.06);
      padding:14px;
    }
    .mini h3{margin:0 0 6px; font-size:14px; letter-spacing:.2px;}
    .mini p{margin:0; color:rgba(238,243,255,0.72); line-height:1.6; font-size:13.5px;}
    .side{padding:22px; display:grid; gap:12px;}
    .side h2{margin:0; font-size:18px; letter-spacing:.2px;}
    .side ul{margin:0; padding-left:18px; color:rgba(238,243,255,0.75); line-height:1.75; font-size:14px;}
    .footer{
      padding:14px 22px;
      border-top:1px solid rgba(255,255,255,0.12);
      background: rgba(255,255,255,0.03);
      color:rgba(238,243,255,0.70);
      font-size:13px;
      text-align:center;
    }
  </style>
</head>
<body>

  <div class="shell">
    <div class="card">
      <div class="header">
        <span class="badge">CI/CD Demo • GitHub → Jenkins → Tomcat</span>
        <h1 class="title">DevOps Learning Portal</h1>
        <p class="subtitle">
          A professional demo application to showcase automated build and deployment using Jenkins (Poll SCM) and Tomcat.
        </p>
      </div>

      <div class="body">
        <div class="ctaRow">
          <a class="btn btnPrimary" href="register.jsp">Open Registration</a>
          <a class="btn btnGhost" href="register-success.jsp">View Success Page (demo)</a>
        </div>

        <div class="grid2">
          <div class="mini">
            <h3>How to verify CI/CD</h3>
            <p>Update any text on this page, commit to GitHub, wait for Jenkins Poll SCM, then refresh the URL to confirm the latest deployment.</p>
          </div>
          <div class="mini">
            <h3>Deployment Proof Tip</h3>
            <p>Add a version note like “Last Updated” and modify it each commit. This becomes visible evidence of continuous deployment.</p>
          </div>
        </div>
      </div>

      <div class="footer">
        Thank you for visiting. Happy learning.
      </div>
    </div>

    <div class="card">
      <div class="side">
        <h2>Project Highlights</h2>
        <ul>
          <li>Automatic trigger via Poll SCM</li>
          <li>Maven builds WAR artifact</li>
          <li>Deploy to container (Tomcat Manager)</li>
          <li>Browser-based validation after deployment</li>
        </ul>
      </div>
      <div class="footer">
        Go next: Registration → Submit → Confirmation
      </div>
    </div>
  </div>

</body>
</html>
