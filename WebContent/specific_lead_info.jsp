<!DOCTYPE html>
<html lang="en">
<head>
  <title>CRM::Lead Info</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  
</head>
<body>
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
	int LeadID=Integer.parseInt(request.getParameter("Id"));//this LeadID is to be passed to preparedStatement P.S. see *
	String sql="select * from leads where LeadID =? ";
	ps = con.prepareStatement(sql);
	ps.setInt(1,LeadID);// * here 
	rs = ps.executeQuery();
	while(rs.next())
	{
		 LeadID=rs.getInt("LeadID");
		 FirstName=rs.getString("FirstName");
		 LastName=rs.getString("LastName");
		 Email=rs.getString("Email");
		 Address=rs.getString("Address");
		 PhoneNum=rs.getString("PhoneNum");
		 Status=rs.getInt("Status");
		 Nature=rs.getInt("Nature");
		 Requirement=rs.getString("Requirement");
		 Next_action=rs.getString("Next_action");
		 Next_action_date=rs.getDate("Next_action_date");
		 TypeID=rs.getInt("TypeID");
		 CreditCat=rs.getInt("CreditCat");

	}
	rs.close();
	con.close();
	session.setAttribute("LeadID",LeadID);
	%>
<div class="container" id="container">
  <h2><%="Lead Information"	%></h2>
  
  <form action="editlead.jsp" method="post" id="mainform">
    <div class="form-group">
      <label for="firstname">First Name:</label>
      <input class="form-control" id="firstname" placeholder="Enter firstname" name="firstname" readonly value="<%=FirstName%>" >
    </div>
    <div class="form-group">
      <label for="lastname">Last Name:</label>
      <input  class="form-control" id="lastname" placeholder="Enter email" name="lastname" readonly value="<%=LastName%>">
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input  class="form-control" id="address" placeholder="Enter address" name="address" readonly value="<%=Address%>">
    </div>
    <div class="form-group">
      <label for="phoneno">Phone no:</label>
      <input class="form-control" id="phoneno" placeholder="Enter phoneno" name="phoneno" readonly value="<%=PhoneNum%>">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input  class="form-control" id="email" placeholder="Enter email" name="email" readonly value="<%=Email%>">
    </div>
    <div class="form-group">
      <label for="req">Requirement:</label>
      <input  class="form-control" id="req" placeholder="Enter Requirement" name="req" readonly value="<%=Requirement %>">
    </div>
    <div class="form-group">
      <label for="pid">Product interested in:</label>
      <input  class="form-control" id="pid" placeholder="Enter Product ID" name="pid"  readonly value=<% 
      	int i=TypeID;
		if(i==1)
		out.println("Home Loan");
		else if(i==2)
		out.println("Vehicle Loan");
		else if(i==3)
		out.println("Education Loan"); %>>
    </div>
    
    <label>Status:</label>
    <div class="radio">
      <label><input type="radio" name="optradio" id="optradio"<%if(Status==1){ %> checked <%} %> readonly value="1">Won</label>
      <label><input type="radio" name="optradio"  id="optradio"<%if(Status==3){ %> checked <%} %> readonly value="3">Lost</label>
      <label><input type="radio" name="optradio"  id="optradio"<%if(Status==2){ %> checked <%} %> readonly value="2">Ongoing</label>
    </div>
    <div class="form-group">
      <label for="sel1">Nature:</label>
      <select class="form-control" name="nature" id="sel1" readonly value=<%
      	int j=Nature;
		if(j==1)
		out.println("Hot");
		else if(j==2)
		out.println("Warm");
		else if(j==3)
		out.println("Cold"); %>>
        <option value="1">Hot</option>
        <option value="2">Warm </option>
        <option value="3">Cold</option>
      </select></div>
      <div class="form-group">
      <label for="sel1">Credit Score Category:</label>
      <select class="form-control" name="nature" id="sel1" readonly value=<%
      	int k=CreditCat;
		if(k==1)
		out.println("Category 1");
		else if(k==2)
		out.println("Category 2");
		else if(k==3)
		out.println("Category 3"); %>>
        <option value="1">Category 1</option>
        <option value="2">Category 2 </option>
        <option value="3">Category 3</option>
      </select></div>
    <div class="form-group">
      <label for="nextaction">Next action:</label>
      <input type="nextaction" class="form-control" id="nextaction" placeholder="Enter next action" name="nextaction" readonly value=<%=Next_action %>>
      <label for="nextactiondate" >Next action date:</label>
                <div class='input-group date' id='datetimepicker1' >
                    <input type='text' class="form-control" readonly value=<%=Next_action_date %>>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
    </div>
    
   	
  </form>
  <% if(Status!=1) {%> <button type="submit" class="btn btn-default" style="background-color:#24a0ed" id="edit" onclick="toggleReadOnly()">Edit</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<% }%>
	<button type="submit" class="btn btn-default" style="background-color:#f44336" onclick=" Confirm()">Delete</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<% if(Status!=1) {%><button type="button" class="btn btn-default" onclick="location.href = 'AddCustomer.jsp'">Add as Customer</button>&nbsp;&nbsp;&nbsp;&nbsp;
   <% }%>
</div> 




</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  document.getElementById("leads").setAttribute("class","active");
                $(function () {
                $('#datetimepicker1').datetimepicker();
                  });
                
  function	 Confirm()
  {
	 console.log("hello");
	  var txt;
	  if (confirm("Are you sure you want to delete this lead permanently")) {
		 window.location.replace("deletelead.jsp?LeadID=<%=LeadID%>");
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
    document.getElementById('req').readOnly=false
    document.getElementById('pid').readOnly=false
    document.getElementById('firstname').readOnly=false
    document.getElementById('optradio').readOnly=false
    document.getElementById('firstname').readOnly=false
    document.getElementById('sel1').readOnly=false
    document.getElementById('nextaction').readOnly=false
    //typ='off';
   }else
   {
    document.getElementById('firstname').readOnly=true
    document.getElementById('lastname').readOnly=true
    document.getElementById('address').readOnly=true
    document.getElementById('phoneno').readOnly=true
    document.getElementById('email').readOnly=true
    document.getElementById('req').readOnly=true
    document.getElementById('pid').readOnly=true
    document.getElementById('firstname').readOnly=true
    document.getElementById('optradio').readOnly=true
    document.getElementById('firstname').readOnly=true
    document.getElementById('sel1').readOnly=true
    document.getElementById('nextaction').readOnly=true
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
    btn.setAttribute("onclick","location.href = 'editlead.jsp'");
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
