<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/login.css" rel="stylesheet">
</head>

<body>
    <jsp:include page="${contextPath}/header.jsp" />

    <div class="container">

    <div class="row">
        <div class="col-md-4 col-md-offset-7">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Login</div>
                <div class="panel-body">
                    <form method="POST" action="${contextPath}/login" class="form-horizontal" role="form">
                        <div class="form-group ${error != null ? 'has-error' : ''}">
                            <label for="username" class="col-sm-3 control-label">
                                Username</label>
                            <div class="col-sm-9">
                                <input name="username" type="text" class="form-control" id="username" placeholder="Email" required>
                            </div>

                            <label for="inputPassword3" class="col-sm-3 control-label">
                                Password</label>
                            <div class="col-sm-9">
                                <input name="password" type="password" class="form-control" id="inputPassword3" placeholder="Password" required>
                                <span>${error}</span>
                            </div>
                            <span>${message}</span>

                            <div class="col-sm-offset-3 col-sm-9">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"/>
                                        Remember me
                                    </label>
                                </div>
                            </div>

                            <div class="col-sm-offset-3 col-sm-9 last">
                                <button type="submit" class="btn btn-success btn-sm">
                                    Sign in</button>
                                <button type="reset" class="btn btn-default btn-sm">
                                    Reset</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer">
                    Not Registred? <a href="${contextPath}/registration">Register here</a></div>
            </div>
        </div>
    </div>
</div>
<!-- /container -->
</body>
</html>
