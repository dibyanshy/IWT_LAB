<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Update Student</title></head>
<body>
<%@ include file="navbar.jsp" %>

<%
    String idParam = request.getParameter("id");
    if(idParam == null || idParam.isEmpty()) {
        out.println("<p>Error: No student ID provided.</p>");
    } else {
        int id = Integer.parseInt(idParam);

        if(request.getMethod().equalsIgnoreCase("POST")) {
            // Handle update
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String course = request.getParameter("course");
            int age = Integer.parseInt(request.getParameter("age"));
            float cgpa = Float.parseFloat(request.getParameter("cgpa"));

            try {
                Class.forName("org.postgresql.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:postgresql://192.168.1.17:5432/cse_db24", "24bcsi68", "24bcsi68");

                PreparedStatement ps = con.prepareStatement(
                    "UPDATE studN SET name=?, email=?, course=?, age=?, cgpa=? WHERE id=?");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, course);
                ps.setInt(4, age);
                ps.setFloat(5, cgpa);
                ps.setInt(6, id);

                ps.executeUpdate();
                out.println("<p>Student updated successfully!</p>");

                ps.close();
                con.close();
            } catch(Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        } else {
            // Show form with current student data
            try {
                Class.forName("org.postgresql.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:postgresql://192.168.1.17:5432/cse_db24", "24bcsi68", "24bcsi68");

                PreparedStatement ps = con.prepareStatement("SELECT * FROM studN WHERE id=?");
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                if(rs.next()) {
%>
<form method="post">
    Name: <input type="text" name="name" value="<%= rs.getString("name") %>" required><br>
    Email: <input type="email" name="email" value="<%= rs.getString("email") %>" required><br>
    Course: <input type="text" name="course" value="<%= rs.getString("course") %>"><br>
    Age: <input type="number" name="age" value="<%= rs.getInt("age") %>" min="1"><br>
    CGPA: <input type="number" step="0.1" name="cgpa" value="<%= rs.getFloat("cgpa") %>" min="0" max="10"><br>
    <input type="submit" value="Update Student">
</form>
<%
                }
                rs.close();
                ps.close();
                con.close();
            } catch(Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        }
    }
%>
</body>
</html>
