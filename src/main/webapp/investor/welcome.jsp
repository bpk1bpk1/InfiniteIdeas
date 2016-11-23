<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${contextPath}/resources/css/carousel.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<script type="application/javascript" src="${contextPath}/resources/js/carousel.js"></script>
<div class="container">
    <div class="row horizontal-strip recommendation">
        <div class="heading">Recommendations</div>
        <div class="col-md-12">
            <div id="Carousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#Carousel" data-slide-to="1"></li>
                    <li data-target="#Carousel" data-slide-to="2"></li>
                </ol>

                <!-- Carousel items -->
                <div class="carousel-inner">

                    <div class="item active">
                        <div class="row">
                            <c:forEach items="${recommendation1}" var="reco1" varStatus="itr">
                                <div class="col-md-3">
                                    <a href="${contextPath}/Ideas/view/${reco1.id}" class="thumbnail">
                                        <img src="${reco1.image}" alt="Image" style="width: 250px;height: 250px;">
                                        <span class="name">${reco1.name}</span>
                                    </a>
                                </div>
                            </c:forEach>
                        </div><!--.row-->
                    </div><!--.item-->

                    <div class="item">
                        <div class="row">
                            <c:forEach items="${recommendation2}" var="reco2" varStatus="itr">
                                <div class="col-md-3">
                                    <a href="${contextPath}/Ideas/view/${reco2.id}" class="thumbnail">
                                        <img src="${reco2.image}" alt="Image" style="width: 250px;height: 250px;">
                                        <span class="name">${reco2.name}</span>
                                    </a>
                                </div>
                            </c:forEach>
                        </div><!--.row-->
                    </div><!--.item-->

                </div><!--.carousel-inner-->
                <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
            </div><!--.Carousel-->

        </div>
    </div>


        <h2>view <a href="${contextPath}/Ideas/filters">filters</a></h2>

        <h2>view <a href="${contextPath}/investor/history">Transaction History</a></h2>

        <h2>view <a href="${contextPath}/Ideas/list">ideas</a></h2>
    <div class="row horizontal-strip">
        <div class="heading">ENTREPRENEURS NEAR YOU</div>
        <jsp:include page="${contextPath}/templates/map.jsp"></jsp:include>
        <div id="map_div"></div>
    </div>



</div>

<div class="footer">
    <jsp:include page="../templates/footer.jsp"></jsp:include>
</div>

</body>
</html>
