<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Students</title>
</head>
<body>
<%@ include file="navbar.jsp" %>

<h2>Student List</h2>
<table border="1" cellpadding="8">
    <tr>
        <th>ID</th><th>Name</th><th>Email</th><th>Course</th><th>Age</th><th>CGPA</th><th>Actions</th>
    </tr>
<%
    try {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:postgresql://192.168.1.17:5432/cse_db24", "24bcsi68", "24bcsi68");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM studN");

        while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("course") %></td>
        <td><%= rs.getInt("age") %></td>
        <td><%= rs.getFloat("cgpa") %></td>
        <td>
            <a href="studentDetails.jsp?id=<%= rs.getInt("id") %>">Details</a> |
            <a href="updateStudent.jsp?id=<%= rs.getInt("id") %>">Update</a> |
            <a href="deleteStudent.jsp?id=<%= rs.getInt("id") %>">Delete</a>
        </td>
    </tr>
<%
        }
        rs.close();
        stmt.close();
        con.close();
    } catch(Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
</table>
</body>
</html>
