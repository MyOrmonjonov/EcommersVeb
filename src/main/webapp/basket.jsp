<%@ page import="org.example.demo4.Basket" %>
<%@ page import="org.example.demo4.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.example.demo4.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basket</title>
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

        .basket-item {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .basket-item:last-child {
            border-bottom: none;
        }

        .basket-item img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 6px;
            margin-right: 20px;
        }

        .basket-item-details {
            flex: 1;
        }

        .basket-item-details h3 {
            margin: 0;
            font-size: 1.2em;
            color: #555;
        }

        .basket-item-details p {
            margin: 5px 0;
            color: #777;
        }

        .basket-item-actions {
            display: flex;
            align-items: center;
        }

        .basket-item-actions button {
            padding: 5px 10px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
        }

        .btn-minus {
            background-color: #ff4d4d;
        }

        .btn-plus {
            background-color: #4CAF50;
        }

        .btn-remove {
            background-color: #ff6347;
            margin-left: 10px;
        }

        .btn-minus:hover {
            background-color: #cc0000;
        }

        .btn-plus:hover {
            background-color: #45a049;
        }

        .btn-remove:hover {
            background-color: #d6452d;
        }

        .quantity {
            margin: 0 10px;
            font-size: 16px;
        }

        .total-amount {
            text-align: right;
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
            margin-top: 20px;
        }

        .empty-message {
            text-align: center;
            color: #777;
            padding: 20px 0;
        }
        .back{
            text-align: center;
            margin-top: 20px;
        }
        .place-order {
            text-align: center;
            margin-top: 20px;
        }
        .back button{
            padding: 10px 20px;
            font-size: 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .back button:hover{
            background-color: #45a049;
        }
        .place-order button {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .place-order button:hover {
            background-color: #45a049;
        }

        .login-message {
            text-align: center;
            color: #ff4d4d;
            font-size: 1.2em;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<%
    Basket basket = (Basket) session.getAttribute("basket");
    User loggedInUser = (User) session.getAttribute("loggedInUser");

    if (basket == null || basket.getMap().isEmpty()) {
%>
<div class="container">
    <h1>Your Basket</h1>
    <p class="empty-message">Your basket is empty. Add some products!</p>
</div>
<%
} else {
    double totalAmount = 0.0; // Initialize total amount
%>
<div class="container">
    <h1>Your Basket</h1>

    <%
        for (Map.Entry<Product, Integer> entry : basket.getMap().entrySet()) {
            Product product = entry.getKey();
            int quantity = entry.getValue();
            totalAmount += product.getPrice() * quantity; // Add to total amount
    %>
    <div class="basket-item">
        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
        <div class="basket-item-details">
            <h3><%= product.getName() %></h3>
            <p>Price: $<%= product.getPrice() %> x <%= quantity %> = $<%= product.getPrice() * quantity %></p>
        </div>
        <div class="basket-item-actions">
            <!-- Minus Button -->
            <form action="updateBasket.jsp" method="post" style="display: inline;">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <button type="submit" name="action" value="minus" class="btn-minus">-</button>
            </form>

            <!-- Quantity -->
            <span class="quantity"><%= quantity %></span>

            <!-- Plus Button -->
            <form action="updateBasket.jsp" method="post" style="display: inline;">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <button type="submit" name="action" value="plus" class="btn-plus">+</button>
            </form>

            <!-- Remove Button -->
            <form action="updateBasket.jsp" method="post" style="display: inline;">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <button type="submit" name="action" value="remove" class="btn-remove">Remove</button>
            </form>
        </div>
    </div>
    <% } %>

    <!-- Total Amount Section -->
    <div class="total-amount">
        Total: $<%= totalAmount %>
    </div>

    <!-- Place Order Section -->
    <% if (loggedInUser == null) { %>
    <div class="login-message">
        You need to log in to place an order.
        <div class="back">
            <form action="category.jsp">
                <button  style="background-color: #007bff ">Back</button>
            </form>
        </div>
    </div>
    <% } else { %>
    <div class="place-order">
        <form action="/createOrder" method="post">
            <button type="submit">Place Order</button>
            <div class="back">
                <form action="category.jsp">
                    <button  style="background-color: #007bff ">Back</button>
                </form>
            </div>
        </form>
    </div>
    <% } %>

</div>
<%
    }
%>

</body>
</html>
