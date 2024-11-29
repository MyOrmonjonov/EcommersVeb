package org.example.demo4;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/add")
public class AddToBasket extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        Basket basket = (Basket) session.getAttribute("basket");
        if (basket == null) {
            basket = new Basket();
        }

        int productId = Integer.parseInt(req.getParameter("productId"));
        Product product = DB.product.stream()
                .filter(p -> p.getId() == productId)
                .findFirst()
                .orElse(null);

        if (product != null) {
            basket.getMap().put(product, basket.getMap().getOrDefault(product, 0) + 1);
        }

        session.setAttribute("basket", basket);
        resp.sendRedirect("category.jsp?categoryId=" + req.getParameter("categoryId"));
    }
}
