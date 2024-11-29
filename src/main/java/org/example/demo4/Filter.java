package org.example.demo4;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter("/*")
public class Filter extends HttpFilter {


    private final List<String> openUserPages = Arrays.asList("orderDetails.jsp", "placeOrder.jsp","basket.jsp","setting.jsp");

    private final List<String> openAdminPages = Arrays.asList("addCategory.jsp", "adminPanel.jsp", "addProductAction.jsp", "addProduct.jsp","basket.jsp");


    private final List<String> publicPages = Arrays.asList("login.jsp", "register.jsp", "category.jsp","setting.jsp","about.jsp","home.jsp","basket.jsp");

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);

        User loggedInUser = session != null ? (User) session.getAttribute("loggedInUser") : null;


        if (publicPages.stream().anyMatch(uri::contains)) {
            chain.doFilter(req, res);
            return;
        }


        if (openUserPages.stream().anyMatch(uri::contains)) {
            if (loggedInUser == null || !"User".equalsIgnoreCase(loggedInUser.getRole())) {
                res.sendRedirect("login.jsp");
                return;
            }
        }


        if (openAdminPages.stream().anyMatch(uri::contains)) {
            if (loggedInUser == null || !"Admin".equalsIgnoreCase(loggedInUser.getRole())) {
                res.sendRedirect("login.jsp");
                return;
            }
        }


        chain.doFilter(req, res);
    }
}
