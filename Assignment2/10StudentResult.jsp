<%
  Student s = (Student)request.getAttribute("student");
  if (s == null) {
    out.print("No student found. <a href='studentForm.jsp'>Go back</a>");
  } else {
%>
  <h3>Student</h3>
  <p>RegNo: <%= s.getRegno() %></p>
  <p>Name: <%= s.getName() %></p>
  <p>Marks: <%= s.getMarks() %></p>
<% } %>
