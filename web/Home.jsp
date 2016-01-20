<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h2>Witaj ${sessionScope.UserSession.name}!</h2>
<h2>${sessionScope.UserSession.id}</h2>
<h2>Rank z sesji:  ${sessionScope.UserSession.rank}</h2>

<h2>${sessionRank == rankSessionUser }</h2>
<h2>-----</h2>
<h2>${rankSessionUser }</h2>
<h2>-----</h2>
<h2>${sessionRank}</h2>

</body>
</html>
