<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Welcome to infiniteideas!</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${contextPath}/resources/images/favicon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/homepage.css">
</head>
<body>
<div class="myDiv">
    <div class="bg"></div>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div class="row horizontal-strip">
        <div class="heading">
            INVESTORS NEAR YOU
        </div>
        <jsp:include page="${contextPath}/templates/map.jsp"></jsp:include>
        <div id="map_div"></div>
    </div>
</div>
<div class="footer">
    <jsp:include page="../templates/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>
