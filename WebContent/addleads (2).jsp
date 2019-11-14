<!DOCTYPE html>
<html lang="en">
<head>
  <title>CRM::Add Lead</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <style>
  		span{
  			color:"red";
  		}
 	</style>
</head>
<body>
<script>
	function validate(){
		document.getElementById("first").innerHTML="";
		document.getElementById("last").innerHTML="";
		document.getElementById("phno").innerHTML="";
		document.getElementById("emailid").innerHTML="";
		document.getElementById("add").innerHTML="";
		document.getElementById("prodid").innerHTML="";
		var fname=document.myform.firstname.value;
		var lname=document.myform.lastname.value;
		var email=document.myform.email.value;
		var phoneno=document.myform.phoneno.value;
		var address=document.myform.address.value;
		var pid=document.myform.pid.value;
		var opt = document.getElementsByName("optradio");
		fname=validatename(fname);
		lname=validatelame(lname);
		email=validateemail(email);
		phoneno=validatepno(phoneno);
		address=validateadd(address);
		pid=validatepid(pid);
		opt=validataeopt(opt);
		if(fname==true&&lname==true&&email==true&&phoneno==true&&address==true&&pid==true&&opt==true)
		{
			return true;
		}
		else
			return false;
			
	}
	function validateopt(opt)
	{
		if(opt[0].checked==true&&opt[1].checked==true&&opt[2].checked==true)
		{
			return true;
		}
		else
		{
			document.getElementById("opt").innerHTML="Please fill out";
			return false;
		}
	}
	function validateadd(address)
	{
		if(address==null||address=="")
		{
			document.getElementById("add").innerHTML="Please fill out";
			return false;
		}
		else
			return true;
	}
	function validatepid(pid)
	{
		if(pid==null||pid=="")
		{
			document.getElementById("prodid").innerHTML="Please fill out";
			return false;
		}
		else
			return true;
	}
	function validatename(fname){
		if(fname==null||fname=="")
		{
			document.getElementById("first").innerHTML="Please fill out";
			return false;
		}
		else if (!isNaN(fname)){
			  document.getElementById("first").innerHTML="Enter alphabetic value only";
			  console.log(first);
			  return false;
			}
		else 
			return true;
		
	}
	function validatelame(lname){
		if(lname==null||lname=="")
		{
			document.getElementById("last").innerHTML="Please fill out";
			return false;
		}
		else if (!isNaN(lname)){
			  document.getElementById("last").innerHTML="Enter alphabetic value only";
			  return false;
			}
		else 
			return true;
	}
	function validateemail(email){
		if(email==null||email=="")
		{
			document.getElementById("emailid").innerHTML="Please fill out";
			return false;
		}
		else
		if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)))
		{
			document.getElementById("emailid").innerHTML="You have entered an invalid email address!";
		    return (false);
		}
		else 
			return true;
	}
	function validatepno(phoneno){
		if(phoneno==null||phoneno=="")
		{
			document.getElementById("phno").innerHTML="Please fill out";
			return false;
		}
		else
		if(phoneno.length!=10 && isNaN(phoneno))
		{
			document.getElementById("phno").innerHTML="Enter valid 10 digit number only";
			  return false;
		}
		else 
			return true;	
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
                $(function () {
                $('#datetimepicker1').datetimepicker();
                  });
  </script> 
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
%>
<%@include file="navbar.jsp" %>
<div class="container">
  <h2>Add lead</h2>
  <form action="addleads_middleware.jsp" name="myform" method="post"  >
    <div class="form-group">
      <label for="firstname">First Name:</label>
      <input type="text" class="form-control" id="firstname" placeholder="Enter firstname" name="firstname" required>
      <span id="first" style="color:red"></span>
    </div>
    <div class="form-group">
      <label for="lastname">Last Name:</label>
      <input type="text" class="form-control" id="lastname" placeholder="Enter lastname" name="lastname" required>
      <span id="last" style="color:red"></span>
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="text" class="form-control" id="address" placeholder="Enter address" name="address" required>
      <span id="add" style="color:red"></span>
    </div>
    <div class="form-group">
      <label for="phoneno">Phone no:</label>
      <input type="text" class="form-control" id="phoneno" placeholder="Enter phoneno" name="phoneno" required>
      <span id="phno" style="color:red"></span>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
      <span id="emailid" style="color:red"></span>
    </div>
    <div class="form-group">
      <label for="req">Requirement:</label>
      <input type="text" class="form-control" id="req" placeholder="Enter Requirement" name="req" >
    </div>
    <div class="form-group">
      <label for="pid">Product interested in:</label>
      <input type="text" class="form-control" id="pid" placeholder="Enter Product ID" name="pid" required>
      <span id="prodid" style="color:red"></span>
      
    </div>
    <label>Status:</label>
    <div class="radio">
      <label><input type="radio" name="optradio" value="1">Won</label>
      <label><input type="radio" name="optradio" value="3">Lost</label>
      <label><input type="radio" name="optradio" value="2">Ongoing</label>
    </div>
    <span id="opt" style="color:red"></span>
    <div class="form-group">
      <label for="sel1">Nature:</label>
      <select class="form-control" id="sel1" name="nature">
        <option value="1">Hot</option>
        <option value="2">Warm </option>
        <option value="3">Cold</option>
      </select></div>
      <div class="form-group">
	      <label for="sel2">Credit Score Category:</label>
	      <select class="form-control" id="sel2" name="ccat">
	        <option value="1">Category 1</option>
	        <option value="2">Category 2 </option>
	        <option value="3">Category 3</option>
	      </select></div>
	      
    <div class="form-group">
      <label for="nextaction">Next action:</label>
      <input type="text" class="form-control" id="nextaction" placeholder="Enter next action" name="nextaction">
     
      <label for="nextactiondate">Next action date:</label>
                <div class='input-group date' id='datetimepicker1'>
                    <input type="date" class="form-control" name="date"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
    </div>
                
    <button type="submit" class="btn btn-default" onclick="validate()">Submit</button>
  </form>
</div>

</body>
<script>document.getElementById("leads").setAttribute("class","active");</script>
</html>
