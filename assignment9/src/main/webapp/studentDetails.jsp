<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details</title>
</head>
<body>
    <h2>Student Full Details</h2>
    <%
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            try {
                Class.forName("org.postgresql.Driver");
                try (Connection con = DriverManager.getConnection(
                        "jdbc:postgresql://192.168.1.17/cse_db24", "24bcsi68", "24bcsi68");
                     PreparedStatement ps = con.prepareStatement("SELECT * FROM studn WHERE id=?")) {
                    
                    ps.setInt(1, Integer.parseInt(id));
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
    %>
                            <p><strong>ID:</strong> <%= rs.getInt("id") %></p>
                            <p><strong>Name:</strong> <%= rs.getString("name") %></p>
                            <p><strong>Email:</strong> <%= rs.getString("email") %></p>
                            <p><strong>Course:</strong> <%= rs.getString("course") %></p>
                            <p><strong>Age:</strong> <%= rs.getInt("age") %></p>
                            <p><strong>CGPA:</strong> <%= rs.getFloat("cgpa") %></p>
    <%
                        } else {
                            out.print("<p>No student found with ID " + id + "</p>");
                        }
                    }
                }
            } catch (Exception e) {
                out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        } else {
            out.print("<p style='color:red;'>Invalid or missing student ID.</p>");
        }
    %>
</body>
</html>
