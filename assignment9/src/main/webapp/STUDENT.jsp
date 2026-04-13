<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create studN Table</title>
</head>
<body>
<%
    String driver = "org.postgresql.Driver";
    String url = "jdbc:postgresql://192.168.1.17:5432/cse_db24"; 
    String username = "24bcsi68";
    String password = "24bcsi68";

    Connection con = null;
    Statement stmt = null;

    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, username, password);

        stmt = con.createStatement();
        String sql = "CREATE TABLE IF NOT EXISTS studN (" +
                     "id SERIAL PRIMARY KEY," +
                     "name VARCHAR(50) NOT NULL," +
                     "email VARCHAR(50) UNIQUE," +
                     "course VARCHAR(30)," +
                     "age INT CHECK (age > 0)," +
                     "cgpa REAL CHECK (cgpa >= 0 AND cgpa <= 10)" +
                     ")";
        stmt.executeUpdate(sql);

        out.println("<h2>studN Table Created Successfully!</h2>");

    } catch(Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
        e.printStackTrace();
    } finally {
        if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if(con != null) try { con.close(); } catch(SQLException ex) {}
    }
%>
</body>
</html>
