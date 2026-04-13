<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Student</title>
</head>
<body>
<%@ include file="navbar.jsp" %>

<%
    String idParam = request.getParameter("id");
    if(idParam == null || idParam.isEmpty()) {
        out.println("<p>Error: No student ID provided.</p>");
    } else {
        int id = Integer.parseInt(idParam);

        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:postgresql://192.168.1.17:5432/cse_db24", "24bcsi68", "24bcsi68");

            PreparedStatement ps = con.prepareStatement("DELETE FROM studN WHERE id=?");
            ps.setInt(1, id);

            int rows = ps.executeUpdate();
            if(rows > 0) {
                out.println("<p>Student deleted successfully!</p>");
            } else {
                out.println("<p>No student found with ID: " + id + "</p>");
            }

            ps.close();
            con.close();
        } catch(Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>

<p><a href="displayStudents.jsp">Back to Student List</a></p>
</body>
</html>
