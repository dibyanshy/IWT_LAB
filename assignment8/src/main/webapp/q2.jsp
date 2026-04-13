<html>
<head><title>Employee Details</title></head>
<body>
<form action="employeeDisplay.jsp" method="post">
    ID: <input type="text" name="id"><br>
    Name: <input type="text" name="name"><br>
    Mobile: <input type="text" name="mobile"><br>
    Email: <input type="email" name="email"><br>
    Gender: 
    <input type="radio" name="gender" value="Male">Male
    <input type="radio" name="gender" value="Female">Female<br>
    DOB: <input type="date" name="dob"><br>
    Address: <textarea name="address"></textarea><br>
    Country: 
    <select name="country">
        <option>India</option>
        <option>Other</option>
    </select><br>
    Languages Known:
    <input type="checkbox" name="lang" value="English">English
    <input type="checkbox" name="lang" value="Hindi">Hindi
    <input type="checkbox" name="lang" value="Odia">Odia
    <input type="checkbox" name="lang" value="Other">Other<br>
    <input type="submit" value="Submit">
</form>
</body>
</html>