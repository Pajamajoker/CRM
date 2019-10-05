<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/navbar.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
	if(session.getAttribute("navbar_var")==null)
    {
    response.sendRedirect("signin.jsp");//if invalid session found then redirect to login
    }
    %>
<%@page import="java.sql.*" %>

<%! String userdbName;

String userdbPsw;

String dbUsertype;

%>

<%

Connection con= null;

PreparedStatement ps = null;
Statement stmt=null;

ResultSet rs = null;



String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/test_jsp";

String user = "root";

String dbpsw = "";

Class.forName(driverName);

con = DriverManager.getConnection(url, user, dbpsw);



//NOTE: objects con and ps and rs are already made available to any page that has navbar.jsp included



%>
<div class="topnav">
 <a href="dashboard.jsp" id="dashboard" >DashBoard</a>
  <a href="leads.jsp" id="leads">My Leads</a>
  <a href="Customers.jsp" id="customers">Customers</a>
  <a href="AllSales.jsp" id="allsales">All Sales</a>
  <a href="Products.jsp" id="products">Products</a>
  <a href="tasks.jsp" id="tasks">Tasks</a>
  <a href="logout.jsp" class="logout" id="log out">Log out</a>

</div>
</body>
</html>
