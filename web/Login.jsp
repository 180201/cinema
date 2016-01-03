<%--
  Created by IntelliJ IDEA.
  User: Michał
  Date: 2015-12-24
  Time: 15:33
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
<ul class="nav nav-pills">
    <li role="presentation" ><a href="Home.jsp">Home</a></li>
    <li role="presentation" ><a href="Register.jsp">Register</a></li>
    <li role="presentation" class="active"><a href="Login.jsp">Login</a></li>
    <li role="presentation"><a href="Reservations.jsp">Reservations</a></li>
</ul>
    Login
    <form method="post" action="Login">
        <div style="width: 40%;">
            <input type="text" class="form-control" id="name" name="name"/>
            <input type="text" class="form-control" id="sureName" name="sureName"/>
            <button type="submit" class="btn btn-default">Submit</button>
        </div>
    </form>
</body>
</html>
