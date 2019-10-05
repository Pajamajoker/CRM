<%@ page import="java.sql.*" %>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Home</title>

</head>

<body>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;



String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/test_jsp";

String user = "root";

String password = "";



//String sql = "select usertype from userdetail";

%>

<form method="post" action="login.jsp">

<center><h2 style="color:green">JSP Login Example</h2></center>

<table border="1" align="center">

<tr>

<td>Enter Your Name :</td>

<td><input type="text" name="name"/></td>

</tr>

<tr>

<td>Enter Your Password :</td>

<td><input type="password" name="password"/></td>

</tr>

<tr>

</td>

</tr>

<tr>

<td></td>

<td><input type="submit" value="submit"/></td>

</table>

</form>

</body>

</html>