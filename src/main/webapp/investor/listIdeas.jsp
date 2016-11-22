<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View all ideas</title>
</head>
<body>
<jsp:include page="${contextPath}/${role}/header.jsp" />
<div class="footer">
    <jsp:include page="${contextPath}/templates/footer.jsp" />
</div>
<script>
    $(document).ready(function() {
        createGallery();
        showFilters();
        $(".add-to-cartP").click(function() {
//            alert("inside add to cartP")
            event.preventDefault(); //prevent default action
            var funds = globalQty;
            if(funds == 0 || globalQty == '') {
                alert("please add a quantity before adding to cart");
                return;
            }
            console.log('${pageContext.request.userPrincipal.name}');
            idea_id  =  $(this).attr("data-id");
            idea_name = $(this).attr("data-name");
            category = "cat"
            subcategory = "subcat"
            addItemTocart(idea_id,idea_name,funds,category,subcategory);  //adding to cart
            var modal = document.getElementById('myModal');
            modal.style.display = "block";
            var span = document.getElementsByClassName("close")[0];
            span.onclick = function() {
                modal.style.display = "none";
            };
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        });
    });
    // ----------------global variables------------
    var globalQty = '';
    cart = {};
    var Item = function(id, name, funds,category,subcategory) {
        this.id = id;
        this.name = name;
        this.funds = funds;
        this.category = category;
        this.subcategory = subcategory;
    };
    //-------------------- Cart Functions-----------
    function addItemTocart(ideaId,ideaName,funds,category,subcategory) {
        var item = new Item(ideaId,ideaName,funds,category,subcategory);
        itemId = 'ideaId' + ideaId;
        cart[itemId] = item;
        saveCart();
    }
    $(document).on('change', '.Quantity', function () {
        event.preventDefault();
        globalQty = $(this).val();
        if((!$.isNumeric(globalQty) || globalQty < 0 ) &&  globalQty!='') {
            alert("Please enter positive numbers only");
            $(this).val('');
            globalQty = 0
        }
        globalQtyID =  $(this).attr("id");
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

    var category = ""


    function showFilters()
    {
        <c:forEach items="${categories}" var="category" >
            console.log("${category}")
            category += "<div class='checkbox'> <input data-parent='color' class='checkboxFilter' type='checkbox' value="+ "${category}"+">"+ "${category}" +"</div>"
        </c:forEach>

        $("#categoryFilter").html(category);


        <c:forEach items="${subcategories}" var="subcategory" >

        console.log("${subcategory}")

        </c:forEach>

        <c:forEach items="${funds}" var="fund" >

        console.log("${fund}")

        </c:forEach>
    }


    function createGallery() {
        var output = "";
        allItems = {};
        <c:forEach items="${ideas}" var="idea" varStatus="itr">
        item ={};
        item['name'] = '${idea.name}';


        allItems[${idea.id}] = item;
        output += "<div>"
                + "<div " + "class='gallery-left gallery-Item col-md-3 grid-stn simpleCart_shelfItem' style='margin:0 0px 10px ;border:1px solid #F7F2F2 ;padding-bottom:3px;' >"
                + "<div  class='ih-item square effect3 bottom_to_top'  >"
                + "<div  class='bottom-2-top'>"
                + "<div  class='img'><img style = 'width:120px;height:90px;' src='${contextPath}/resources/images/logo.png' alt='/' class='img-responsive gri-wid'/></div>"
                + "<div> <span><strong>Idea: <span style='color:#A5040E ;'>" + '${idea.name}' + "</span></strong></span><br>"
                + "<span> <strong>Funds Required: $<span style='color:#A5040E; font-style:bold;'>"+ '100' +"</span></strong></span><br> </div>"
                + "</div> </div>"
                + "<div style='padding-bottom:10px;'><span><strong>Quantity: </strong></span>"
                + "<input " + "id="+ ${idea.id} + " " + " value = '' "  +" class='Quantity' style='width:90px;height:25px; font-weight:bold;border-style: solid; border-radius: 8px;padding-left:3px;border-color:#828689;'> </input> </div>"
                + "<div class='quick-view' data-name="+  '${idea.name}' +" data-price="+ '100'  +"> "
                + "<div style='padding-right:5px;float:left;padding-bottom:30px;'><button class = 'quick-view-btn btn btn-info' data-sku="+ " action='#' >Quick view</button></div>"
                + "<div style='float:left;padding-bottom:30px;'><button class = 'add-to-cartP btn-success btn'  data-toggle='modal' data-id ="+ ${idea.id} +" data-target='#basicModal' data-name="+  '${idea.name}' + ">Add to Cart</button></div>"
                + "</div></div></div>";
        </c:forEach>
        output += "<div class='clearfix'></div>";
        localStorage.setItem("AllItems" , JSON.stringify(allItems));
        $("#products-gallery").html(output);
    }
</script>
<div class="container">
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">X</span>
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





    <div class="col-md-12 products-gallery" style="padding-top: 40px">


       <div style="padding-left: 0px; float: left; padding-top: 50px;" >



        <div style="float: left; padding-right: 60px;">




            <div class="panel-group driving-license-settings" id="accordion"
                 style="width: 150%; padding-top: 0px; padding-left: 0px;">



                <div class="panel panel-default">

                    <div style="background-color: #5e5e5e" class="panel-heading">
                        <h4 class="panel-title">
                            <span style="color: Black; "><b>Filters</b></span>
                        </h4>
                    </div>

                    <div style=" background-color: transparent; padding-bottom: 5px "> </div>

                    <div style="background-color: #D0D5D6;" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion1"
                               href="#collapseOne"> <span style="color: Black; "><b>Category</b></span>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div style="text-align: left; padding-left: 20px">
                            <div id ="categoryFilter" class="driving-license-kind">

                            </div></div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div style="background-color: #D0D5D6;" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion1"
                               href="#collapseTwo"> <span style="color: Black; "><b>Material</b></span>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div id = "materialFilter" class="driving-license-kind">

                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div style="background-color: #D0D5D6;" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion2"
                               href="#collapseThree"> <span style="color: Black; "><b>Style</b></span>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div id = "styleFilter" class="driving-license-kind">

                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div style="background-color: #D0D5D6;" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion3"
                               href="#collapseFour"> <span style="color: Black; "><b>Brands</b></span>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div id="brandFilter" class="driving-license-kind">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="float:right;padding:10px;">
                <button id="filterBtn" class = "ApplyFilter btn-success btn" >Apply Filter</button>
            </div>
        </div>
        </div>
        <!-- Filter Portal Ends Here -->
        <!-- Start of Product Page -->

        <div style="float: left">
            <div class="col-md-12 products-gallery">
                <div style="width: auto; padding-left: 60px;">
                    <div id="products-gallery" class="col-md-12 grid-gallery"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>

    <div>
        <a href="${contextPath}/Ideas/create" class="btn btn-success">Add Idea</a>
    </div>

</div>

</body>
</html>
