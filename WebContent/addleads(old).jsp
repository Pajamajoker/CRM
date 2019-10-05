<!DOCTYPE html>
<html lang="en">
<head>
  <title>CRM::Add Lead</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  
</head>
<body>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
%>
<%@include file="navbar.jsp" %>
<div class="container">
  <h2>Add lead</h2>
  <form action="addleads_middleware.jsp" method="post">
    <div class="form-group">
      <label for="firstname">First Name:</label>
      <input type="firstname" class="form-control" id="firstname" placeholder="Enter firstname" name="firstname">
    </div>
    <div class="form-group">
      <label for="lastname">Last Name:</label>
      <input type="lastname" class="form-control" id="lastname" placeholder="Enter email" name="lastname">
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="address" class="form-control" id="address" placeholder="Enter address" name="address">
    </div>
    <div class="form-group">
      <label for="phoneno">Phone no:</label>
      <input type="phoneno" class="form-control" id="phoneno" placeholder="Enter phoneno" name="phoneno">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="form-group">
      <label for="req">Requirement:</label>
      <input type="req" class="form-control" id="req" placeholder="Enter Requirement" name="req">
    </div>
    <div class="form-group">
      <label for="pid">Product interested in:</label>
      <input type="pid" class="form-control" id="pid" placeholder="Enter Product ID" name="pid">
    </div>
    <label>Status:</label>
    <div class="radio">
      <label><input type="radio" name="optradio" checked value="1">Won</label>
      <label><input type="radio" name="optradio" value="3">Lost</label>
      <label><input type="radio" name="optradio" value="2">Ongoing</label>
    </div>
    <div class="form-group">
      <label for="sel1">Nature:</label>
      <select class="form-control" id="sel1" name="nature">
        <option value="1">Hot</option>
        <option value="2">Warm </option>
        <option value="3">Cold</option>
      </select></div>
    <div class="form-group">
      <label for="nextaction">Next action:</label>
      <input type="nextaction" class="form-control" id="nextaction" placeholder="Enter next action" name="nextaction">
      <label for="nextactiondate">Next action date:</label>
                <div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
    </div>
                
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
                $(function () {
                $('#datetimepicker1').datetimepicker();
                  });
  </script> 
</html>
