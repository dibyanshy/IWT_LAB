<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<form action="" method="post">
    Enter a number: <input type="text" name="num">
    <input type="submit" value="Check">
</form>

<%
    String n = request.getParameter("num");
    if(n != null){
        int num = Integer.parseInt(n);
        boolean prime = true;
        if(num <= 1) prime = false;
        else {
            for(int i=2; i<=Math.sqrt(num); i++){
                if(num % i == 0){ prime = false; break; }
            }
        }
        out.println(num + (prime ? " is Prime" : " is Not Prime"));
    }
%>
</body>
</html>