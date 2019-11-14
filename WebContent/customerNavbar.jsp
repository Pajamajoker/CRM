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

String sql = "select customer.CustomerID,customer.FirstName,customer.LastName,loans.Principal,loans.Monthly_inst,loans.Amt_paid,loans.Duration,loans.TypeID,loans.IsPaid,loans.LoaneeID,loans.due from loans inner join customer on customer.CustomerID=loans.CustomerID where loans.CustomerID=?;";
ps = con.prepareStatement(sql);
int CustomerID=(Integer)(session.getAttribute("CustomerID"));
ps.setInt(1,CustomerID);
rs = ps.executeQuery();


%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/navbar.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div class="topnav">
 <a href="#loandetails" id="loandetails" >My Loan</a>
  <a href="#pending" id="pending">Pending Payments</a>
  <a href="logout.jsp" class="logout" id="log out">Log out</a>
</div>

<div id="loandetails">

</div>
</body>
</html>
