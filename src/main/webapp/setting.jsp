<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Settings</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      color: #333;
    }
    .container {
      text-align: center;
      background: #fff;
      border-radius: 8px;
      padding: 20px 40px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    h1 {
      font-size: 24px;
      color: #555;
      margin-bottom: 10px;
    }
    p {
      font-size: 16px;
      margin: 15px 0;
    }
    .emoji {
      font-size: 50px;
      animation: bounce 1.5s infinite;
    }
    @keyframes bounce {
      0%, 20%, 50%, 80%, 100% {
        transform: translateY(0);
      }
      40% {
        transform: translateY(-15px);
      }
      60% {
        transform: translateY(-7px);
      }
    }
    .back-button {
      margin-top: 20px;
    }
    .back-button button {
      background-color: #007BFF;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }
    .back-button button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="emoji">🚧</div>
  <h1>Settings Page</h1>
  <p>Bu qism hozirda qayta ishlanmoqda. Iltimos, keyinroq tekshiring.</p>
  <div class="back-button">
    <button onclick="history.back()">Go Back</button>
  </div>
</div>
</body>
</html>
