<%@ page import="org.example.demo3.DB" %>
<%@ page import="org.example.demo3.User" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");


    User user = DB.getUserByUsername(username);
    if (user != null && user.getPassword().equals(password)) {
        if ("Admin".equals(user.getRole())) {
            session.setAttribute("loggedInUser", user);
            response.sendRedirect("adminPanel.jsp");
        } else if ("User".equals(user.getRole())) {
            session.setAttribute("loggedInUser", user);
            response.sendRedirect("category.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid role");
        }
    } else {
        response.sendRedirect("login.jsp?error=Invalid username or password");
    }
%>
