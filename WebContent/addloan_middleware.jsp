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

int creditcat=Integer.parseInt(request.getParameter("creditcat"));
int TypeID=Integer.parseInt(request.getParameter("pid"));
int CustomerID=(Integer)session.getAttribute("CustomerID");//this LeadID is to be passed to preparedStatement P.S. see *
String sql=null;
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
	double principal=0,duration=0;
	principal=Double.parseDouble(request.getParameter("principal"));
	duration=Double.parseDouble(request.getParameter("duration"));	
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
		
		response.sendRedirect("Customers.jsp");

rs.close();
con.close();
%>