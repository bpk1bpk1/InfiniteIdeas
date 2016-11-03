<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>


<script>

    //-----------Global Variables------


    var globalQty = ''
    var globalQtyID = ''
    cart = {}


    var Item = function(ideadId, userId, funds) {
        this.ideaID = ideadId;
        this.userId = userId;
        this.funds = funds;

    };

    //---------------------------------

    $(document).ready(function(){


        loadCart();
        showProds();





        $("#logoutButton").click(function(event) {
            clearCart();
        });



    });

    //--------------Cart Functions-----------

    function showProds(){

        cart = JSON.parse(localStorage.getItem("shoppingCart"));
        var allItems = JSON.parse(localStorage.getItem("AllItems"));
        var output = "";
        var id = "";
        var j = 0
        //console.log("------------------------------------")
        //console.log(cartArray)

        jQuery.each(cart, function(i, val) {

            console.log(val)

            id = "checkOutClose" + j;
            qid = val['id']
            output  += "<ul class='cart-header'>"
                    +  "<div "+ " qid = " + qid +" id=" + id + " " + "class='close1' ></div>"
                    +  "<li class='ring-in'>"
                    +  "<a href='singleProduct.htm'>"
                    +  "<img src='${contextPath}/resources/images/logo.jpg' "+ "' class='img-responsive' alt='' style='width:150px;height:120px;float:left;'>"
                    +  "</a></li>"
                    +  "<li><span class='name'>"  + " " + qid+ " </span></li>"
                    +  "<li><span class='name'>"  + " " + allItems[qid]['name']+ " </span></li>"
                    +  "<li><span class='cost'>" + " " + '1' + "</span></li>"
                    +  "<li><span> <input class='Quantity' qid = " + qid +" value = "+ val['funds'] + " style='width:90px;height:25px; text-align:center ; font-weight:bold;border-style: solid; border-radius: 8px;padding-left:3px;border-color:#828689;'></input> </span> </li>"
                    +  "<div class='clearfix'> </div> </ul>"
            j++;

        });

        output += "<div class='clearfix'></div>"
        $("#show-products").html(output);


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

    function clearCart()
    {
        cart = {};
        saveCart();
    }
    function saveCart() {
        localStorage.setItem("shoppingCart" , JSON.stringify(cart));
    }


    function loadCart() {
        if(!jQuery.isEmptyObject(localStorage.getItem("shoppingCart") ) )
        {
            cart = JSON.parse ( localStorage.getItem("shoppingCart") );
            if(cart.length == 0)
                $("#place-order").hide();
        }
        else
        {
            cart = {}
        }
    }


    //---------------------------------------

</script>


<html>
<jsp:include page="${contextPath}/header.jsp" />
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
    <script type="application/javascript">
        function fund() {

            //clearCart()

            console.log(JSON.parse(localStorage.getItem("shoppingCart")))

            $.ajax({
                type: "POST",
                url: "/cart/fund",
                data: localStorage.getItem("shoppingCart"),
                contentType: 'application/json',
                success: function(data) {
                    if(data.status == 'OK') {
                        location.replace("${contextPath}/welcome")
                    }

                    else alert('Failed adding person: ' + data.status + ', ' + data.errorMessage);
                }
            });
        }

    </script>
</head>
<body>
<h2>List of Ideas</h2>


<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">×</span>
            <h2></h2>
        </div>
        <div class="modal-body">
            <p><font size="6"><strong>Order has been Placed</strong></font></p><br>
            <p>checkout our other products too</p>
        </div>
        <div class="modal-footer">
            <h3></h3>
        </div>
    </div>
</div>



<div class="in-check" >
    <ul class="unit">
        <li><span>Idea </span></li>
        <li><span>Idea Id</span></li>
        <li><span>Idea Name</span></li>
        <li><span>User Id</span></li>
        <li><span>Funds ($)</span></li>

        <li> </li>
        <div class="clearfix"> </div>
    </ul>
    <div id = "show-products">

    </div>
</div>

    <input type="submit" id="button" onclick="fund()">



<div style = "float:right ; padding-right:300px; padding-bottom:150px;">
    <button  id = "place-order" type="button" class="btn-success btn" onclick="fund()">Purchase Order</button>
</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</html>
