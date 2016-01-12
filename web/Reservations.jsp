<%@ page import="java.util.ArrayList" %>
<%@ page import="singleton.Move" %><%--
  Created by IntelliJ IDEA.
  singleton.User: Michał
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
    <li role="presentation" ><a href="Home">Home</a></li>
    <li role="presentation" ><a href="Register">Register</a></li>
    <li role="presentation" ><a href="Login">Login</a></li>
    <li role="presentation" class="active"><a href="Reservations">Reservations</a></li>


</ul>
    Reservations
<form method="get" action="/Book">

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
                    <a href=Book?ID=<c:out value="${element.getId()}"/>>Book</a>
                </td>

            </tr>
        </c:forEach>

        </tbody>

    </table>
<form>

</body>
</html>
