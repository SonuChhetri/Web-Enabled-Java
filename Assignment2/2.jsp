<%@ page import="javax.servlet.http.Cookie" %>
<html><body>
  <h3>Cookies</h3>
  <form><input type="submit" value="List Cookies"></form>
  <%
    Cookie[] cookies = request.getCookies();
    if (cookies == null) {
       out.println("<p>No cookies found.</p>");
    } else {
       out.println("<ul>");
       for (Cookie c : cookies) {
         out.println("<li>" + c.getName() + " = " + c.getValue() + "</li>");
       }
       out.println("</ul>");
    }
  %>
</body></html>
