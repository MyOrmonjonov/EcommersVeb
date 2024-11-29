<%@ page import="org.example.demo4.DB" %>
<%@ page import="org.example.demo4.Category" %>
<%@ page import="org.example.demo4.Product" %>
<%@ page import="org.example.demo4.Basket" %>
<%@ page import="org.example.demo4.User" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            position: relative;
        }
        .header a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #007bff;
            border-radius: 5px;
        }
        .header a:hover {
            background-color: #0056b3;
        }
        .user-info {
            position: absolute;
            top: 10px;
            left: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .user-info img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: 2px solid white;
        }
        .user-info p {
            margin: 0;
            color: white;
        }
        .container {
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            background-color: #333;
            color: white;
            width: 250px;
            padding: 15px;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li form button {
            width: 100%;
            background-color: transparent;
            border: none;
            color: white;
            padding: 10px;
            text-align: left;
            cursor: pointer;
        }
        .main-content {
            flex: 1;
            background-color: #f9f9f9;
            padding: 20px;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }
        .product-card {
            border-radius: 5px;
            background-color: white;
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
        }
        .product-card img {
            height: 100%;
            max-width: 100%;
        }
        .product-card button {
            border-radius: 5px;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }
        .add-btn {
            background-color: #4CAF50;
            color: white;
        }
        .add-btn:hover {
            background-color: #45a049;
        }
        .remove-btn {
            background-color: #FF0000;
            color: white;
        }
        .remove-btn:hover {
            background-color: #CC0000;
        }
    </style>
</head>
<body>
<%
    Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
    session.setAttribute("basket", basket);
    User loggedInUser = (User) session.getAttribute("loggedInUser");
%>

<div class="header">
    <h1 style="margin-left: 650px">Product Page</h1>

    <ul style="display: flex; gap: 20px; list-style: none; padding: 0; margin-left: auto; margin-right: auto; font-family: Arial, sans-serif; font-size: 18px; align-items: center; justify-content: center;">
        <li style="position: relative; padding: 10px 20px; cursor: pointer; border-radius: 5px; transition: all 0.3s ease;">
            <a href="about.jsp">About</a>
            <span style="position: absolute; bottom: -5px; left: 0; right: 0; height: 2px; background-color: #3498db; opacity: 0; transition: opacity 0.3s;"></span>
        </li>
        <li style="position: relative; padding: 10px 20px; cursor: pointer; border-radius: 5px; transition: all 0.3s ease;">
            <a href="category.jsp">Home</a>
            <span style="position: absolute; bottom: -5px; left: 0; right: 0; height: 2px; background-color: #3498db; opacity: 0; transition: opacity 0.3s;"></span>
        </li>
        <li style="position: relative; padding: 10px 20px; cursor: pointer; border-radius: 5px; transition: all 0.3s ease;">
            <a href="setting.jsp">Setting</a>
            <span style="position: absolute; bottom: -5px; left: 0; right: 0; height: 2px; background-color: #3498db; opacity: 0; transition: opacity 0.3s;"></span>
        </li>
    </ul>

    <style>
        ul li:hover {
            background-color: green;
        }
        ul li:hover span {
            opacity: 1;
        }
    </style>


    <% if (loggedInUser != null) { %>
    <div class="user-info">
        <img src="<%= loggedInUser.getImage() %>" alt="Profile Image">
        <div>
            <p><strong>Welcome:</strong> <%= loggedInUser.getName() %></p>
            <p><strong>Phone:</strong> <%= loggedInUser.getPhone() %></p>
        </div>
    </div>
    <a href="basket.jsp" style="position: absolute; top: 10px; right: 100px;">Savat (<%= basket.getMap().size() %>)</a>
    <a href="placeOrder.jsp" style="position: absolute; top: 10px; right: 220px;">Orders</a>
    <a href="/logout" style="position: absolute; top: 10px; right: 340px;">Logout</a>
    <% } else { %>
    <a href="basket.jsp" style="position: absolute; top: 10px; right: 100px;">Savat (<%= basket.getMap().size() %>)</a>
    <a href="login.jsp" style="position: absolute; top: 10px; right: 220px;">Login</a>
    <% } %>
</div>

<div class="container">
    <div class="sidebar">
        <h2>Categories</h2>
        <ul>
            <% for (Category category : DB.category) { %>
            <li>
                <form action="category.jsp" method="GET">
                    <input type="hidden" name="categoryId" value="<%= category.getId() %>">
                    <button type="submit"><%= category.getName() %></button>
                </form>
            </li>
            <% } %>
        </ul>
    </div>
    <div class="main-content">
        <h2>Products</h2>
        <div class="product-grid">
            <%
                String categoryId = request.getParameter("categoryId");
                if (categoryId != null) {
                    for (Product product : DB.product) {
                        if (product.getCategory_Id() == Integer.parseInt(categoryId)) {
                            boolean isInBasket = basket.getMap().containsKey(product);
            %>
            <div class="product-card">
                <form action="<%= isInBasket ? "remove" : "add" %>" method="post">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <input type="hidden" name="categoryId" value="<%= categoryId %>">
                    <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                    <h3><%= product.getName() %></h3>
                    <p>Price: $<%= product.getPrice() %></p>
                    <button class="<%= isInBasket ? "remove-btn" : "add-btn" %>">
                        <%= isInBasket ? "Remove" : "Add to Basket" %>
                    </button>
                </form>
            </div>
            <%
                    }
                }
            } else {
            %>
            <p>Select a category to view products.</p>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
