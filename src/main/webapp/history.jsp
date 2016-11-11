<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="${contextPath}/header.jsp" />
<head>
    <title>Investor History</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
    <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <script type="application/javascript">
        $(document).ready(function() {
            $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
            $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');
                $('#products .item').addClass('grid-group-item');});
        });
    </script>
</head>
<body>
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
                                <a href="#myPopup" data-rel="popup" class="ui-btn ui-btn-inline ui-corner-all">View Idea</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <div data-role="popup" id="myPopup" class="ui-content">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
            <p>I have a close button at the top right corner.</p>
            <p><b>Tip:</b> You can also click outside to close me.</p>
            <p>I have a close button at the top right corner.</p>
            <p><b>Tip:</b> You can also click outside to close me.</p>
            <p>I have a close button at the top right corner.</p>
            <p><b>Tip:</b> You can also click outside to close me.</p>
            <p>I have a close button at the top right corner.</p>
            <p><b>Tip:</b> You can also click outside to close me.</p>
            <p>I have a close button at the top right corner.</p>
            <p><b>Tip:</b> You can also click outside to close me.</p>
            <p>I have a close button at the top right corner.</p>
            <p><b>Tip:</b> You can also click outside to close me.</p>
            <p>I have a close button at the top right corner.</p>
            <p><b>Tip:</b> You can also click outside to close me.</p>
            <p>I have a close button at the top right corner.</p>
            <p><b>Tip:</b> You can also click outside to close me.</p>
        </div>
    </div>
    </div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/vendor/js/bootstrap.min.js"></script>
<link href="${contextPath}/resources/vendor/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link href="${contextPath}/resources/css/product.display.css" rel="stylesheet">
</html>
