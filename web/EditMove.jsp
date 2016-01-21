<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Winiu
  Date: 21-01-2016
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EditMove</title>
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
            <%--<li role="presentation" class="active"><a href="Home">Home</a></li>--%>
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
<br/>

Edit Move

<form method="post" action="EditMove?ID=${requestScope.EditMove.id}">
    <div style="width: 40%;">

       IdMove <input type="text" class="form-control" id="idMove" name="idMove"  value="${requestScope.EditMove.id}" disabled/>
        Title <input type="text" class="form-control" id="name" name="name" placeholder="Title" value="${requestScope.EditMove.name}"/>
        Date <input type="text" class="form-control" id="date" name="date" placeholder="2016-01-01" value="${requestScope.EditMove.date}"/>
        Time <input type="text" class="form-control" id="time" name="time" placeholder="13:00:00" value="${requestScope.EditMove.time}"/>


        <button type="submit" class="btn btn-default">Submit</button>
    </div>
</form>
</body>
</html>
