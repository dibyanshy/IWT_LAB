<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
</head>
<body>
<%@ include file="navbar.jsp" %>

<h2>Add Student</h2>
<form method="post">
    Name: <input type="text" name="name" required><br>
    Email: <input type="email" name="email" required><br>
    Course: <input type="text" name="course"><br>
    Age: <input type="number" name="age" min="1"><br>
    CGPA: <input type="number" step="0.1" name="cgpa" min="0" max="10"><br>
    <input type="submit" value="Add Student">
</form>

<%
    if(request.getMethod().equalsIgnoreCase("POST")) {
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
                "INSERT INTO studN (name, email, course, age, cgpa) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.setInt(4, age);
            ps.setFloat(5, cgpa);

            ps.executeUpdate();
            out.println("<p>Student added successfully!</p>");

            ps.close();
            con.close();
        } catch(Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>
