<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>History</title>
    <link rel="icon" href="${contextPath}/resources/images/favicon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<jsp:include page="${contextPath}/${role}/header.jsp"/>
<script type="application/javascript">
    $(document).ready(function() {
        $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
        $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');
            $('#products .item').addClass('grid-group-item');});
    });
</script>
<div class="myDiv">
    <div class="bg"></div>
        <div class="container">
            <div class="well well-sm">
                <strong>Purchase History</strong>
                <div class="btn-group">
                    <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
                    </span>List</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                        class="glyphicon glyphicon-th"></span>Grid</a>
                </div>
            </div>
            <div id="products" class="row list-group">
                <c:forEach items="${history}" var="transaction" varStatus="itr">
                    <div class="item  col-xs-12 col-lg-4 col-md-6 col-sm-12">
                        <div class="thumbnail">
                            <img class="group list-group-image" src="${transaction.value.image}" alt="" style="width: 400px;height: 250px;"/>
                            <div class="caption">
                                <h4 class="group inner list-group-item-heading">
                                    ${transaction.value.name}
                                </h4>
                                <h6 class="group inner list-group-item-heading">
                                    <c:choose>
                                        <c:when test="${!empty transaction.key.id}">
                                            Transaction Id: ${transaction.key.id}
                                        </c:when>
                                        <c:otherwise>
                                            Idea Id: ${transaction.value.id}
                                        </c:otherwise>
                                    </c:choose>
                                </h6>
                                <p class="group inner list-group-item-text">
                                    ${transaction.value.category}
                                </p>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <p class="lead">
                                            <c:choose>
                                                <c:when test="${!empty transaction.key.funded}">
                                                    $ ${transaction.key.funded}
                                                </c:when>
                                                <c:otherwise>
                                                    $ ${transaction.value.collectedFunds}
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6 buttons">
                                        <a href="${contextPath}/Ideas/view/${transaction.value.id}" class="btn btn-primary"
                                        role="button">View Idea</a>
                                        <c:if test="${role == \"investor\"}">
                                            <a href="${contextPath}/Ideas/return/${transaction.key.id}" class="cancel-fund"
                                               role="button">Cancel Fund</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    <div class="footer">
        <jsp:include page="${contextPath}/templates/footer.jsp"></jsp:include>
    </div>
</div>
</body>
<link href="${contextPath}/resources/css/product.display.css" rel="stylesheet">

</html>
