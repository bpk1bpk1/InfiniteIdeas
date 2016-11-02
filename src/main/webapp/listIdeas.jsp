<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<jsp:include page="${contextPath}/header.jsp" />


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

</head>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>


<script>

$(document).ready(function() {

        alert("hi")
        createGallery();

});


function createGallery() {
    var output = ""
    <c:forEach items="${ideas}" var="idea" varStatus="itr">

    output += "<div>"
            + "<div " + "class='gallery-left gallery-Item col-md-3 grid-stn simpleCart_shelfItem' style='margin:0 0px 10px ;border:1px solid #F7F2F2 ;padding-bottom:3px;' >"
            + "<div  class='ih-item square effect3 bottom_to_top'  >"
            + "<div  class='bottom-2-top'>"
            + "<div  class='img'><img style = 'width:120px;height:90px;' src='${contextPath}/resources/images/logo.jpg' alt='/' class='img-responsive gri-wid'/></div>"
            + "<div> <span><strong>Idea: <span style='color:#A5040E ;'>" + '${idea.name}' + "</span></strong></span><br>"
            + "<span> <strong>Funds Required: $<span style='color:#A5040E; font-style:bold;'>"+ '100' +"</span></strong></span><br> </div>"
            + "</div> </div>"
            + "<div style='padding-bottom:10px;'><span><strong>Quantity: </strong></span>"
            + "<input " + "id="+ ${idea.id} + " " + " value = '' "  +" class='Quantity' style='width:90px;height:25px; font-weight:bold;border-style: solid; border-radius: 8px;padding-left:3px;border-color:#828689;'> </input> </div>"
            + "<div class='quick-view' data-name="+  '${idea.name}' +" data-price="+ '100'  +"> "
            + "<div style='padding-right:5px;float:left;padding-bottom:30px;'><button class = 'quick-view-btn btn btn-info' data-sku="+ " action='#' >Quick view</button></div>"
            + "<div style='float:left;padding-bottom:30px;'><button class = 'add-to-cartP btn-success btn'  data-toggle='modal' data-styleid ="+ ${idea.id} +" data-target='#basicModal' data-name="+  '${idea.name}' + ">Add to Cart</button></div>"
            + "</div></div></div>"

    </c:forEach>

    output += "<div class='clearfix'></div>"

    $("#products-gallery").html(output);
}
</script>

<body>

<!--

<h2>List of Persons</h2>
<table class="table table-bordered">
    <tr>
        <th>S.No</th>
        <th>Name</th>

    </tr>
    <tbody>
    <c:forEach items="${ideas}" var="idea" varStatus="itr">
        <tr>
            <td>${idea.name}</td>
            <td><a href="${contextPath}/Ideas/edit/${idea.id}" class="btn btn-warning">Edit</a> </td>
            <td><a href="${contextPath}/Ideas/view/${idea.id}" class="btn btn-warning">View Details</a> </td>
        </tr>
    </c:forEach>
    </tbody>

</table>-->


<div style="float: left">
    <div class="col-md-12 products-gallery">
        <div style="width: 1200px; padding-left: 60px;">
            <div id="products-gallery" class="col-md-12 grid-gallery"></div>
        </div>
    </div>
</div>

<div>
<a href="${contextPath}/Ideas/create" class="btn btn-success">Add Idea</a>
</div>


</body>
</html>
