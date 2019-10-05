<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp" %>
    <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
 %>
 <%String sql = "select * from tasks where EmpID=?";
ps = con.prepareStatement(sql);
int EmpID=(Integer)(session.getAttribute("EmpID"));
int TaskID=0;
ps.setInt(1,EmpID);
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
<a href="Addtasks.jsp"><button type="button" class="btn btn-primary btn-md">Add New Task</button></a>
	<br>
	<br>
  <h2>My Tasks</h2>
  <p>Type something in the input field to search the table for first names, last names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
      <th>LeadID</th>
      	<th>Task</th>
        <th>Start Date</th>
        <th>Status</th>
       
      </tr>
    </thead>
    <tbody id="myTable">
	<%while(rs.next())
	{
	 %>
	<tr>
	 <%long  taskid=rs.getInt("TaskID"); %>
		<td id="taskid"><%=rs.getInt("TaskID")%></td>
		<td><%=rs.getString("Task") %></td>
		<td><%=rs.getString("Start_date") %></td>
		<td><%int k=rs.getInt("Status");
		if(k==1)
			{%>
			Incomplete&nbsp;&nbsp;&nbsp;&nbsp;<a href="task_complete.jsp?Id=<%=taskid%>"><% out.println("Mark as complete"); %> </a>
			<%}
			else if(k==2)
			out.println("Complete");%></td>	
	</tr>
	<%}%>	
    </tbody>
  </table>
  

</div>

</body>
<script>document.getElementById("tasks").setAttribute("class","active");
</script>

</html>