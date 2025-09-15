<%@ page import="java.util.*,com.example.Student" %>
<html><body>
  <h3>All Students</h3>
  <table border="1">
    <tr><th>Reg</th><th>Name</th><th>Marks</th></tr>
    <%
      List<Student> list = (List<Student>)request.getAttribute("students");
      for (Student s : list) {
    %>
      <tr>
        <td><%= s.getRegno() %></td>
        <td><%= s.getName() %></td>
        <td><%= s.getMarks() %></td>
      </tr>
    <% } %>
  </table>
</body></html>
