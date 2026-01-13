<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>DevOps Learning Registration</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
      background-color: #f4f6f8;
    }

    .container {
      max-width: 500px;
      margin: 40px auto;
      background: #ffffff;
      padding: 25px;
      border-radius: 6px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h1 {
      text-align: center;
      color: #2c3e50;
    }

    p {
      text-align: center;
      color: #555;
    }

    label {
      font-weight: bold;
      display: block;
      margin-top: 15px;
    }

    input {
      width: 100%;
      padding: 10px;
      margin-top: 6px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    input:focus {
      border-color: #007bff;
      outline: none;
    }

    hr {
      margin: 25px 0;
      border: 0;
      border-top: 1px solid #eee;
    }

    .registerbtn {
      background-color: #007bff;
      color: white;
      padding: 12px;
      margin-top: 20px;
      border: none;
      cursor: pointer;
      width: 100%;
      font-size: 16px;
      border-radius: 4px;
    }

    .registerbtn:hover {
      background-color: #0056b3;
    }

    .signin {
      text-align: center;
      margin-top: 20px;
    }

    .footer-msg {
      text-align: center;
      margin-top: 30px;
      color: #2c3e50;
    }
  </style>
</head>

<body>

<form action="action_page.php" method="post">

  <div class="container">
    <h1>DevOps Learning Registration</h1>
    <p>Join <b>Virtual TechBox YouTube Channel</b> and start your DevOps journey.</p>

    <hr>

    <label for="name">Full Name</label>
    <input type="text" id="name" name="name" placeholder="Enter your full name" required>

    <label for="mobile">Mobile Number</label>
    <input type="tel" id="mobile" name="mobile" placeholder="Enter mobile number"
           pattern="[0-9]{10}" title="Enter a valid 10-digit mobile number" required>

    <label for="email">Email Address</label>
    <input type="email" id="email" name="email" placeholder="Enter email address" required>

    <label for="psw">Password</label>
    <input type="password" id="psw" name="psw"
           placeholder="Enter password (min 6 characters)"
           minlength="6" required>

    <label for="psw-repeat">Confirm Password</label>
    <input type="password" id="psw-repeat" name="psw-repeat"
           placeholder="Re-enter password" minlength="6" required>

    <hr>

    <p>
      By creating an account, you agree to our
      <a href="#">Terms & Privacy Policy</a>.
    </p>

    <button type="submit" class="registerbtn">Register</button>
  </div>

  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a></p>
  </div>

  <div class="footer-msg">
    <h2>Thank You & Happy Learning 🚀</h2>
    <p>See you again!</p>
  </div>

</form>

</body>
</html>
