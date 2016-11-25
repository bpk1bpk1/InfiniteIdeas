<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Sorry!!</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/access_denied.css">
</head>
<body>
<jsp:include page="${contextPath}/${role}/header"></jsp:include>
<div class="container">
    <div class="row">
        <div class="span12">
            <div class="hero-unit center">
                <h1>Page Not Found <small><span style="font-family: Tahoma,serif; color: red; ">Error 404</span></small></h1>
                <br />
                <p>The page you requested could not be found, either contact your webmaster or try again. Use your browsers <b>Back</b> button to navigate to the page you have prevously come from</p>
                <p><b>Or you could just press this neat little button:</b></p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-large btn-info"><i class="icon-home icon-white"></i> Take Me Home</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
