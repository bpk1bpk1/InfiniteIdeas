<%--
  Created by IntelliJ IDEA.
  User: Srikanth
  Date: 11/20/2016
  Time: 2:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>Title</title>
</head>
<body>


<sql:setDataSource var="snapshot" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://oldinfiniteideas.c358x9d2lbrf.us-east-2.rds.amazonaws.com/InfiniteIdeas?useSSL=false"
                   user="master"  password="Abcd1234"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from idea;
</sql:query>

<table border="1" width="100%">
    <tr>
        <th>Idea ID</th>
        <th>Idea Name</th>
        <th>Idea Desc</th>

    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.id}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.description}"/></td>

        </tr>
    </c:forEach>
</table>





</body>
</html>
