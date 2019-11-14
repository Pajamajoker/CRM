<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login</title>

</head>

<body>
<%@page import="java.sql.*" %>
<%! int userdbName;

String userdbPsw;

String dbUsertype;

%>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

int navbar_var;

String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/test_jsp";

String user = "root";

String dbpsw = "";



String sql = "select * from cuslogin where CustomerID=? and pass=?";

response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
int CustomerID=0;

CustomerID = Integer.parseInt(request.getParameter("name"));

String password = request.getParameter("password");


//String usertype = request.getParameter("usertype");



if((!(CustomerID==0)) && !(password.equals(null) || password.equals(""))) 

{

try{

Class.forName(driverName);

con = DriverManager.getConnection(url, user, dbpsw);

ps = con.prepareStatement(sql);

ps.setInt(1, CustomerID);

ps.setString(2, password);



rs = ps.executeQuery();

if(rs.next())

{ 
userdbName = rs.getInt("CustomerID");

userdbPsw = rs.getString("pass");

if(CustomerID==(userdbName) && password.equals(userdbPsw) )

{

session.setAttribute("CustomerID",CustomerID);
session.setAttribute("navbar_var",1);


response.sendRedirect("customer_dashboard.jsp"); 
//out.println("success");
} 

}

else

response.sendRedirect("error.jsp");
//	out.println("failed");

rs.close();

ps.close(); 

}

catch(SQLException sqe)

{

out.println(sqe);

} 

}

else

{

%>

<center><p style="color:red">Error In Login</p></center>

<% 

//getServletContext().getRequestDispatcher("/home.jsp").include(request, response);

}

%>

</body>

</html>