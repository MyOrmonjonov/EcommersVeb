package org.example.demo4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/addOrderItem")
public class OrderItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String orderId = request.getParameter("orderId");

        if (orderId == null || orderId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Order ID is missing.");
            return;
        }

        HttpSession session = request.getSession();
        List<Order> orders = (List<Order>) session.getAttribute("orders");

        if (orders == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No orders found in the session.");
            return;
        }


        Order selectedOrder = null;
        for (Order order : orders) {
            if (order.getId().equals(orderId)) {
                selectedOrder = order;
                break;
            }
        }

        if (selectedOrder == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found.");
            return;
        }


        session.setAttribute("selectedOrderItems", selectedOrder.getItems());


        response.sendRedirect("orderDetails.jsp?orderId=" + orderId);
    }
}
