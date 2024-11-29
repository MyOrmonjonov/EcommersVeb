<%@ page import="org.example.demo4.Order" %>
<%@ page import="org.example.demo4.OrderItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.demo4.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .order {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 6px;
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .order-details {
            font-size: 16px;
        }

        .order-details p {
            margin: 5px 0;
            color: #555;
        }

        .order-actions button {
            padding: 8px 15px;
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .order-actions button:hover {
            background-color: #45a049;
        }

        .item-details {
            margin-top: 10px;
            padding: 10px;
            border-top: 1px solid #ddd;
            background-color: #f9f9f9;
        }

        .empty-message {
            text-align: center;
            color: #777;
            padding: 20px 0;
        }

        .back-button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-align: center;
            display: block;
            width: 100px;
            margin-left: auto;
            margin-right: auto;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>


<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    List<Order> orders = (List<Order>) session.getAttribute("orders");

    if (loggedInUser == null) {
%>
<div class="container">
    <h1>Your Orders</h1>
    <p class="empty-message">Please log in to view your orders.</p>
</div>
<%
} else if (orders == null || orders.isEmpty()) {
%>
<div class="container">
    <h1>Your Orders</h1>
    <p class="empty-message">You have no orders yet. Place an order to see it here!</p>
</div>
<%
} else {
%>
<div class="container">
    <h1>Your Orders</h1>
    <% for (Order order : orders) {
        if (order.getUserId() == loggedInUser.getUserId()) {
    %>
    <div class="order">
        <div class="order-details">
            <p><strong>Order ID:</strong> <%= order.getId() %></p>
            <p><strong>Date:</strong> <%= order.getOrderDate() %></p>
            <p><strong>Total Amount:</strong> $<%= order.getTotalAmount() %></p>
        </div>

        <div class="item-details">
            <h3>Items in this Order:</h3>
            <% if (order.getItems() != null && !order.getItems().isEmpty()) { %>
            <ul>
                <% for (OrderItem item : order.getItems()) { %>
                <li>
                    <strong><%= item.getProduct().getName() %></strong><br>
                    Price: $<%= item.getProduct().getPrice() %> x <%= item.getQuantity() %> = $<%= item.getTotalPrice() %>
                </li>
                <% } %>
            </ul>
            <% } else { %>
            <p>No items in this order.</p>
            <% } %>
        </div>
    </div>
    <% } %>
    <% } %>
</div>
<%
    }
%>

<div class="container">
    <a href="category.jsp" style=" margin-top: 20px;
      padding: 10px 20px;
      font-size: 16px;
      color: white;
      background-color: #007bff;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      text-align: center;
      display: block;
      width: 100px;
      margin-left: auto;
      margin-right: auto;" >Back</a>
</div>

</body>
</html>
