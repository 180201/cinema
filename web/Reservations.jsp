<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.Move" %><%--
  Created by IntelliJ IDEA.
  DAO.User: Michał
  Date: 2015-12-24
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <li role="presentation" ><a href="Home">Home</a></li>
            <li role="presentation" ><a href="Register">Register</a></li>
            <li role="presentation" ><a href="Login">Login</a></li>
            <li role="presentation" class="active"><a href="Reservations">Reservations</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionUser }">
            <li role="presentation"><a href="Home">Home</a></li>
            <li role="presentation"  class="active"><a href="Reservations">Reservations</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionAdmin }">
            <li role="presentation"><a href="Home">Home</a></li>
            <li role="presentation"  class="active"><a href="Reservations">Reservations</a></li>
            <li role="presentation"><a href="Managemove">Managemove</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionCashier }">
            <li role="presentation"><a href="Home">Home</a></li>
            <li role="presentation"  class="active"><a href="Reservations">Reservations</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
    </c:choose>


</ul>
<c:if test="${sessionScope.UserSession !=null}">
<h5>You are logged in as: ${sessionScope.UserSession.name}</h5>
</c:if>
<form method="get" action="/Book">
    <c:if test="${sessionScope.UserSession !=null}">
    My reservation
    <table border="1" cellpadding="2">
        <thead>
        <tr>
            <td>Move</td>
            <td>Day</td>
            <td>Hour</td>
            <td>Row</td>
            <td>Place</td>
            <td>Action</td>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${reservations}" var="element">
            <tr>
                <td>${element.getMoveTitle()}</td>
                <td>${element.getMoveDate()}</td>
                <td>${element.getMoveTime()}</td>
                <td>${element.getRow()}</td>
                <td>${element.getPlace()}</td>
                <td>
                    <a href=DeleteReservation?ID=<c:out value="${element.getId()}"/>>Delete</a>
                </td>

            </tr>
        </c:forEach>
        </tbody>

    </table>
        </c:if>
        <br/>
    Repertoire
    <table border="1" cellpadding="2">
        <thead>
        <tr>
            <td>Name</td>
            <td>Day</td>
            <td>Hour</td>
            <td>Acton</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${moves}" var="element">
            <tr>
                <td>${element.getName()}</td>
                <td>${element.getDate()}</td>
                <td>${element.getTime()}</td>
                <td>
                    <c:choose>
                        <c:when test="${sessionScope.UserSession ==null}">
                            <a href="Login"/>Fist log</a>
                        </c:when>
                        <c:when test="${sessionScope.UserSession !=null}">
                            <a href=Book?ID=<c:out value="${element.getId()}"/>>Book</a>
                        </c:when>
                    </c:choose>

                </td>

            </tr>
        </c:forEach>

        </tbody>

    </table>
<form>

</body>
</html>
