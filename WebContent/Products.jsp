<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp" %>
    <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
 %>
 <%String sql = "select * from loandetails";
ps = con.prepareStatement(sql);
int EmpID=(Integer)(session.getAttribute("EmpID"));

rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>CRM:tasks</title>
	<link rel="stylesheet" type="text/css" href="resources/css/leads.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> <!--//bootstrap link   -->
	
</head>
<body>

<div class="container">
<br>
<br>
  <h2>All Products</h2>
  <p>Type something in the input field to search the table for first names, last names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
      	<th>TypeID</th>
        <th>Type</th>
        <th>InterestRate</th>
       	<th>Description</th>
      </tr>
    </thead>
    <tbody id="myTable">
	<%while(rs.next())
	{%>
	<tr>
		<td><%=rs.getString("TypeID") %></td>
		<td><%=rs.getString("Type") %></td>
		<td><%=rs.getInt("InterestRate")%></td>	
		<td><%=rs.getString("Description") %></td>
		
	</tr>
	<%}%>	
    </tbody>
  </table>
  

</div>

</body>
<script>document.getElementById("products").setAttribute("class","active");
</script>
</html>