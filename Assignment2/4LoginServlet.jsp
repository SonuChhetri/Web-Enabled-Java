// package com.example;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String user = req.getParameter("username");
    String pass = req.getParameter("password");

    String url = "jdbc:oracle:thin:@localhost:1521:XE"; // change
    String dbUser = "YOUR_DB_USER";
    String dbPass = "YOUR_DB_PASS";

    try (Connection con = DriverManager.getConnection(url, dbUser, dbPass)) {
      String sql = "SELECT COUNT(*) FROM users WHERE username=? AND password=?";
      try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, user);
        ps.setString(2, pass); // in real app: store hashed passwords
        try (ResultSet rs = ps.executeQuery()) {
          rs.next();
          int cnt = rs.getInt(1);
          if (cnt > 0) {
            HttpSession s = req.getSession(true);
            s.setAttribute("username", user);
            resp.sendRedirect("loginSuccess.jsp");
          } else {
            resp.getWriter().println("Login failed. <a href='login.jsp'>Try again</a>");
          }
        }
      }
    } catch (SQLException e) {
      throw new ServletException(e);
    }
  }
}
