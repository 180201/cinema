<%@ page import="singleton.User" %><%--
  Created by IntelliJ IDEA.
  singleton.User: Michał
  Date: 2015-12-28
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cinema</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
HOME sweet home
<br>
<ul class="nav nav-pills">
    <%
        String userName = "";
//        Object user = request.getAttribute("user");
        try{
            userName = User.getInstance().getName();
        }
        catch (Exception e){
            userName = "";

        }
    %>
    <h2><%=userName %></h2>
    <li role="presentation" class="active"><a href="Home.jsp">Home</a></li>
    <li role="presentation" ><a href="Register.jsp">Register</a></li>
    <li role="presentation"><a href="Login.jsp">Login</a></li>
    <li role="presentation"><a href="Reservations.jsp">Reservations</a></li>
</ul>



</body>
</html>
