<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp" %>
    <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
 %>


<%String sql = "select * from leads where EmpID=?";
ps = con.prepareStatement(sql);
int EmpID=(Integer)(session.getAttribute("EmpID"));
ps.setInt(1,EmpID);
rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<title>CRM::Leads</title>
	<link rel="stylesheet" type="text/css" href="resources/css/leads.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<br>
<br>
<div class="row">
  <div class="col-lg-4"></div>
  <div class="col-lg-12">
<a href="addleads.jsp"><button type="button" class="btn btn-primary btn-md">Add New Lead</button>
<a href="All_leads.jsp"><button type="button" class="btn btn-primary btn-md">Show all Leads</button><!-- button,TODO add functionality,redirect to add lead --></a>
	<br>
	<br>
  <h2>My Leads</h2>
  <p>Type something in the input field to search the table for first names, last names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  
  
  <table class="table table-bordered table-striped" id="maintable">
    <thead>
      <tr>
      	<th>LeadID</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Address</th>
        <th>PhoneNum</th>
        <th>Status</th>
        <th>Nature</th>
        <th>Requirement</th>
        <th>Product Type</th>
        <th>Credit Score Category</th>
        <th>Next_
        action</th>
        <th>Next_action_
        date</th>
       
      </tr>
    </thead>
    <tbody id="myTable">
	<%while(rs.next())
	{%>
	<tr>
		<%long  Id=rs.getInt("LeadID"); %>
		<td><a href="specific_lead_info.jsp?Id=<%=Id%>"><%=rs.getInt("LeadID")%></a></td>
		<td><%=rs.getString("FirstName") %></td>
		<td><%=rs.getString("LastName") %></td>
		<td><%=rs.getString("Email") %></td>
		<td><%=rs.getString("Address") %></td>
		<td><%=rs.getString("PhoneNum") %></td>
		<td><%int k=rs.getInt("Status");
		if(k==1)
			out.println("Won");
			else if(k==2)
			out.println("Ongoing");
			else if(k==3)
			out.println("Lost");%></td>
		<td><% int j=rs.getInt("Nature");
			if(j==1)
			out.println("Hot");
			else if(j==2)
			out.println("Warm");
			else if(j==3)
			out.println("Cold");%></td>
			
		<td><%=rs.getString("Requirement") %></td>
		
		<td><% int i=rs.getInt("TypeID");
			if(i==1)
			out.println("Home Loan");
			else if(i==2)
			out.println("Vehicle Loan");
			else if(i==3)
			out.println("Educational Loan");
			%></td>
		<td><% int l=rs.getInt("CreditCat");
			if(l==1)
			out.println("1");
			else if(l==2)
			out.println("2");
			else if(l==3)
			out.println("3");
			%></td>
		<td><%=rs.getString("Next_action") %></td>
		<td><%=rs.getDate("Next_action_date") %></td>
		
	</tr>
	<%}%>	
    </tbody>
  </table>
  </div>
</div>
</div>

<script>
document.getElementById("leads").setAttribute("class","active");
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