<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
    if(session.getAttribute("navbar_var")==null)
    {
    response.sendRedirect("signin.jsp");//if invalid session found then redirect to login
    }%>
<%

request.getParameter("firstname");

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;



String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/test_jsp";

String user = "root";

String dbpsw = "";

String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String address=request.getParameter("address");
String email=request.getParameter("email");
String phoneno=request.getParameter("phoneno");
String req=request.getParameter("req");
String pid=request.getParameter("pid");
int status=Integer.parseInt(request.getParameter("optradio"));
int nature=Integer.parseInt(request.getParameter("nature"));
String nextaction=request.getParameter("nextaction");
String nextactiondate=request.getParameter("date");
int TypeID=Integer.parseInt(request.getParameter("pid"));
int CreditCat=Integer.parseInt(request.getParameter("ccat"));

String sql=("insert into leads(FirstName,LastName,Email,Address,PhoneNum,Status,Nature,Requirement,Next_action,Next_action_date,TypeID,EmpID,CreditCat)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);

ps.setString(1,firstname);
ps.setString(2,lastname);
ps.setString(4,address);
ps.setString(3,email);
ps.setString(5,phoneno);
ps.setString(8,req);
ps.setInt(6,status);
ps.setInt(7,nature);
ps.setString(9,nextaction);
ps.setString(10,nextactiondate);
ps.setInt(11,TypeID);
ps.setInt(12,(Integer)session.getAttribute("EmpID"));
ps.setInt(13,CreditCat);




try{

	int i= ps.executeUpdate();
	if(i!=0)
	
	{ 
	//out.println("Data is successfully inserted!");
	//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		response.sendRedirect("leads.jsp");
	}
	else
	{
	
	}

}
catch(SQLException e)
{
	response.sendRedirect("LeadsError.jsp");
}
%>