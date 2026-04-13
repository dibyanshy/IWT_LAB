<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<html>
<body>
<h2>BMR calcolator</h2>
<p> Age: <%= request.getParameter("age") %></p>
<p>Gender: <%= request.getParameter("gender") %></p>
<p>Height (cm): <%= request.getParameter("height") %></p>
<p>Weight (kg): <%= request.getParameter("weight") %></p>

</body>
</html>
