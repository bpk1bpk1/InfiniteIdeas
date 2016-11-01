<%--
  Created by IntelliJ IDEA.
  User: Srikanth
  Date: 11/1/2016
  Time: 2:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editing the ideas</title>
    <link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
</head>
<body>

<form action="${contextPath}/Ideas/update" method="post">
    <input type="hidden" name="id" value="${Idea.id}">
    <table class="table table-bordered">
        <tbody>
        <tr><th>Idea Name</th><td><input type="text" name="name" required="required" value="${Idea.name}"></td></tr>
        <tr><th>Idea Description</th><td><input type="text" name="desc" value="${Idea.description}"></td></tr>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <tr><td colspan="2"><input type="submit" value="Edit Person" class="btn btn-success"></tr>
        </tbody>
    </table>
</form>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<link type="text/css" href="/resources/css/bootstrap.css" rel="stylesheet" />
</html>
