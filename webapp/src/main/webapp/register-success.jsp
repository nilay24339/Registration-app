<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%! 
  // JSP Declaration: helper method must be here (NOT inside <% %>)
  public String esc(String s) {
    if (s == null) return "";
    return s.replace("&","&amp;")
            .replace("<","&lt;")
            .replace(">","&gt;")
            .replace("\"","&quot;")
            .replace("'","&#x27;");
  }
%>

<%
  request.setCharacterEncoding("UTF-8");

  String name = request.getParameter("name");
  String mobile = request.getParameter("mobile");
  String email = request.getParameter("email");

  // Prevent direct access without form submit
  if (name == null || name.trim().isEmpty()) {
    response.sendRedirect("register.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>DevOps Learning | Success</title>

  <style>
    :root{
      --bg1:#070b14; --bg2:#0b1838;
      --card:rgba(255,255,255,0.10);
      --border:rgba(255,255,255,0.18);
      --text:#eef3ff; --muted:rgba(238,243,255,0.72);
      --blue:#4f8cff; --pink:#ff5cab; --green:#2ee59d; --yellow:#ffd66b;
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
    .card{
      width:100%;
      max-width: 900px;
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
      background: linear-gradient(135deg, rgba(46,229,157,0.22), rgba(79,140,255,0.16), rgba(255,92,171,0.14));
    }
    .title{margin:0; font-size:26px; letter-spacing:.2px;}
    .subtitle{margin:8px 0 0; color:var(--muted); line-height:1.7; font-size:14.5px;}
    .body{padding:18px 22px 22px;}
    .grid{display:grid; grid-template-columns:1fr 1fr; gap:14px;}
    @media(max-width:700px){.grid{grid-template-columns:1fr}}
    .box{
      border-radius:14px;
      border:1px solid rgba(255,255,255,0.14);
      background: rgba(255,255,255,0.06);
      padding:14px;
    }
    .label{
      font-size:12px;
      color:rgba(238,243,255,0.62);
      font-weight:900;
      letter-spacing:.25px;
      text-transform:uppercase;
      margin-bottom:6px;
    }
    .value{
      font-size:15px;
      font-weight:900;
      word-break: break-word;
    }
    .actions{
      margin-top: 16px;
      display:flex;
      flex-wrap:wrap;
      gap:10px;
    }
    .btn{
      display:inline-flex;
      align-items:center;
      justify-content:center;
      padding:12px 14px;
      border-radius:14px;
      text-decoration:none;
      font-weight:900;
      letter-spacing:.25px;
      color:#0b1220;
      background: linear-gradient(135deg, var(--yellow), var(--green), var(--blue));
      border:none;
    }
    .btnGhost{
      color:var(--text);
      background: rgba(255,255,255,0.06);
      border: 1px solid rgba(255,255,255,0.18);
    }
    .btn:hover{filter:brightness(1.03)}
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
  <div class="card">
    <div class="header">
      <h1 class="title">Registration Successful</h1>
      <p class="subtitle">Thank you for registering. Below are the details you submitted.</p>
    </div>

    <div class="body">
      <div class="grid">
        <div class="box">
          <div class="label">Full Name</div>
          <div class="value"><%= esc(name) %></div>
        </div>
        <div class="box">
          <div class="label">Mobile</div>
          <div class="value"><%= esc(mobile) %></div>
        </div>
        <div class="box">
          <div class="label">Email</div>
          <div class="value"><%= esc(email) %></div>
        </div>
        <div class="box">
          <div class="label">Status</div>
          <div class="value">Active • Welcome to DevOps Learning</div>
        </div>
      </div>

      <div class="actions">
        <a class="btn" href="index.jsp">Go to Home</a>
        <a class="btn btnGhost" href="register.jsp">Register Another User</a>
      </div>
    </div>

    <div class="footer">
      CI/CD Demo: Refresh after Jenkins deployment to confirm updates.
    </div>
  </div>
</body>
</html>
