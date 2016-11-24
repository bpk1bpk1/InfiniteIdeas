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

    var allItems = {}
    var itemsID = {}

    $(document).ready(function() {

        preReq();
        loadCart();
        showFilters();
        createGallery(itemsID);

        $( "#searchText" ).autocomplete({
            source: searchSpace
        });


        $('#products .item').addClass('list-group-item')

    });




    //----------Important Page funtions dont touch--------------

    var category = ""
    var subcategory = ""
    var funds = ""

        $(document).on('change', '.checkboxFilter', function () {

            event.preventDefault(); //prevent default action

            var filterSelected = $(this).attr("data-parent");

            //console.log(filterSelected)
            // console.log($(this).attr

            //updateGalleryWithFilters(filterSelected)

            if(filterSelected == "category")
            {
                if($(this).is(':checked'))
                    categoryFilterList[$(this).attr("value")] = true;
                else
                    delete categoryFilterList[$(this).attr("value")]
            }
            else if(filterSelected == "subcategory")
            {
                if($(this).is(':checked'))
                    subcategoryFilterList[$(this).attr("value")] = true;
                else
                    delete subcategoryFilterList[$(this).attr("value")]
            }
            else if(filterSelected == "funds")
            {
                if($(this).is(':checked'))
                    fundsFilterList[$(this).attr("value")] = true;
                else
                    delete fundsFilterList[$(this).attr("value")]
            }

            filterItems();


        });


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


        $(document).on('click', '.add-to-cartP', function ()
        {
            event.preventDefault(); //prevent default action
            var funds = globalQty;
            if(funds == 0 || globalQty == '') {
                alert("please add a quantity before adding to cart");
                return;
            }
            console.log('${pageContext.request.userPrincipal.name}');
            var idea_id  =  $(this).attr("data-id");
            var idea_name = $(this).attr("data-name");
            category = allItems[idea_id]['category']
            subcategory = allItems[idea_id]['subcategory']


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

        $(document).on('click', '#searchBtn', function ()
        {

            var finalFilteredItems = searchItems()

            createGallery(finalFilteredItems)

        });

    //------------------------------------------------------------

    // ----------------global variables------------

    var categoryFilterList ={};
    var subcategoryFilterList = {};
    var fundsFilterList = {};
    var brandFilterList = [];

    var searchSpace = []


    var globalQty = '';
    var cart = {};
    var Item = function(id, name, funds,category,subcategory) {
        this.id = id;
        this.name = name;
        this.funds = parseInt(funds);
        this.category = category;
        this.subcategory = subcategory;
    };


    //-------------------- Cart Functions-----------
    function addItemTocart(ideaId,ideaName,funds,category,subcategory) {
        var item = new Item(ideaId,ideaName,funds,category,subcategory);
        var itemId = 'ideaId' + ideaId;



        if(cart[itemId] == null)
            cart[itemId] = item;
        else {

            var fund = parseInt(funds)

           cart[itemId]['funds']  += fund
        }
        saveCart();
    }

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



    //=============================================================


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
                               href="#collapseTwo"> <span style="color: Black; "><b>Sub Category</b></span>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body" >
                            <div style="text-align: left; padding-left: 20px">
                            <div id = "subCategoryFilter" class="driving-license-kind">

                            </div></div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div style="background-color: #D0D5D6;" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion2"
                               href="#collapseThree"> <span style="color: Black; "><b>Funds Required</b></span>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse in">
                        <div class="panel-body" >
                            <div style="text-align: left; padding-left: 20px">
                            <div id = "fundsFilter" class="driving-license-kind">

                            </div></div>
                        </div>
                    </div>
                </div>

               <!-- <div class="panel panel-default">
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
                </div>-->
            </div>
            <%--<div style="float:right;padding:10px;">--%>
                <%--<button id="filterBtn" class = "ApplyFilter btn-success btn" >Apply Filter</button>--%>
            <%--</div>--%>
        </div>
        </div>
        <!-- Filter Portal Ends Here -->
        <!-- Start of Product Page -->





        <div style="float: left ; padding-top: 40px" >
            <div class="row group inner item  col-xs-4 col-lg-4 ">
                <div style="width: 850px; padding-left: 30px;">
                    <div id="products-gallery2" class="group inner list-group-item "></div>
                </div>
            </div>
        </div>


        <%--<div style="float: left ; padding-top: 40px" >--%>
            <%--<div class="row group inner item  col-md-4 ">--%>
                <%--<div style="width: 0px; padding-left: 10px;">--%>
                    <%--<div id="products-gallery" class="group inner list-group-item"> </div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

    </div>


    <div class="clearfix"></div>

    <div>
        <a href="${contextPath}/Ideas/create" class="btn btn-success">Add Idea</a>
    </div>

</div>

</body>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</html>
