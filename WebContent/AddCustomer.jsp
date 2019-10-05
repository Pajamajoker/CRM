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
	int LeadID=(Integer)session.getAttribute("LeadID");//this LeadID is to be passed to preparedStatement P.S. see *
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
  <h2><%="Customer Loan Information"	%></h2>
  
  <form action="Addcustomer_middleware.jsp" method="post" id="mainform">
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
      <input type="pid" class="form-control" id="pid" placeholder="Enter Product ID" name="pid"  readonly value=<% 
      	int i=TypeID;
		if(i==1)
		out.println("Home Loan");
		else if(i==2)
		out.println("Vehicle Loan");
		else if(i==3)
		out.println("Education Loan"); %>>
    </div>
    
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

</body>	
</html>
