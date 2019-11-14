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
  <h2><%="Customer Loan Information"	%></h2>
  
  <form action="addloan_middleware.jsp" method="post" id="mainform">
    <div class="form-group">
      <label for="firstname">First Name:</label>
      <input type="firstname" class="form-control" id="firstname" placeholder="Enter firstname" name="firstname" readonly value=<%=FirstName%>  >
    </div>
    <div class="form-group">
      <label for="lastname">Last Name:</label>
      <input type="lastname" class="form-control" id="lastname" placeholder="Enter email" name="lastname" readonly value=<%=LastName%>>
    </div>
    <div class="form-group">
      <label for="pid">Product interested in:</label>
      <input type="pid" class="form-control" id="pid" placeholder="Enter Product ID" name="pid">
    </div>
    
      <div class="form-group">
      <label for="sel1">Credit Score Category:</label>
      <select class="form-control" name="creditcat" id="sel1">
        <option value="1">Category 1</option>
        <option value="2">Category 2 </option>
        <option value="3">Category 3</option>
      </select></div>
      
      <div class="form-group">
      <label for="principal">Prinicpal Amount:</label>
      <input class="form-control" id="principal" placeholder="Enter Principal Amount" name="principal" >
    </div>
    
    <div class="form-group">
      <label for="duration">Duration ( IN YEARS ) :</label>
      <input  class="form-control" id="duration" placeholder="Enter duration in Years" name="duration" >
    </div>
    

  </form>
	<button type="submit" class="btn btn-default" form="mainform" >Add as Customer</button>&nbsp;&nbsp;&nbsp;&nbsp;
   
</div> 
  <script>document.getElementById("customers").setAttribute("class","active");</script>

</body>	
</html>
