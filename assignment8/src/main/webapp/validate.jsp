<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String email = request.getParameter("email");
    String pass = request.getParameter("password");

    if("admin@gmail.com".equals(email) && "admin".equals(pass)){
        RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
        rd.forward(request, response);
    } else {
        out.println("<h3>Invalid Credentials</h3>");
    }
 %>   
</body>
</html>