<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%
  request.setCharacterEncoding("UTF-8");

  String name = request.getParameter("name");
  String mobile = request.getParameter("mobile");
  String email = request.getParameter("email");

  if (name == null) name = "";
  if (mobile == null) mobile = "";
  if (email == null) email = "";

  // Escape output to avoid XSS
  String safeName = StringEscapeUtils.escapeHtml4(name);
  String safeMobile = StringEscapeUtils.escapeHtml4(mobile);
  String safeEmail = StringEscapeUtils.escapeHtml4(email);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registration Successful</title>
  <style>
    body{
      margin:0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
      background: linear-gradient(180deg, #070b14 0%, #0b1220 100%);
      color:#eef3ff;
      min-height:100vh;
      display:grid;
      place-items:center;
      padding: 22px;
    }
    .box{
      width:100%;
      max-width: 720px;
      border-radius: 16px;
      border:1px solid rgba(255,255,255,0.16);
      background: rgba(255,255,255,0.08);
      box-shadow: 0 20px 60px rgba(0,0,0,0.45);
      overflow:hidden;
    }
    .top{
      padding: 18px 22px;
      background: linear-gradient(135deg, rgba(46,229,157,0.22), rgba(79,140,255,0.16), rgba(255,92,171,0.14));
      border-bottom: 1px solid rgba(255,255,255,0.12);
    }
    h1{ margin:0; font-size: 22px; }
    p{ margin:8px 0 0; color: rgba(238,243,255,0.75); }

    .content{
      padding: 18px 22px 22px;
    }
    .grid{
      display:grid;
      grid-template-columns: 1fr 1fr;
      gap: 14px;
      margin-top: 10px;
    }
    @media (max-width: 680px){
      .grid{ grid-template-columns: 1fr; }
    }
    .card{
      border-radius: 14px;
      border: 1px solid rgba(255,255,255,0.14);
      background: rgba(255,255,255,0.06);
      padding: 14px;
    }
    .label{
      font-size: 12px;
      color: rgba(238,243,255,0.62);
      margin-bottom: 6px;
      font-weight: 800;
      letter-spacing: .2px;
      text-transform: uppercase;
    }
    .value{
      font-size: 15px;
      font-weight: 800;
      color:#eef3ff;
      word-break: break-word;
    }
    .btn{
      display:inline-block;
      margin-top: 16px;
      padding: 12px 14px;
      border-radius: 14px;
      text-decoration:none;
      font-weight: 900;
      color:#0b1220;
      background: linear-gradient(135deg, #ffd66b, #2ee59d, #4f8cff);
    }
  </style>
</head>

<body>
  <div class="box">
    <div class="top">
      <h1>Registration Successful</h1>
      <p>Thank you for registering. Your details are captured below.</p>
    </div>

    <div class="content">
      <div class="grid">
        <div class="card">
          <div class="label">Full Name</div>
          <div class="value"><%= safeName %></div>
        </div>
        <div class="card">
          <div class="label">Mobile</div>
          <div class="value"><%= safeMobile %></div>
        </div>
        <div class="card">
          <div class="label">Email</div>
          <div class="value"><%= safeEmail %></div>
        </div>
        <div class="card">
          <div class="label">Status</div>
          <div class="value">Active • Welcome to DevOps Learning</div>
        </div>
      </div>

      <a class="btn" href="register.jsp">Back to Registration</a>
    </div>
  </div>
</body>
</html>
