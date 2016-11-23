<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Enter Details</title>
    <link rel="icon" href="${contextPath}/resources/images/favicon.ico">
    <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Custom Fonts -->
    <link href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }
    </style>
</head>

<body>

<div class="container">

    <form:form method="POST" modelAttribute="details" class="form-signin" action="${contextPath}/userDetails">
        <h2 class="form-signin-heading">Enter Details</h2>
        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="name" class="form-control" placeholder="Full Name"
                            autofocus="true" id="name"></form:input>
                <form:errors path="name"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="street">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="street" class="form-control" placeholder="Street"
                            autofocus="true" id="street"></form:input>
                <form:errors path="street"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="city">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="city" class="form-control" placeholder="City" id="city"></form:input>
                <form:errors path="city"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="state">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="state" class="form-control"
                            placeholder="State" id="state"></form:input>
                <form:errors path="state"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="country">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="country" class="form-control"
                            placeholder="Country" id="country"></form:input>
                <form:errors path="country"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit" id="register">Save Details</button>
    </form:form>

</div>
<jsp:include page="../templates/footer.jsp"></jsp:include>
<!-- /container -->
</body>
</html>
