<%@ page import="java.util.*" %>
<html><body>
  <h2>Use of Implicit Objects</h2>
  <h3>Request object</h3>
  <p>Method: <%= request.getMethod() %></p>
  <p>Remote Addr: <%= request.getRemoteAddr() %></p>

  <h3>Response object</h3>
  <p>Content Type will be: <%= response.getContentType() %></p>

  <h3>Session object</h3>
  <%
     session.setAttribute("visitTime", new Date());
  %>
  <p>Session ID: <%= session.getId() %></p>
  <p>Visit Time: <%= session.getAttribute("visitTime") %></p>

  <h3>Application (ServletContext)</h3>
  <%
    application.setAttribute("appStart", application.getAttribute("appStart")==null ? new Date() : application.getAttribute("appStart"));
  %>
  <p>App Start: <%= application.getAttribute("appStart") %></p>

  <h3>Out</h3>
  <p>This line produced using out implicit object.</p>
</body></html>
