<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Investor History</title>
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
            <div class="item  col-xs-4 col-lg-4">
                <div class="thumbnail">
                    <img class="group list-group-image" src="http://placehold.it/400x250/000/fff" alt="" />
                    <div class="caption">
                        <h4 class="group inner list-group-item-heading">
                            ${transaction.value.name}
                        </h4>
                        <h6 class="group inner list-group-item-heading">
                            Transaction Id: ${transaction.key.id}
                        </h6>
                        <p class="group inner list-group-item-text">
                            ${transaction.value.description}
                        </p>
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                <p class="lead">
                                    $${transaction.key.funded}
                                </p>
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <a href="${contextPath}/Ideas/view/${transaction.value.id}" class="btn btn-primary"
                                role="button">View Idea</a>
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
</body>
<link href="${contextPath}/resources/css/product.display.css" rel="stylesheet">

</html>
