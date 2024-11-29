<%@ page import="org.example.demo4.DB" %>
<%@ page import="org.example.demo4.User" %>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String phone =request.getParameter("phone");


  boolean userExists = false;
  for (User user : DB.user) {
    if (user.getName().equals(username)) {
      userExists = true;
      break;
    }
  }

  if (userExists) {
    response.sendRedirect("register.jsp?error=true");
  } else {

    User newUser = new User(username, password,"User",phone);
    DB.user.add(newUser);

    session.setAttribute("loggedInUser", newUser);

    response.sendRedirect("login.jsp?success=true");
  }
%>
