<%--
  Created by IntelliJ IDEA.
  DAO.User: Michał
  Date: 2015-12-24
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <c:set var="sessionRank" value="${sessionScope.UserSession.rank }"/>
    <c:set var="rankSessionUser" value="${sessionScope.RankSession.userRank }"/>
    <c:set var="rankSessionAdmin" value="${sessionScope.RankSession.adminRank }"/>
    <c:set var="rankSessionCashier" value="${sessionScope.RankSession.cashierRank }"/>


    <c:choose>
        <c:when test="${sessionScope.UserSession ==null}">
            <li role="presentation"><a href="Home">Home</a></li>
            <li role="presentation"  class="active"><a href="Register">Register</a></li>
            <li role="presentation"><a href="Login">Login</a></li>
            <li role="presentation"><a href="Reservations">Reservations</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionUser }">
            <li role="presentation"><a href="Home">Home</a></li>
            <li role="presentation"><a href="Reservations">Reservations</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionAdmin }">
            <li role="presentation"><a href="Home">Home</a></li>
            <li role="presentation"><a href="Reservations">Reservations</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionCashier }">
            <li role="presentation"><a href="Home">Home</a></li>
            <li role="presentation"><a href="Reservations">Reservations</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
    </c:choose>
</ul>
    <h4>Create account</h4>
    <br />
    <form method="post" action="Register">
    <div style="width: 40%;">
        Login: <input type="text" class="form-control" id="name" name="user"/>
        Password: <input type="password" class="form-control" id="pass" name="pass"/>
        <button type="submit" class="btn btn-default">Submit</button>
    </div>
</form>
</body>
</html>
