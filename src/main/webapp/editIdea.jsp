<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editing the ideas</title>

</head>
<body>

<form action="${contextPath}/Ideas/update" method="post">
    <input type="hidden" name="id" value="${Idea.id}">
    <table class="table table-bordered">
        <tbody>
        <tr><th>Idea Name</th><td><input type="text" name="name" required="required" value="${Idea.name}"></td></tr>
        <tr><th>Idea Description</th><td><input type="text" name="description" value="${Idea.description}"></td></tr>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <tr><td colspan="2"><input type="submit" value="Edit Idea" class="btn btn-success"></tr>
        </tbody>
    </table>


</form>

<a href="${contextPath}/Ideas/list" class="btn btn-success">Back</a>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/vendor/js/bootstrap.min.js"></script>
<link href="${contextPath}/resources/vendor/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</html>
