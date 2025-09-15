<%
  String user = (String)session.getAttribute("username");
  if (user == null) response.sendRedirect("login.jsp");
%>
<html><body>
  <h2>Welcome, <%= user %>!</h2>
  <a href="logout.jsp">Logout</a>
</body></html>
