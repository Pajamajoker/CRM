<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
    if(session.getAttribute("navbar_var")==null)
    {
    response.sendRedirect("signin.jsp");//if invalid session found then redirect to login
    }
%>
<% 
Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;



String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/test_jsp";

String user = "root";

String dbpsw = "";

int CustomerID=0;
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
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
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


sql="insert into customer(FirstName,LastName,Email,Address,PhoneNum)values (?,?,?,?,?)";
ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);//used to return last inserted primarykey
ps.setString(1,FirstName);	
ps.setString(2,LastName);
ps.setString(3,Email);
ps.setString(4,Address);
ps.setString(5,PhoneNum);
int i=ps.executeUpdate();
if(i==0)
{
	out.println("error occured");
}
else
{
	rs=ps.getGeneratedKeys();//request primary key here
	if (rs.next()) 
	{
		CustomerID=rs.getInt(1); //set last inserted primary key as int_rate
	}
	
	double principal=0,duration=0;
	principal=Double.parseDouble(request.getParameter("principal"));
	duration=Double.parseDouble(request.getParameter("duration"));
	sql="update leads set status=1 where LeadID="+(Integer)session.getAttribute("LeadID");
	ps = con.prepareStatement(sql);
	 i=ps.executeUpdate();
	if(i==0)
	{
		out.println("error occured");
	}
	else
	{	
		//TODO
		//call a stored procedure here 
		//pass CusID,EmpID from session to procedure,also principal and duration
		//calculate monthly interest in the stored procedure
		sql="select InterestRate from loanDetails where TypeID =?";
		ps = con.prepareStatement(sql);
		ps.setInt(1,TypeID);
		rs=ps.executeQuery();
		float int_rate=0;
		while(rs.next())
		{
			int_rate=rs.getFloat("InterestRate");
		}
		
		
		sql="{CALL insLoanDetails(?,?,?,?,?,?)}";
		ps = con.prepareStatement(sql);
		ps.setInt(1,CustomerID);
		ps.setInt(2,(Integer)session.getAttribute("EmpID"));
		ps.setInt(3,TypeID);
		ps.setDouble(4,principal);
		ps.setDouble(5,duration);
		ps.setFloat(6,int_rate);
		rs = ps.executeQuery();
		
		response.sendRedirect("addcustomerlogin.jsp?Id="+CustomerID);
	}
		

	
}
rs.close();
con.close();
%>