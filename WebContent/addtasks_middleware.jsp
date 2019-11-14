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
String name=request.getParameter("taskname");
int EmpID=(Integer)(session.getAttribute("EmpID"));

String sql="insert into tasks(Name,EmpID,Task,Start_date,Status)values(?,?,?,?,?)";
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

ps.setString(1,name);
ps.setInt(2,EmpID);
ps.setString(3,task);
ps.setString(4,deadline);
ps.setInt(5,status);
int i= ps.executeUpdate();
int TaskID=0;
if(i!=0)

{ 
//out.println("Data is successfully inserted!");
//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	rs=ps.getGeneratedKeys();//request primary key here
	if (rs.next()) 
	{
		TaskID=rs.getInt(1); //set last inserted primary key as int_rate
	}
	sql="create event event"+ TaskID + " on schedule at('" + deadline + " 00:00:00') do update tasks set due=1 where TaskID=?;";
	con = DriverManager.getConnection(url, user, dbpsw);
	ps = con.prepareStatement(sql);
	ps.setInt(1,TaskID);
	i= ps.executeUpdate();
	response.sendRedirect("tasks.jsp");
}
else
{
	out.println("err");
}



%>