<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Winiu
  Date: 20-01-2016
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AddMove</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<ul class="nav nav-pills">

    <c:set var="sessionRank" value="${sessionScope.UserSession.rank }"/>
    <c:set var="rankSessionUser" value="${sessionScope.RankSession.userRank }"/>
    <c:set var="rankSessionAdmin" value="${sessionScope.RankSession.adminRank }"/>
    <c:set var="rankSessionCashier" value="${sessionScope.RankSession.cashierRank }"/>


    <c:choose>
        <c:when test="${sessionScope.UserSession ==null}">
            <li role="presentation" class="active"><a href="Home">Home</a></li>
            <li role="presentation" ><a href="Register">Register</a></li>
            <li role="presentation"><a href="Login">Login</a></li>
            <li role="presentation"><a href="Reservations">Reservations</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionUser }">
            <li role="presentation" class="active"><a href="Home">Home</a></li>
            <li role="presentation"><a href="Reservations">Reservations</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionAdmin }">
            <li role="presentation" class="active"><a href="Home">Home</a></li>
            <li role="presentation"><a href="Reservations">Reservations</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionCashier }">
            <li role="presentation" class="active"><a href="Home">Home</a></li>
            <li role="presentation"><a href="Reservations">Reservations</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
    </c:choose>


</ul>

AddMove
<form method="post" action="AddMove">
    <div style="width: 40%;">
        <input type="text" class="form-control" id="name" name="name" placeholder="Title"/>
        <input type="text" class="form-control" id="date" name="date" placeholder="2016-01-01 "/>
        <input type="text" class="form-control" id="time" name="time" placeholder="13:00:00"/>

        <button type="submit" class="btn btn-default">Submit</button>
    </div>
</form>
</body>
</html>
