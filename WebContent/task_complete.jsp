<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<% 
	Connection con= null;

	PreparedStatement ps = null;

	ResultSet rs = null;



	String driverName = "com.mysql.jdbc.Driver";

	String url = "jdbc:mysql://localhost:3306/test_jsp";

	String user = "root";

	String dbpsw = "";

	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	String sql="update tasks set Status=2 ,due=0 where TaskID=?" ;
	ps = con.prepareStatement(sql);
	ps.setInt(1,Integer.parseInt(request.getParameter("Id")));// 
	int i = ps.executeUpdate();
	if( i!=0)
	{
		response.sendRedirect("tasks.jsp");	
	}
	
	//rs.close();
	con.close();
	%>