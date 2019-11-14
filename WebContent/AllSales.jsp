<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp" %>
    <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
 %>


<%String sql = "select customer.CustomerID,customer.FirstName,customer.LastName,loans.Principal,loans.Monthly_inst,loans.Amt_paid,loans.Duration,loans.TypeID,loans.LoaneeID from loans inner join customer on customer.CustomerID=loans.CustomerID where loans.EmpID=?;";
ps = con.prepareStatement(sql);
int EmpID=(Integer)(session.getAttribute("EmpID"));
ps.setInt(1,EmpID);
rs = ps.executeQuery();

PreparedStatement ps1 = null;

ResultSet rs1 = null;

String sql1=null;
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
      	<th>CustomerID</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Type</th>
        <th>Principal</th>
        <th>Monthly Installment</th>
        <th>Duration[YRS] </th>
        <th>Total Amount Paid</th>
        <th>Total Payment Remaining</th>
        <th>Total pending Installments</th>
        <th>All Payment Details</th>
      </tr>
    </thead>
    <tbody id="myTable">
	<%int type,payst;
	Double Principal;
	Double Monthly_inst;
	Float Duration;
	Double Amt_paid;
	int LoaneeID,flag=0;
	Double Total_amt_remaining;
	while(rs.next())
	{
		Principal=(rs.getDouble("Principal")); 
		Monthly_inst=(rs.getDouble("Monthly_inst"));
		Duration=(rs.getFloat("Duration"));
		Amt_paid=(rs.getDouble("Amt_paid"));
		LoaneeID=(rs.getInt("LoaneeID"));
		Total_amt_remaining=Principal + ( Monthly_inst*Duration*12)- Amt_paid ;
		
		sql1 = "select count(paymentID) as count from duepayments where IsPaid=0 and LoaneeID=?";

		ps1 = con.prepareStatement(sql1);
		ps1.setInt(1,LoaneeID);
		rs1 = ps1.executeQuery();
		%>
	<tr>
		<td><% long CusID=rs.getInt("CustomerID") ;%><%=rs.getInt("CustomerID")%></td>
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
		<td><%=rs.getDouble("Principal") %></td>
		<td><%=rs.getDouble("Monthly_inst") %></td>
		<td><%=rs.getFloat("Duration") %></td>
		<td><%=rs.getString("Amt_paid") %></td>
		<td><%if(Total_amt_remaining > 0) { out.println(Total_amt_remaining);} else{out.println("PAYMENT COMPLETE");flag=1;};%></td>	
		<td><%while(rs1.next()){out.println(rs1.getInt("count"));}; %></td>
		<td><a href="allpaymentdetails_emp.jsp?Id=<%=LoaneeID%>">Show all Payment details</a></td>
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

<script>
$(document).ready(function() {
    $('#maintable').DataTable();
} );
</script>

</body>
</html>