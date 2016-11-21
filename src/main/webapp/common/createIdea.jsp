<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Create an Idea</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${contextPath}/resources/images/favicon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
</head>
<script type="application/javascript">
    console.log("In side this page");
</script>
<body>
<jsp:include page="${contextPath}/${role}/header.jsp"></jsp:include>
<div class="container">

    <form:form method="POST" modelAttribute="ideaForm" class="form-signin" action="${contextPath}/Ideas/create">
        <h2 class="form-signin-heading">Create an idea!</h2>
        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="name" class="form-control" placeholder="name"
                            autofocus="true" id="name"></form:input>
                <form:errors path="name"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="description">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="description" class="form-control" placeholder="Description"
                            autofocus="true" id="description"></form:input>
                <form:errors path="description"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="fundsRequired">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="number" path="fundsRequired" class="form-control" placeholder="500"
                            id="fundsRequired"></form:input>
                <form:errors path="fundsRequired"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="image">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="image" class="form-control"
                            placeholder="Image url" id="image"></form:input>
                <form:errors path="image"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="category">
            <div class="dropdown form-group ${status.error ? 'has-error' : ''}">
                Select Category:
                <form:select path="category">
                    <form:option value="">-Select Option-</form:option>
                    <form:option value="Food">Food</form:option>
                    <form:option value="Technology">Technology</form:option>
                    <form:option value="Art">Art</form:option>
                    <form:option value="Design">Design</form:option>
                    <form:option value="Games">Games</form:option>
                </form:select>
                <form:errors path="category"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="subCategory">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="subCategory" class="form-control"
                            placeholder="Sub-category" id="subCategory"></form:input>
                <form:errors path="subCategory"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit" id="register">Submit</button>
    </form:form>

</div>
<div class="footer">
    <jsp:include page="${contextPath}/templates/footer.jsp"></jsp:include>
</div>

</body>
</html>









<%--<form action="${contextPath}/Ideas/save" method="post">--%>
<%--<table class="table table-bordered">--%>
<%--<tbody>--%>
<%--<tr><th>Name</th><td><input type="text" name="name" required="required"></td></tr>--%>
<%--<tr><td colspan="2"><input type="submit" value="Add Idea" class="btn btn-success"></tr>--%>

<%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>

<%--</tbody>--%>
<%--</table>--%>
<%--</form>--%>
