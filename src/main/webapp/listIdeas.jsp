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

        //alert("hi")
        createGallery();


    $(".add-to-cartP").click(function() {

        alert("inside add to cartP")

        event.preventDefault(); //prevent default action

        var funds = globalQty;
        if(funds == 0 || globalQty == '')
        {
            alert("please add a quantity before adding to cart")
            return;
        }


        console.log('${pageContext.request.userPrincipal.name}')

        //idea_name = $(this).attr("data-name");
        idea_id  =  $(this).attr("data-id");
        idea_name = $(this).attr("data-name")

        addItemTocart(idea_id,idea_name,funds);  //adding to cart

        var modal = document.getElementById('myModal');
        modal.style.display = "block";

        var span = document.getElementsByClassName("close")[0];
        span.onclick = function() {
            modal.style.display = "none";
        }
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }


    });

});

// ----------------global variables------------


var globalQty = ''
cart = {}


var Item = function(id, name, funds) {
    this.id = id;
    this.name = name;
    this.funds = funds;

};


//==============================================




//-------------------- Cart Functions-----------



    function addItemTocart(ideaId,ideaName,funds) {
        //alert("product: " + product)
        //alert("cart: " + cart)
      /* for ( var i in cart) {
            //alert(cart[i].product.catalogDswStyle)

            if(cart.length > 0)
            {
                console.log(cart[i]);
                console.log(product)

                if (cart[i].ideaID == product.catalogDswStyle.styleId) {
                    cart[i].count += parseInt(count);
                    cart[i].product.totalCost = cart[i].count * Math.round(cart[i].product.catalogDSWOrder.estimatedCost * 100)/100;
                    saveCart();
                    return;
                }
            }
        }*/
        var item = new Item(ideaId,ideaName,funds);
        itemId = 'ideaId' + ideaId
        cart[itemId] = item
        saveCart();
    }


    $(document).on('change', '.Quantity', function () {
        event.preventDefault();
        globalQty = $(this).val();

        if((!$.isNumeric(globalQty) || globalQty < 0 ) &&  globalQty!='')
        {
            alert("Please enter positive numbers only")
            $(this).val('')
            globalQty = 0
        }

        globalQtyID =  $(this).attr("id");
        //console.log("Quantity--- " + globalQty)

    });

    function clearCart() {
        cart = {};
        saveCart();
    }


    function saveCart() {
        localStorage.setItem("shoppingCart", JSON.stringify(cart));
    }
    function loadCart() {
        if(JSON.parse ( localStorage.getItem("shoppingCart") ) != null  )
            cart = JSON.parse ( localStorage.getItem("shoppingCart") );
        else
            cart = {}

    }



//==============================================

function createGallery() {
    var output = ""


    allItems = {}

    <c:forEach items="${ideas}" var="idea" varStatus="itr">
    item ={}
    item['name'] = '${idea.name}'
    allItems[${idea.id}] = item
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
            + "<div style='float:left;padding-bottom:30px;'><button class = 'add-to-cartP btn-success btn'  data-toggle='modal' data-id ="+ ${idea.id} +" data-target='#basicModal' data-name="+  '${idea.name}' + ">Add to Cart</button></div>"
            + "</div></div></div>"



    </c:forEach>

    output += "<div class='clearfix'></div>"

    localStorage.setItem("AllItems" , JSON.stringify(allItems));


    $("#products-gallery").html(output);
}
</script>

<body>


<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">Ã</span>
            <h2></h2>
        </div>
        <div class="modal-body">
            <p>
                <strong>Item added to cart</strong>
            </p>
            <br>
            <p>Checkout to place order or Continue to browse the products</p>
        </div>
        <div class="modal-footer">
            <h3></h3>
        </div>
    </div>
</div>

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
