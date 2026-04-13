<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<form action="" method="post">
    Age: <input type="text" name="age"><br>
    Gender: 
    <input type="radio" name="gender" value="Male">Male
    <input type="radio" name="gender" value="Female">Female<br>
    Height : <input type="text" name="height"><br>
    Weight : <input type="text" name="weight"><br>
    <input type="submit" value="Calculate BMR">
</form>

<%
    String ageStr = request.getParameter("age");
    if(ageStr != null){
        int age = Integer.parseInt(ageStr);
        int height = Integer.parseInt(request.getParameter("height"));
        int weight = Integer.parseInt(request.getParameter("weight"));
        String gender = request.getParameter("gender");

        double bmr;
        if("Male".equals(gender)){
            bmr = (10*weight) + (6.25*height) - (5*age) + 5;
        } else {
            bmr = (10*weight) + (6.25*height) - (5*age) - 161;
        }
        out.println("Your BMR is: " + bmr + " Calories/day");
    }
%>
</body>
</html>