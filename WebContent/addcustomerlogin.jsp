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
int CustomerID=0;
CustomerID=Integer.parseInt(request.getParameter("Id"));
String dbpsw = "";
String sql=null;
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
sql="insert into cuslogin(CustomerID) values (?)";
		ps = con.prepareStatement(sql);
		ps.setInt(1,CustomerID);
		ps.executeUpdate();
		response.sendRedirect("leads.jsp");
		%>