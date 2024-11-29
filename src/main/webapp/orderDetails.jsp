<%@ page import="org.example.demo4.Order" %>
<%@ page import="org.example.demo4.OrderItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
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

        .order-details {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .order-details p {
            margin: 5px 0;
            color: #555;
        }

        .items-list {
            list-style: none;
            padding: 0;
        }

        .items-list li {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #f9f9f9;
        }

        .item-details {
            margin-left: 20px;
            color: #444;
        }

        .empty-message {
            text-align: center;
            color: #777;
            padding: 20px 0;
        }
    </style>
</head>
<body>

<%

    String orderId = request.getParameter("orderId");


    List<Order> orders = (List<Order>) session.getAttribute("orders");
    Order selectedOrder = null;


    if (orders != null) {
        for (Order order : orders) {
            if (order.getId().equals(orderId)) {
                selectedOrder = order;
                break;
            }
        }
    }
%>

<%
    if (selectedOrder != null) {
%>
<div class="container">
    <h1>Order Details</h1>

    <div class="order-details">
        <p><strong>Order ID:</strong> <%= selectedOrder.getId() %></p>
        <p><strong>Order Date:</strong> <%= selectedOrder.getOrderDate() %></p>
        <p><strong>Total Amount:</strong> $<%= selectedOrder.getTotalAmount() %></p>
    </div>

    <h2>Order Items</h2>
    <ul class="items-list">
        <% for (OrderItem item : selectedOrder.getItems()) { %>
        <li>
            <strong>Product:</strong> <%= item.getProduct().getName() %><br>
            <div class="item-details">
                <p>Price: $<%= item.getProduct().getPrice() %></p>
                <p>Quantity: <%= item.getQuantity() %></p>
                <p>Total: $<%= item.getTotalPrice() %></p>
            </div>
        </li>
        <% } %>
    </ul>
</div>
<%
} else {
%>
<div class="container">
    <p class="empty-message">Order not found.</p>
</div>
<%
    }
%>

</body>
</html>
