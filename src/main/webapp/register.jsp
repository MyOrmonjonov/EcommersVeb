<%@ page import="org.example.demo4.DB" %>
<%@ page import="org.example.demo4.User" %>
<%
  String success = request.getParameter("success");
  String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
      background-color: #f4f4f4;
    }
    .register-container {
      max-width: 400px;
      margin: auto;
      padding: 20px;
      background-color: white;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    h2 {
      text-align: center;
    }
    label {
      display: block;
      margin: 10px 0 5px;
    }
    input[type="text"], input[type="password"] {
      width: 100%;
      padding: 8px;
      margin: 5px 0 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .btn {
      width: 100%;
      padding: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 16px;
      border-radius: 5px;
    }
    .btn:hover {
      background-color: #45a049;
    }
    .success-message, .error-message {
      text-align: center;
      font-size: 14px;
    }
    .success-message {
      color: green;
    }
    .error-message {
      color: red;
    }
  </style>
</head>
<body>

<div class="register-container">
  <h2>Register</h2>
  <form action="registerAction.jsp" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>

    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" required>

    <br>
    <button type="submit" class="btn">Register</button>
  </form>

  <% if (success != null) { %>
  <div class="success-message">
    <p>Registration successful! You can now <a href="login.jsp">Login</a>.</p>
  </div>
  <% } %>
  <% if (error != null) { %>
  <div class="error-message">
    <p>Username already exists. Please choose another.</p>
  </div>
  <% } %>
</div>

</body>
</html>
