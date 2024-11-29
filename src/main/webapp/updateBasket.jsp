<%@ page import="org.example.demo4.Basket" %>
<%@ page import="org.example.demo4.Product" %>
<%@ page import="org.example.demo4.DB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String action = request.getParameter("action");
    int productId = Integer.parseInt(request.getParameter("productId"));
    Basket basket = (Basket) session.getAttribute("basket");

    if (basket != null) {
        Product product = DB.product.stream()
                .filter(p -> p.getId() == productId)
                .findFirst()
                .orElse(null);

        if (product != null) {
            switch (action) {
                case "plus":
                    basket.getMap().put(product, basket.getMap().getOrDefault(product, 0) + 1);
                    break;
                case "minus":
                    int currentQuantity = basket.getMap().get(product);
                    if (currentQuantity > 1) {
                        basket.getMap().put(product, currentQuantity - 1);
                    } else {
                        basket.getMap().remove(product);
                    }
                    break;
                case "remove":
                    basket.getMap().remove(product);
                    break;
            }
        }
    }

    response.sendRedirect("basket.jsp");
%>
