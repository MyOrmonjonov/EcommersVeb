package org.example.demo4;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

@WebServlet("/createOrder")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();


        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Basket basket = (Basket) session.getAttribute("basket");
        if (basket == null || basket.getMap().isEmpty()) {
            response.sendRedirect("basket.jsp");
            return;
        }

        List<OrderItem> orderItems = new ArrayList<>();
        double totalAmount = 0;

        for (Map.Entry<Product, Integer> entry : basket.getMap().entrySet()) {
            Product product = entry.getKey();
            int quantity = entry.getValue();

            OrderItem orderItem = new OrderItem(product, quantity);
            orderItems.add(orderItem);

            totalAmount += orderItem.getTotalPrice();
        }


        Random random = new Random();
        int orderId = random.nextInt(2001) + 1000;


        LocalDateTime orderDate = LocalDate.now().atStartOfDay();


        Order order = new Order(orderId, loggedInUser.getUserId(), orderDate, orderItems);


        List<Order> orders = (List<Order>) session.getAttribute("orders");
        if (orders == null) {
            orders = new ArrayList<>();
        }
        orders.add(order);
        session.setAttribute("orders", orders);


        basket.getMap().clear();


        response.sendRedirect("placeOrder.jsp");
    }
}
