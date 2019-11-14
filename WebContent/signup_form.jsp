<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>Bootstrap Elegant Sign Up Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
    span{
  			color:"red";
  		}
	body {
		color: #999;
		background: #fafafa;
		font-family: 'Roboto', sans-serif;
	}
	.form-control {
        min-height: 41px;
		box-shadow: none;
		border-color: #e6e6e6;
	}
	.form-control:focus {
		border-color: #00c1c0;
	}
    .form-control, .btn {        
        border-radius: 3px;
    }
	.signup-form {
		width: 425px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.signup-form h2 {
		color: #333;
		font-weight: bold;
        margin: 0 0 25px;
    }
    .signup-form form {
    	margin-bottom: 15px;
        background: #fff;
		border: 1px solid #f4f4f4;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 40px 50px;
    }
	.signup-form .form-group {
		margin-bottom: 20px;
	}
	.signup-form label {
		font-weight: normal;
		font-size: 13px;
	}
	.signup-form input[type="checkbox"] {
		margin-top: 2px;
	}    
    .signup-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #00c1c0;
		border: none;
		min-width: 140px;
        outline: none !important;
    }
	.signup-form .btn:hover, .signup-form .btn:focus {
		background: #00b3b3;
	}
	.signup-form a {
		color: #00c1c0;
		text-decoration: none;
	}	
	.signup-form a:hover {
		text-decoration: underline;
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
                    document.getElementById("conpass").innerHTML="";
                    var fname=document.myform.firstname.value;
		            var lname=document.myform.lastname.value;
		            var email=document.myform.email.value;
		            var phoneno=document.myform.phoneno.value;
		            var address=document.myform.address.value;
		            var password=document.myform.Password.value;
		            var conpasss=document.myform.ConfirmPassword.value;
                    fname=validatename(fname);
		lname=validatelame(lname);
		email=validateemail(email);
		phoneno=validatepno(phoneno);
		address=validateadd(address);
		pass=validatepass(password,conpasss);
        if(fname==true&&lname==true&&email==true&&phoneno==true&&address==true)
		{
			return true;
		}
		else
			return false;
			
	}
    function validatepass(password,conpasss)
    {
    	if(password==conpasss)
    	{
    		return true;
    	}
    	else
    		{
    			document.getElementById("conpass").innerHTML="Passwords dont match";
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


<div class="signup-form">
    <form action="signup_form_middleware.jsp" method="post" id="myform" name="myform">
        <h2 style="text-align:center">Sign Up</h2>
        
        <div class="form-group">
            <input type="text" class="form-control" name="firstname" placeholder="First name" required="required" >
            <span id="first" style="color:red"></span>
        </div>
        
        <div class="form-group">
            <input type="text" class="form-control" name="lastname" placeholder="Last name" required="required">
            <span id="last" style="color:red"></span>
        </div>
        
        <div class="form-group">
            <input type="text" class="form-control" name="address" placeholder="Address" required="required">
            <span id="add" style="color:red"></span>
        </div>

        <div class="form-group">
            <input type="email" class="form-control" name="email" placeholder="Email Id" required="required">
            <span id="emailid" style="color:red"></span>
        </div>

		<div class="form-group">
            <input type="text" class="form-control" name="phoneno" placeholder="Phone no." required="required">
            <span id="phno" style="color:red"></span>
        </div>  

        <div class="form-group">
                <input type="password" class="form-control" name="Password" placeholder="Password" required="required">
        </div>

        <div class="form-group">
                <input type="password" class="form-control" name="ConfirmPassword" placeholder="Confirm Password" required="required">
                <span id="conpass" style="color:red"></span>
        </div>
        <div class="form-group">
			<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
        </div>
        <center>
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg" onclick="validate()">Sign Up</button>
        </div>
        </center>
    </form>
	
</body>
</html>