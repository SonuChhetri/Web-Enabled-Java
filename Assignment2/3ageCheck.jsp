<%
  String name = request.getParameter("name");
  int age = Integer.parseInt(request.getParameter("age"));
  if (age < 18) {
%>
    <h3>Hello <%= name %>, you are not authorized to visit the site.</h3>
<%
  } else {
%>
    <h3>Welcome <%= name %> to this site!</h3>
<%
  }
%>
