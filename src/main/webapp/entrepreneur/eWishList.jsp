<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Grab the opportunity</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
</head>

<script src="https://code.jquery.com/jquery-1.12.2.min.js"></script>

<body>

<jsp:include page="${contextPath}/${role}/header.jsp"/>
<div class="myDiv">
    <div class="bg">
<script>

var allItems = {};
var itemsID = {};
var searchSpace = []
var cart = {}



$(document).ready(function() {

    console.log('${role}')

    preReq()
    loadCart()
    //showFilters()
    loadWishList(itemsID)

});


function loadWishList(finalFilterItems)
{

    var gallery = ""
    console.log(finalFilterItems)

    jQuery.each( finalFilterItems, function( key, value ) {

    console.log(key)

        var ideaName = allItems[key]['name']
        var image = allItems[key]['image'];

        gallery += "<div class='item thumbnail col-xs-4 col-lg-4'>" +
                "<div class = 'thumbnail'>"  +
                "<img class='group list-group-image' src='"+ image + "' alt='Idea Image' style='width: 400px; height: 250px' />" +
                "<div class='caption'>" +
                "<h4 class='group inner list-group-item-heading'>" +
                ideaName + "</h4>" +
                " <p class='group inner list-group-item-text'> Target Funds:    $ <strong>"     + allItems[key]['funds']  +   "</strong></p>" +
                " <p class='group inner list-group-item-text'> Collected Funds: $ <strong>"  + allItems[key]['collectedFunds']  +   "</strong></p>" +
                //" <div class='row'> "+
                //" </div>" +
                " <div style='float:left;padding-bottom:8px; padding-top:23px '>" +
                "</div>" +   " <div style='float:left;padding-bottom:8px; padding-left:10px; padding-top: 0px '> " +
                " <button  class =' btn btn-info ' onclick=window.location='${contextPath}/Ideas/edit/"+ key  +
                "' > Own It!</button></div>" +
                "</div>       </div>               </div>              </div>"


    });
    gallery += "<div class='clearfix'></div>";
    $("#products-gallery2").html(gallery);


}



function loadCart() {
    if(JSON.parse ( localStorage.getItem("shoppingCart") ) != null  )
        cart = JSON.parse ( localStorage.getItem("shoppingCart") );
    else
        cart = {}
}

</script>
    </div>
</body>

<div class="col-md-12 products-gallery" style="padding-top: 40px">

<div style="float: left ; padding-top: 40px" >
    <div class="row group inner item  col-xs-4 col-lg-4 ">
        <div style="width: 850px; padding-left: 30px;">
            <div id="products-gallery2" class="group inner list-group-item "></div>
        </div>
    </div>
</div>

</div>

<link href="${contextPath}/resources/css/product.display.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</html>
