<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp" %>
    <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
 %>


<%String sql = "select customer.CustomerID,customer.FirstName,customer.LastName,loans.Principal,loans.Monthly_inst,loans.Amt_paid,loans.Duration,loans.TypeID from loans inner join customer on customer.CustomerID=loans.CustomerID where loans.EmpID=?;";
ps = con.prepareStatement(sql);
int EmpID=(Integer)(session.getAttribute("EmpID"));
ps.setInt(1,EmpID);
rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<title>CRM::Customers</title>
	<link rel="stylesheet" type="text/css" href="resources/css/leads.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> <!--//bootstrap link   -->
	
</head>
<body>
<!--  <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.."> -->

<div class="container-fluid">
<br>
<br>
<div class="row">
  <div class="col-lg-1"></div>
  <div class="col-lg-8">
	<br>
	<br>
  <h2>Loan Details</h2>
  <p>Type something in the input field to search the table for first names, last names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  
  
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
      	<th>CustomerID</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Type</th>
        <th>Principal</th>
        <th>Monthly Installment</th>
        <th>Duration( YRS )</th>
        <th>Total Amount Paid</th>
      </tr>
    </thead>
    <tbody id="myTable">
	<%int type;
	while(rs.next())
	{%>
	<tr>
		<td><%=rs.getInt("CustomerID")%></td>
		<td><%=rs.getString("FirstName") %></td>
		<td><%=rs.getString("LastName") %></td>
		<td><%type= rs.getInt("TypeID");
		if(type==1)
		{
			out.println("Home Loan");
		}
		else if(type==2)
		{
			out.println("Vehicle Loan");
		}
		else if(type==3)
		{
			out.println("Educational Loan");
		}%>
		</td>
		<td><%=rs.getString("Principal") %></td>
		<td><%=rs.getString("Monthly_inst") %></td>
		<td><%=rs.getInt("Duration") %></td>
		<td><%=rs.getString("Amt_paid") %></td>
	</tr>
	<%}%>	
    </tbody>
  </table>
  </div>
</div>
</div>

<script>
document.getElementById("allsales").setAttribute("class","active");

$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

</body>
</html>