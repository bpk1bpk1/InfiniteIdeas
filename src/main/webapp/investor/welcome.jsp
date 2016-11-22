<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Welcome to infiniteideas!</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
        <h2>view <a href="${contextPath}/Ideas/list">ideas</a></h2>

        <h2>view <a href="${contextPath}/Ideas/header">header</a></h2>

        <h2>view <a href="${contextPath}/cart/checkout">Checkout</a></h2>

        <h2>view <a href="${contextPath}/Ideas/filters">filters</a></h2>

        <h2>view <a href="${contextPath}/investor/history">Transaction History</a></h2>

        <h2>view <a href="${contextPath}/investor/map">Map</a> of all our users</h2>
</div>

<div class="footer">
    <jsp:include page="../templates/footer.jsp"></jsp:include>
</div>

</body>
</html>
