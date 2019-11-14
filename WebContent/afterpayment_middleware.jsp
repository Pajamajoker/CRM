<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
    if(session.getAttribute("navbar_var")==null)
    {
    response.sendRedirect("signin.jsp");//if invalid session found then redirect to login
    }%>
<%

int LoaneeID=Integer.parseInt(request.getParameter("Id"));

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;



String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/test_jsp";

String user = "root";

String dbpsw = "";
String sql="update loans set Amt_paid= Amt_paid + Monthly_inst ,IsPaid=1 where LoaneeID=?";
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setInt(1,LoaneeID);
int i=ps.executeUpdate();
if( i!=0)
{
	response.sendRedirect("AllSales.jsp");
}
else
{
	out.println("err");
}
%>