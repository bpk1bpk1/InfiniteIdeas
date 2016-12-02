<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Checkout</title>
    <link rel="icon" type="image/x-icon" href="${contextPath}/resources/images/favicon.ico">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <script type="application/javascript">
        function fund() {

            console.log(JSON.parse(localStorage.getItem("shoppingCart")));

            $.ajax({
                type: "POST",
                url: "/cart/fund",
                data: localStorage.getItem("shoppingCart"),
                contentType: 'application/json',
                success: function(data) {
                    if(data.status == 'OK') {
                        location.replace("${contextPath}/welcome")
                    }
                    else alert('Failed adding Idea: ' + data.status + ', ' + data.errorMessage);
                }
            });
            clearCart();
        }

    </script>
</head>
<body>

<jsp:include page="${contextPath}/${role}/header.jsp" />
<script>
    //-----------Global Variables------
    var globalQty = '';
    var globalQtyID = '';
    var cart ={};
    var Item = function(ideadId, userId, funds) {
        this.ideaID = ideadId;
        this.userId = userId;
        this.funds = funds;
    };
    //---------------------------------
    $(document).ready(function(){
        loadCart();
        //var cart = JSON.parse(localStorage.getItem("shoppingCart"));
        //showProds();
        showCartItems();

        //$('#products .item').addClass('list-group-item')

        $("#logoutButton").click(function(event) {
            clearCart();
        });
    });
    //--------------Cart Functions-----------

    function showCartItems()
    {
        var allItems = JSON.parse(localStorage.getItem("AllItems"));
        var gallery ="";
        console.log(allItems);

        console.log(cart);

        jQuery.each( cart, function( index, value ) {


            var iid = "ideaId" +  value['id']

            gallery += "<div class='thumbnail item list-group-item  '" +
                       " style='width:600px;height: 450px; padding-top:0px ;  padding-bottom:10px '>" +

                    " <div class = 'item list-group-item thumbnail'>"  +

                    " <img style='width:344px;height: 258px' class='group list-group-image' " +
                    "src='" + allItems[value['id']]['image'] + "' alt='' />" +

                    " <div class='caption' style=' padding-left:80px'>" +
                    " <h5 class='group inner list-group-item-heading'>"
                    + allItems[value['id']]['name'] + "</h5>" +


                    " <h5 class='group inner list-group-item-text'> " +
                    "Target Funds $ <strong> "+ allItems[value['id']]['funds']  +"</strong></h5>" +

                    " <h5 class='group inner list-group-item-text'> " +
                    "Collected Funds $ <strong> "+ allItems[value['id']]['collectedFunds']  +"</strong></h5>" +

                    " <h5 class='group inner list-group-item-text'>"+
                    "<p> Investment <Strong> $ </Strong>" +
                    "<input " + "id="+ value['id'] + " " + " value = "+ value['funds'] + "  class='Quantity' style='width:90px;height:25px; font-weight:bold;border-style: solid; border-radius: 8px;padding-left:3px;border-color:#828689;'>  </input> </p></h5>" +

                    " <h5 class='group inner list-group-item-text'>"+
                    "<button  iid = "+ iid    + " " + "type='button' class='btn-success btn removeCartItem' >Remove From Cart</button></h5>" +


                    " </div></div></div>";

                    // value['funds']
                    //console.log(gallery)
        });
        gallery += "<div class='clearfix'></div>";


        $("#products").html(gallery)

    }

    function showProds(){
        cart = JSON.parse(localStorage.getItem("shoppingCart"));
        var allItems = JSON.parse(localStorage.getItem("AllItems"));
        var output = "";
        var id = "";
        var j = 0;
        jQuery.each(cart, function(i, val) {
            console.log(val);
            id = "checkOutClose" + j;
            qid = val['id'];
            output  += "<ul class='cart-header'>"
                    +  "<div "+ " qid = " + qid +" id=" + id + " " + "class='close1' ></div>"
                    +  "<li class='ring-in'>"
                    +  "<a href='singleProduct.htm'>"
                    +  "<img src='${contextPath}/resources/images/logo.png' "+ "' class='img-responsive' alt='' style='width:150px;height:120px;float:left;'>"
                    +  "</a></li>"
                    +  "<li><span class='name'>"  + " " + qid+ " </span></li>"
                    +  "<li><span class='name'>"  + " " + allItems[qid]['name']+ " </span></li>"
                    +  "<li><span class='cost'>" + " " + '1' + "</span></li>"
                    +  "<li><span> <input class='Quantity' qid = " + qid +" value = "+ val['funds'] + " style='width:90px;height:25px; text-align:center ; font-weight:bold;border-style: solid; border-radius: 8px;padding-left:3px;border-color:#828689;'></input> </span> </li>"
                    +  "<div class='clearfix'> </div> </ul>";
            j++;
        });
        output += "<div class='clearfix'></div>";
        $("#show-products").html(output);
    }


    $(document).on('change', '.Quantity', function () {
        event.preventDefault();
        globalQty = $(this).val();


        //console.log(globalQty)

        if((!$.isNumeric(globalQty) || globalQty < 0 ) &&  globalQty!='') {
            alert("Please enter positive numbers only");
            $(this).val('');
            globalQty = 0
        }
        globalQtyID =  $(this).attr("id");

        //console.log(globalQtyID)

        var iid = "ideaId" + globalQtyID;

        cart[iid]["funds"] = globalQty;

        saveCart()


        //console.log("Quantity--- " + globalQty)
    });


    //Remove from cart function
    $(document).on('click', '.removeCartItem', function () {
        console.log( $(this).attr('iid'));

        delete cart[$(this).attr('iid')]

        saveCart()

        var modal = document.getElementById('myModal1');
        modal.style.display = "block";
        var span = document.getElementsByClassName("close")[0];
        span.onclick = function() {
            modal.style.display = "none";
        };


        showCartItems()

    });

    function clearCart() {
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


<div id="myModal1" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">X</span>
            <h2></h2>
        </div>
        <div class="modal-body">
            <p>
                <strong>Item is removed from cart</strong>
            </p>
            <br>
            <p>Checkout to place order or Continue to browse the products</p>
        </div>
        <div class="modal-footer">
            <h3></h3>
        </div>
    </div>
</div>




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




<div class="container" style="padding-left: 200px">
    <div style="padding-top: 30px; opacity: 0 "  ></div>
    <div style="width:600px;height: 40px ; " class="well well-sm">
       <div style="text-align: center;"> <strong>Checkout Summary</strong> </div>

    </div>
    <div id="products" class="list-group">


    </div>
</div>
    <%--<input type="submit" id="button" onclick="fund()">--%>

<div style = "float:right ; padding-right:300px; padding-bottom:150px;">
    <button  id = "place-order" type="button" class="btn-success btn" onclick="fund()">Make Investments</button>
</div>

</body>
</html>
