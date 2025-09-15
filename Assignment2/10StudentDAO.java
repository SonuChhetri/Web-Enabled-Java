import java.sql.*;
import java.util.*;

public class StudentDAO {
  private String url = "jdbc:oracle:thin:@localhost:1521:XE";
  private String user = "YOUR_DB_USER";
  private String pass = "YOUR_DB_PASS";

  public Student findByRegno(String regno) throws SQLException {
    String sql = "SELECT regno,name,marks FROM student WHERE regno=?";
    try (Connection c = DriverManager.getConnection(url,user,pass);
         PreparedStatement ps = c.prepareStatement(sql)) {
      ps.setString(1, regno);
      try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
          return new Student(rs.getString("regno"), rs.getString("name"), rs.getInt("marks"));
        }
      }
    }
    return null;
  }

  public List<Student> findAll() throws SQLException {
    List<Student> list = new ArrayList<>();
    String sql = "SELECT regno,name,marks FROM student";
    try (Connection c = DriverManager.getConnection(url,user,pass);
         Statement s = c.createStatement();
         ResultSet rs = s.executeQuery(sql)) {
      while (rs.next()) {
        list.add(new Student(rs.getString("regno"), rs.getString("name"), rs.getInt("marks")));
      }
    }
    return list;
  }
}
