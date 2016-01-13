<%@ page import="java.util.ArrayList" %>
<%@ page import="singleton.Move" %><%--
  Created by IntelliJ IDEA.
  singleton.User: Michał
  Date: 2015-12-24
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <li role="presentation" ><a href="Login.jsp">Login</a></li>
    <li role="presentation" class="active"><a href="Reservations.jsp">Reservations</a></li>


</ul> <%
    // retrieve your list from the request, with casting
    ArrayList<Move> list = (ArrayList<Move>) request.getAttribute("moves");
// print the information about every category of the list
//        for(Move category : list) {
    out.println(list);
//        }
%>
<%= request.getAttribute("moves") %>
${moves}
Reservations



<c:forEach items="${moves}" var="element" varStatus="info">

   <p>${info.count}</p> <p>${element.Name}</p>
</c:forEach>
<table border="1" cellpadding="2">
    <thead>
    <tr>
        <td>Name</td>
        <%--<td>FULLNAME</td>--%>
        <%--<td>EDYTUJ</td>--%>
        <%--<td>USUŃ</td>--%>
    </tr>
    </thead>

    <c:forEach items="${moves}" var="element" varStatus="info">

            ${element.Name}
                <%--<td>${element.fullname}</td>--%>
                <%--<td>--%>
                <%--<form method="get" action="UpdateServlet">--%>
                <%--<input type="hidden" name="userid" value="${element.userid}" />--%>
                <%--<input type="submit" value="edytuj" />--%>
                <%--</form>--%>
                <%--</td>--%>
                <%--<td>--%>
                <%--<form method="get" action="DeleteServlet">--%>
                <%--<input type="hidden" name="userid" value="${element.userid}" />--%>
                <%--<input type="submit" value="usuń" />--%>
                <%--</form>--%>
                <%--</td>--%>
    </c:forEach>


</table>
</body>
</html>
