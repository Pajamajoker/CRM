<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
    if(session.getAttribute("navbar_var")==null)
    {
    response.sendRedirect("signin.jsp");//if invalid session found then redirect to login
    }%>
<%
Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;



String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/test_jsp";

String user = "root";

String dbpsw = "";

String task=request.getParameter("task");
int status=Integer.parseInt(request.getParameter("Status"));
String deadline=request.getParameter("deadline");

int EmpID=(Integer)(session.getAttribute("EmpID"));

String sql="insert into tasks(EmpID,Task,Start_date,Status)values(?,?,?,?)";
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setInt(1,EmpID);
ps.setString(2,task);
ps.setString(3,deadline);
ps.setInt(4,status);
int i= ps.executeUpdate();

if(i!=0)

{ 
//out.println("Data is successfully inserted!");
//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	response.sendRedirect("tasks.jsp");
}
else
{
	out.println("err");
}
%>