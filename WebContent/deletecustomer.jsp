<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<% int CustomerID=Integer.parseInt(request.getParameter("CustomerID"));

	Connection con= null;

	PreparedStatement ps = null;

	ResultSet rs = null;



	String driverName = "com.mysql.jdbc.Driver";

	String url = "jdbc:mysql://localhost:3306/test_jsp";

	String user = "root";

	String dbpsw = "";

	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	String sql="delete from customer where CustomerID=?" ;
	ps = con.prepareStatement(sql);
	ps.setInt(1,CustomerID);// * here 
	int i = ps.executeUpdate();
	if( i!=0)
	{
		response.sendRedirect("Customers.jsp");	
	}
	
	//rs.close();
	con.close();
	%>