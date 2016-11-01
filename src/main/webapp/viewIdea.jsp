<%--
  Created by IntelliJ IDEA.
  User: Srikanth
  Date: 11/1/2016
  Time: 4:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form>
    <input type="hidden" name="id" value="${Idea.id}">
    <table class="table table-bordered">
        <tbody>
        <tr><th>Idea Name</th><td><input type="text" name="name" required="required" value="${Idea.name}"></td></tr>
        <tr><th>Idea Description</th><td><input type="text" name="description" value="${Idea.description}"></td></tr>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </tbody>
    </table>
    <a href="${contextPath}/Ideas/list" class="btn btn-success">Back</a>

</form>



</body>


</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</html>

</html>
