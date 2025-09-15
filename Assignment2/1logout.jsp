<%@ page import="java.time.*" %>
<%
  Long start = (Long)session.getAttribute("startTime");
  String name = (String)session.getAttribute("username");
  long now = System.currentTimeMillis();
  long durationMs = (start==null)?0:(now - start);
  long sec = durationMs/1000;
  long min = sec/60; sec = sec%60;
%>
<html><body>
  <h3>Thank you, <%= name != null ? name : "Guest" %>!</h3>
  <p>Duration: <%= min %> minutes <%= sec %> seconds.</p>
  <%
    session.invalidate();
  %>
  <p><a href="index.jsp">Go Home</a></p>
</body></html>
