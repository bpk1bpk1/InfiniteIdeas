<%--
  Created by IntelliJ IDEA.
  User: Srikanth
  Date: 11/1/2016
  Time: 3:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>Create new Idea</h2>
<form action="${contextPath}/Ideas/save" method="post">
    <table class="table table-bordered">
        <tbody>
        <tr><th>Name</th><td><input type="text" name="name" required="required"></td></tr>
        <tr><td colspan="2"><input type="submit" value="Add Idea" class="btn btn-success"></tr>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </tbody>
    </table>
</form>
<a href="/person/index" class="btn btn-success">Back</a>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</html>
