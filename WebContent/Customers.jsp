<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp" %>
    <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
 %>


<%String sql = "select distinct customer.CustomerID,customer.FirstName,customer.LastName,customer.Email,customer.Address,customer.PhoneNum from loans inner join customer on customer.CustomerID=loans.CustomerID where loans.EmpID=?;";
ps = con.prepareStatement(sql);
ps.setInt(1,(Integer)session.getAttribute("EmpID"));
int EmpID=(Integer)(session.getAttribute("EmpID"));
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
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js"></script>
  
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> <!--//bootstrap link   -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css">
</head>
<style>
.dataTables_filter
{
display: none;
}


{
display: none;

}
}
</style>
<body>
<!--  <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.."> -->

<div class="container-fluid">
<div class="row">
  <div class="col-lg-4"></div>
  <div class="col-lg-12">
	<br>
  <h2>My Customers</h2>
  <p>Type something in the input field to search the table for first names, last names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  
  
  <table class="table table-bordered table-striped" id="maintable">
    <thead>
      <tr>
      	<th>CustomerID</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Address</th>
        <th>PhoneNum</th>
      </tr>
    </thead>
    <tbody id="myTable">
	<%while(rs.next())
	{%>
	<tr>
		<%int CustomerID=rs.getInt("CustomerID"); %>
		<td><a href="specific_customer_info.jsp?Id=<%=CustomerID%>"> <%=rs.getInt("CustomerID")%> </a></td> 
		<td><%=rs.getString("FirstName") %></td>
		<td><%=rs.getString("LastName") %></td>
		<td><%=rs.getString("Email") %></td>
		<td><%=rs.getString("Address") %></td>
		<td><%=rs.getString("PhoneNum") %></td>
	</tr>
	<%}%>	
    </tbody>
  </table>
  </div>
</div>
</div>

<script>
document.getElementById("customers").setAttribute("class","active");

$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script>
$(document).ready(function() {
    $('#maintable').DataTable();
} );
</script>
</body>
</html>