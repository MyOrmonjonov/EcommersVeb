<%@ page import="org.example.demo4.DB" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String categoryName = request.getParameter("categoryName");
  DB.addCategory(categoryName);
  response.sendRedirect("adminPanel.jsp?view=categories");
%>
