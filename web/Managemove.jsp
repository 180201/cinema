<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Winiu
  Date: 20-01-2016
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Managemove</title>
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
            <%--<li role="presentation" ><a href="Home">Home</a></li>--%>
            <%--<li role="presentation" ><a href="Register">Register</a></li>--%>
            <%--<li role="presentation"><a href="Login">Login</a></li>--%>
            <%--<li role="presentation"><a href="Reservations">Reservations</a></li>--%>
        </c:when>
        <c:when test="${sessionRank==rankSessionUser }">
            <%--<li role="presentation" class="active"><a href="Home">Home</a></li>--%>
            <%--<li role="presentation"><a href="Reservations">Reservations</a></li>--%>
            <%--<li role="presentation"><a href="Logout">Logout</a></li>--%>
        </c:when>
        <c:when test="${sessionRank==rankSessionAdmin }">
            <li role="presentation"><a href="Home">Home</a></li>
            <li role="presentation"><a href="Reservations">Reservations</a></li>
            <li role="presentation" class="active"><a href="Managemove">Managemove</a></li>
            <li role="presentation"><a href="Logout">Logout</a></li>
        </c:when>
        <c:when test="${sessionRank==rankSessionCashier }">
            <%--<li role="presentation" class="active"><a href="Home">Home</a></li>--%>
            <%--<li role="presentation"><a href="Reservations">Reservations</a></li>--%>
            <%--<li role="presentation"><a href="Logout">Logout</a></li>--%>
        </c:when>
    </c:choose>


</ul>

<ul class="nav nav-pills">
    <li role="presentation" class="active"><a href="Addmove.jsp">AddMove</a></li>
</ul>
<br />
<table border="1" cellpadding="2">
    <thead>
    <tr>
        <td>Name</td>
        <td>Day</td>
        <td>Hour</td>
        <td>Delete</td>
        <td>Edit</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${moves}" var="element">
        <tr>
            <td>${element.getName()}</td>
            <td>${element.getDate()}</td>
            <td>${element.getTime()}</td>
            <td>
                <a href=DeleteMove?ID=<c:out value="${element.getId()}"/>>Delete</a>
            </td>
            <td>
                <a href=EditMove?ID=<c:out value="${element.getId()}"/>>Edit</a>
            </td>

        </tr>
    </c:forEach>

    </tbody>

</table>
</body>
</html>
