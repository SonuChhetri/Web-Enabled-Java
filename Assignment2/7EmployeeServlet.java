// package com.example;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class EmployeeServlet extends HttpServlet {
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String empid = req.getParameter("empid");
    String name  = req.getParameter("name");
    String ageS  = req.getParameter("age");
    String desg  = req.getParameter("desg");
    String salS  = req.getParameter("salary");

    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "YOUR_DB_USER", dbPass = "YOUR_DB_PASS";

    try (Connection c = DriverManager.getConnection(url, dbUser, dbPass)) {
      String sql = "MERGE INTO employee t USING (SELECT ? empid FROM dual) src " +
                   "ON (t.empid = src.empid) " +
                   "WHEN MATCHED THEN UPDATE SET name=?, age=?, desg=?, salary=? " +
                   "WHEN NOT MATCHED THEN INSERT (empid,name,age,desg,salary) VALUES (?,?,?,?,?)";

      try (PreparedStatement ps = c.prepareStatement(sql)) {
        int age = Integer.parseInt(ageS);
        double salary = Double.parseDouble(salS);
        ps.setString(1, empid);
        ps.setString(2, name);
        ps.setInt(3, age);
        ps.setString(4, desg);
        ps.setDouble(5, salary);
        ps.setString(6, empid);
        ps.setString(7, name);
        ps.setInt(8, age);
        ps.setString(9, desg);
        ps.setDouble(10, salary);
        int updated = ps.executeUpdate();
        resp.getWriter().println(updated > 0 ? "Updating Success" : "Updating Error");
      }
    } catch (Exception e) {
      e.printStackTrace(resp.getWriter());
    }
  }
}
