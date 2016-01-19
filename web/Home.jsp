<%@ page import="DAO.User" %><%--
  Created by IntelliJ IDEA.
  DAO.User: Michał
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
HOME sweet home
<body>
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
    <h2>${sessionScope.UserSession.name}</h2>
    <h2><%=userName %></h2>
    <li role="presentation" class="active"><a href="Home">Home</a></li>
    <li role="presentation" ><a href="Register">Register</a></li>
    <li role="presentation"><a href="Login">Login</a></li>
    <li role="presentation"><a href="Reservations">Reservations</a></li>
    <li role="presentation"><a href="Logout">Logout</a></li>
</ul>



</body>
</html>
