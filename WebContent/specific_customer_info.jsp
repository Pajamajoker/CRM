<!DOCTYPE html>
<html lang="en">
<head>
  <title>CRM::Lead Info</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  
</head>
<body>
<script>
function validate(){
	
	document.getElementById("first").innerHTML="";
	document.getElementById("last").innerHTML="";
	document.getElementById("phno").innerHTML="";
	document.getElementById("emailid").innerHTML="";
	document.getElementById("add").innerHTML="";
	
	
	var fname=document.myform.firstname.value;
	var lname=document.myform.lastname.value;
	var email=document.myform.email.value;
	var phoneno=document.myform.phoneno.value;
	var address=document.myform.address.value;
	
	fname=validatename(fname);
	lname=validatelame(lname);
	email=validateemail(email);
	phoneno=validatepno(phoneno);
	address=validateadd(address);
	
	if(fname==true&&lname==true&&email==true&&phoneno==true&&address==true)
	{
		
		$("#myform").submit();
	}
	else
		{
		
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

<%@include file="navbar.jsp" %>
<%/*response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
    if(session.getAttribute("navbar_var")==null)
    {
    response.sendRedirect("signin.jsp");//if invalid session found then redirect to login
    }*/%>

<% 
	String FirstName=null;
	String LastName=null;
	String Email=null;
	String Address=null;
	String PhoneNum=null;
	int Status=0;
	int Nature=0;
	int CreditCat=0;
	String Requirement=null;
	String Next_action=null;
	Date Next_action_date=null;
	int TypeID=0;
	int CustomerID=Integer.parseInt(request.getParameter("Id"));//this LeadID is to be passed to preparedStatement P.S. see *
	
	String sql="select * from customer where CustomerID =? ";
	ps = con.prepareStatement(sql);
	ps.setInt(1,CustomerID);// * here 
	rs = ps.executeQuery();
	while(rs.next())
	{
		 CustomerID=rs.getInt("CustomerID");
		 FirstName=rs.getString("FirstName");
		 LastName=rs.getString("LastName");
		 Email=rs.getString("Email");
		 Address=rs.getString("Address");
		 PhoneNum=rs.getString("PhoneNum");
	}
	rs.close();
	con.close();
	session.setAttribute("CustomerID",CustomerID);
	%>
<div class="container" id="container">
  <h2><%="Customer Information"	%></h2>
  
  <form action="editCustomer.jsp" method="post" id="myform" name="myform">
    <div class="form-group">
      <label for="firstname">First Name:</label>
      <input class="form-control" id="firstname" placeholder="Enter firstname" name="firstname" readonly value="<%=FirstName%>" >
      <span id="first" style="color:red"></span>
    </div>
    <div class="form-group">
      <label for="lastname">Last Name:</label>
      <input  class="form-control" id="lastname" placeholder="Enter email" name="lastname" readonly value="<%=LastName%>">
      <span id="last" style="color:red"></span>
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input  class="form-control" id="address" placeholder="Enter address" name="address" readonly value="<%=Address%>">
      <span id="add" style="color:red"></span>
    </div>
    <div class="form-group">
      <label for="phoneno">Phone no:</label>
      <input class="form-control" id="phoneno" placeholder="Enter phoneno" name="phoneno" readonly value="<%=PhoneNum%>">
      <span id="phno" style="color:red"></span>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input  class="form-control" id="email" placeholder="Enter email" name="email" readonly value="<%=Email%>">
      <span id="emailid" style="color:red"></span>
    </div>
    
  </form>
  <% if(Status!=1) {%> <button type="submit" class="btn btn-default" style="background-color:#24a0ed" id="edit" onclick="toggleReadOnly()">Edit</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<% }%>
	<button type="submit" class="btn btn-default" style="background-color:#f44336" onclick=" Confirm()">Delete</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn btn-default" onclick="location.href = 'addAnotherLoan.jsp?Id=<%=CustomerID%>'">Add another Loan</button>&nbsp;&nbsp;&nbsp;&nbsp;

</div> 




</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  document.getElementById("customers").setAttribute("class","active");
                $(function () {
                $('#datetimepicker1').datetimepicker();
                  });
                
  function	 Confirm()
  {
	 console.log("hello");
	  var txt;
	  if (confirm("Are you sure you want to delete this lead permanently")) {
		 window.location.replace("deletecustomer.jsp?CustomerID=<%=CustomerID%>");
	  } else {
	   	
	  } 
  }
  
  var typ='on';
  var flag=0;
  function toggleReadOnly()
  {
   if (typ=='on')
   {
    document.getElementById('firstname').readOnly=false
    document.getElementById('lastname').readOnly=false
    document.getElementById('address').readOnly=false
    document.getElementById('phoneno').readOnly=false
    document.getElementById('email').readOnly=false
    //typ='off';
   }else
   {
    document.getElementById('firstname').readOnly=true
    document.getElementById('lastname').readOnly=true
    document.getElementById('address').readOnly=true
    document.getElementById('phoneno').readOnly=true
    document.getElementById('email').readOnly=true
    typ='on';
   }
   
   
  // function myFunction() 
   {
	  var docdiv =document.getElementById('container');
     var btn = document.createElement("BUTTON");
     btn.innerHTML = "Submit";
     btn.setAttribute("style","background-color:#24a0ed");
     btn.setAttribute("type","submit");
     btn.setAttribute("class","btn btn-default");
     btn.setAttribute("class","btn btn-default");
     btn.setAttribute("id","submit");
    // btn.setAttribute("onclick","location.href = 'editlead.jsp?Id="   '");
   // btn.setAttribute("onclick","location.href = 'editcustomer.jsp'");
   btn.setAttribute("onclick","validate()");
    btn.setAttribute("form","mainform");

     if(flag===0)
     {
     docdiv.appendChild(btn);
     flag=flag+1;
     }
   }

   //<button onclick="myFunction()">Try it</button>

  }
  </script> 
</html>
