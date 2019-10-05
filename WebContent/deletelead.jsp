<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<% int LeadID=Integer.parseInt(request.getParameter("LeadID"));

	Connection con= null;

	PreparedStatement ps = null;

	ResultSet rs = null;



	String driverName = "com.mysql.jdbc.Driver";

	String url = "jdbc:mysql://localhost:3306/test_jsp";

	String user = "root";

	String dbpsw = "";

	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	String sql="delete from leads where LeadID=?" ;
	ps = con.prepareStatement(sql);
	ps.setInt(1,LeadID);// * here 
	int i = ps.executeUpdate();
	if( i!=0)
	{
		response.sendRedirect("leads.jsp");	
	}
	
	//rs.close();
	con.close();
	%>