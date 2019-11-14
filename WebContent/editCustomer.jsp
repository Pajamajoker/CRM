<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

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
int CustomerID=(Integer)session.getAttribute("CustomerID");

String sql=("update customer set FirstName=?,LastName=?,Email=?,Address=?,PhoneNum=? where CustomerID=?");
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);

ps.setString(1,firstname);
ps.setString(2,lastname);
ps.setString(4,address);
ps.setString(3,email);
ps.setString(5,phoneno);
ps.setInt(6,CustomerID);

int i= ps.executeUpdate();

if(i!=0)

{ 
//out.println("Data is successfully inserted!");
//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	response.sendRedirect("Customers.jsp");
}
else
{
	out.println("err");
}
%>