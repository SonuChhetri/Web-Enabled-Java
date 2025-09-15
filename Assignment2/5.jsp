<%@ page import="java.util.regex.*" %>
<%
  String email = request.getParameter("email");
  String pattern = "^[^@\\s]+@[^@\\s]{2,}\\.[^@\\s]{2,}$";
  boolean valid = false;
  if (email != null) {
    valid = email.matches(pattern) &&
            (email.indexOf('@') == email.lastIndexOf('@')); // exactly one @
  }
%>
<html><body>
  <form method="post">
    Email: <input name="email" value="<%= email==null?"":email %>">
    <input type="submit" value="Check">
  </form>

  <% if (email != null) { %>
    <p>Result: <b><%= valid ? "Valid" : "Invalid" %></b></p>
  <% } %>
</body></html>
