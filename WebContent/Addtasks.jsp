<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>CRM::Add Task</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
%>
<%@include file="navbar.jsp" %>
<div class="container">
  <h2>Add Task</h2>
  <form action="addtasks_middleware.jsp" method="post">
    <div class="form-group">
      <label for="task">Enter Task:</label>
      <input type="text" class="form-control" id="task" placeholder="Enter task" name="task">
    </div>
    <div class="form-group">
      <label for="status">Status:</label>
      <select class="form-control" id="Status" name="Status">
        <option value="1">Incomplete</option>
        <option value="2">Complete </option>
      </select></div>
      <label for="deadline">Deadline</label>
                <div class='input-group date' >
                    <input type="date" class="form-control" name='deadline'/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

</body>
</html>