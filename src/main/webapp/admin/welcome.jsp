<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Welcome to infiniteideas!</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resources/images/favicon.ico" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/css/homepage.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <div class="row horizontal-strip">
        <div class="heading">
            OUR CUSTOMERS
        </div>
        <jsp:include page="${contextPath}/templates/map.jsp"></jsp:include>
        <div id="map_div"></div>
    </div>






    <h2>view <a href="${contextPath}/Ideas/list">ideas</a></h2>

    <h2>view <a href="${contextPath}/Ideas/header">header</a></h2>

    <h2>view <a href="${contextPath}/cart/checkout">Checkout</a></h2>

    <h2>view <a href="${contextPath}/admin/history">Transaction History</a></h2>

</div>

<div class="footer">
    <jsp:include page="../templates/footer.jsp"></jsp:include>
</div>

</body>
</html>
