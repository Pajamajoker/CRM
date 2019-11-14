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

Connection con=null,conn= null;

PreparedStatement ps=null,ps111 = null,ps222=null,ps333=null;
Statement stmt=null;

ResultSet rs=null,rs111 = null,rs222=null,rs333=null;



String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/test_jsp";

String user = "root";

String dbpsw = "";

Class.forName(driverName);

con = DriverManager.getConnection(url, user, dbpsw);
String sqlll="select count(TaskID) as count from tasks where EmpID=? and due=1";
ps111 = con.prepareStatement(sqlll);
ps111.setInt(1,(Integer)session.getAttribute("EmpID"));
rs111=ps111.executeQuery();

String sql222="select Name from tasks where EmpID=? and due=1";
ps222 = con.prepareStatement(sql222);
ps222.setInt(1,(Integer)session.getAttribute("EmpID"));
rs222=ps222.executeQuery();

String sql333="select FirstName from employees where EmpID=?";
ps333 = con.prepareStatement(sql333);
ps333.setInt(1,(Integer)session.getAttribute("EmpID"));
rs333=ps333.executeQuery();

int AlertCount=0;
if(rs111.next())
{
	AlertCount=rs111.getInt("count");
}

//NOTE: objects con and ps and rs are already made available to any page that has navbar.jsp included



%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/navbar.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.notification {
  background-color: #555;
  color: white;
  text-decoration: none;
  padding: 15px 26px;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

.notification:hover {
  background: red;
}

.notification .badge {
  position: right;
  top: -10px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background-color: red;
  color: white;
}
</style>

<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>


</head>
<body>
<div class="topnav">
 <a href="dashboardtempp.jsp" id="dashboard" >DashBoard</a>
  <a href="leads.jsp" id="leads">My Leads</a>
  <a href="Customers.jsp" id="customers">Customers</a>
  <a href="AllSales.jsp" id="allsales">All Sales</a>
  <a href="Products.jsp" id="products">Products</a>
  <a href="tasks.jsp" id="tasks">Tasks</a>
  
 
  <a href="logout.jsp" class="logout" id="log out" style="float:right"> Log out</a>	
  
  <a class="notification" id="myBtn" style="float:right"v>
  <span><i style="font-size:24px" class="fa">&#xf0f3;</i></span>
  <span class="badge"><%=AlertCount %></span>
  </a>
   <%while(rs333.next()){ %>
  <a href="#" style="float:right"><%=rs333.getString("FirstName") %></a><%} %>
  
  <div id="myModal" class="modal">
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <%while(rs222.next()){ %>
	    <p>Task : <%=rs222.getString("Name") %> is due for today </p>
	  	<%} %>
	  </div>
  </div>
  
  
  

</div>
</body>
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</html>
