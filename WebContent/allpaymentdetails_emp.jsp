<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp" %>
    <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
 %>


<%String sql = "select * from duepayments where LoaneeID=?";
ps = con.prepareStatement(sql);
int CustomerID=(Integer)(session.getAttribute("CustomerID"));
ps.setInt(1,Integer.parseInt(request.getParameter("Id")));
rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<title>CRM::Customers</title>
	<link rel="stylesheet" type="text/css" href="resources/css/leads.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js"></script>
  
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> <!--//bootstrap link   -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css">
	
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
  <h2>Loan Details</h2>
  <p>Type something in the input field to search the table for first names, last names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  
  
  <table class="table table-bordered table-striped" id="maintable"> 	
    <thead>
      <tr>
      	<th>LoaneeID</th>
        <th>DueDate</th>
        <th>Payment</th>
      </tr>
    </thead>
    <tbody id="myTable">
	<%int type,payst;
	Double Principal;
	Double Monthly_inst;
	Float Duration;
	Double Amt_paid;
	int LoaneeID=0,flag=0;
	Double Total_amt_remaining;
	while(rs.next()) 	
	{
		%>
	<tr>
		<td><% long PaymentID=rs.getInt("PaymentID"); LoaneeID=rs.getInt("LoaneeID") ;%><%=rs.getInt("LoaneeID")%></td>
		<td><%=rs.getString("DueDate") %></td>
		<% if(rs.getInt("IsPaid")==0){%><td>Pending</td><%} %>
		<%if(rs.getInt("IsPaid")==1){ %><td>Payment Done</td><%} %>
	</tr>
	<%} %>
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

<script>
$(document).ready(function() {
    $('#maintable').DataTable();
} );
</script>

</body>
</html>