// package com.example;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class StudentServlet extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String regno = req.getParameter("regno");
    StudentDAO dao = new StudentDAO();
    try {
      if (regno != null && !regno.trim().isEmpty()) {
        Student s = dao.findByRegno(regno.trim());
        req.setAttribute("student", s);
        RequestDispatcher rd = req.getRequestDispatcher("studentResult.jsp");
        rd.forward(req, resp);
      } else {
        List<Student> list = dao.findAll();
        req.setAttribute("students", list);
        req.getRequestDispatcher("studentList.jsp").forward(req, resp);
      }
    } catch (Exception e) {
      throw new ServletException(e);
    }
  }
}
