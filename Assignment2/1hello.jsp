<%@ page import="java.time.*,java.time.format.DateTimeFormatter" %>
<%
  String name = request.getParameter("username");
  if (name == null) name = (String)session.getAttribute("username");

  if (session.getAttribute("startTime") == null) {
      long start = System.currentTimeMillis();
      session.setAttribute("startTime", start);
  }
  session.setAttribute("username", name);

  long start = (Long)session.getAttribute("startTime");
  String startStr = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
                      .withZone(ZoneId.systemDefault()).format(Instant.ofEpochMilli(start));
%>
<html><body>
  <h2>Hello, <%= name %></h2>
  <p>Start time: <%= startStr %></p>
  <p><a href="logout.jsp">Logout</a></p>
</body></html>
