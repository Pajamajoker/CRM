<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Welcome</title>

</head>

<body>
<%@include file="navbar.jsp" %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages

if(session.getAttribute("name")!=null) {%>
<p>Welcome, <%=session.getAttribute("name")%></p>
<%}
else
out.println("invalid session!");%>
<p><a href="logout.jsp">Logout</a>

</body>

</html>