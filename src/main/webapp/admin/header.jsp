<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${contextPath}/resources/css/header.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Custom Fonts -->
<link href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<!-- NProgress -->
<link href="${contextPath}/resources/vendor/bootstrap/css/nprogress.css" rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link href="${contextPath}/resources/vendor/bootstrap/css/daterangepicker.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${contextPath}/resources/vendor/bootstrap/css/custom.css" rel="stylesheet">
<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<!-- FastClick -->
<script src="${contextPath}/resources/js/fastclick.js"></script>
<!-- NProgress -->
<script src="${contextPath}/resources/js/nprogress.js"></script>
<!-- Chart.js -->
<script src="${contextPath}/resources/js/Chart.min.js"></script>
<!-- jQuery Sparklines -->
<script src="${contextPath}/resources/js/jquery.sparkline.min.js"></script>
<!-- Flot -->
<script src="${contextPath}/resources/js/jquery.flot.js"></script>
<script src="${contextPath}/resources/js/jquery.flot.pie.js"></script>
<script src="${contextPath}/resources/js/jquery.flot.time.js"></script>
<script src="${contextPath}/resources/js/jquery.flot.stack.js"></script>
<script src="${contextPath}/resources/js/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="${contextPath}/resources/js/jquery.flot.orderBars.js"></script>
<script src="${contextPath}/resources/js/jquery.flot.spline.min.js"></script>
<script src="${contextPath}/resources/js/curvedLines.js"></script>
<!-- DateJS -->
<script src="${contextPath}/resources/js/date.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="${contextPath}/resources/js/moment.min.js"></script>
<script src="${contextPath}/resources/js/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->

<!-- <script src="${contextPath}/resources/js/custom.min.js"></script> -->

<!-- Doughnut Chart -->
<script>
    var myjson;
    $.getJSON("http://localhost:8080/metrics", function(json){
        myjson = json;
        donut();
    });
    donut = function () {
        $(document).ready(function () {
            var canvasDoughnut,
                options = {
                    legend: false,
                    responsive: false
                };

            new Chart(document.getElementById("memory"), {
                type: 'doughnut',
                tooltipFillColor: "rgba(51, 51, 51, 0.55)",
                data: {
                    labels: [
                        "Used",
                        "Free"
                    ],
                    datasets: [{
                        data: [myjson["mem"] - myjson["mem.free"], myjson["mem.free"]],
                        backgroundColor: [
                            "#9B59B6",
                            "#E74C3C",
                        ],
                        hoverBackgroundColor: [
                            "#B370CF",
                            "#E95E4F"
                        ]

                    }]
                },
                options: options
            });

            new Chart(document.getElementById("heap"), {
                type: 'doughnut',
                tooltipFillColor: "rgba(51, 51, 51, 0.55)",
                data: {
                    labels: [
                        "Commited",
                        "Used",
                        "Init"
                    ],
                    datasets: [{
                        data: [myjson["heap.committed"], myjson["heap.init"], myjson["heap.used"]],
                        backgroundColor: [
                            "#BDC3C7",
                            "#9B59B6",
                            "#E74C3C"
                        ],
                        hoverBackgroundColor: [
                            "#CFD4D8",
                            "#B370CF",
                            "#E95E4F",
                            "#36CAAB",
                            "#49A9EA"
                        ]

                    }]
                },
                options: options
            });

            new Chart(document.getElementById("time"), {
                type: 'doughnut',
                tooltipFillColor: "rgba(51, 51, 51, 0.55)",
                data: {
                    labels: [
                        "Uptime",
                        "Instance Uptime"
                    ],
                    datasets: [{
                        data: [myjson["uptime"], myjson["instance.uptime"]],
                        backgroundColor: [
                            "#BDC3C7",
                            "#9B59B6",
                            "#E74C3C",
                            "#26B99A",
                            "#3498DB"
                        ],
                        hoverBackgroundColor: [
                            "#CFD4D8",
                            "#B370CF",
                            "#E95E4F",
                            "#36CAAB",
                            "#49A9EA"
                        ]

                    }]
                },
                options: options
            });
        });
    }
</script>
<!-- /Doughnut Chart -->

<!-- bootstrap-daterangepicker -->
<script type="text/javascript">

    function searchItems()
    {
        var finalFilteredItems =  {}

        var queryText = $("#searchText").val()

        <c:forEach items="${ideas}" var="idea" >

        var ideaName =  "${idea.name}"
        var ideaDesc =  "${idea.description}"

        //console.log(ideaDesc.indexOf(queryText))

        if( ideaName.indexOf(queryText) >= 0 || ideaDesc.indexOf(queryText) >=0 )
        {
            finalFilteredItems["${idea.id}"] = true
        }

        </c:forEach>

        return finalFilteredItems
    }


    function preReq()
    {
        <c:forEach items="${ideas}" var="idea" >



        searchSpace.push("${idea.name}")
        searchSpace.push("${idea.description}")

        console.log("${idea.name}")

        itemsID["${idea.id}"] =  true

        var item ={};

        item['name'] = '${idea.name}';
        item['category'] = '${idea.category}'
        item['subcategory'] = '${idea.subCategory}'
        item['funds'] = '${idea.fundsRequired}'
        item['collectedFunds'] = '${idea.collectedFunds}'
        item['image'] = '${idea.image}'
        allItems[${idea.id}] = item;

        </c:forEach>

        // console.log(itemsID)

        localStorage.setItem("AllItems" , JSON.stringify(allItems));
    }


    function createGallery(finalFilterItems)
    {


        console.log("inside create gallery")

        var gallery = ""

        console.log(finalFilterItems)

        jQuery.each( finalFilterItems, function( key, value ) {


            console.log(key)

            var ideaName = allItems[key]['name']
            var image = allItems[key]['image']

            gallery += "<div class='item thumbnail col-xs-4 col-lg-4'>" +
                    "<div class = 'thumbnail'>"  +
                    "<img class='group list-group-image' src='"+ image + "' alt='Idea Image' style='width: 400px; height: 250px' />" +
                    "<div class='caption'>" +
                    "<h4 class='group inner list-group-item-heading'>" +
                    ideaName + "</h4>" +
                    " <p class='group inner list-group-item-text'> Target Funds:    $ <strong>"     + allItems[key]['funds']  +   "</strong></p>" +
                    " <p class='group inner list-group-item-text'> Collected Funds: $ <strong>"  + allItems[key]['collectedFunds']  +   "</strong></p>" +
                    //" <div class='row'> "+
                    " " + //" </div>" +
                    " <div style='float:left;padding-bottom:8px; padding-top:23px '>" +
                    " </div>" +

                    " <div style='float:left;padding-bottom:8px; padding-left:10px; padding-top:23px '> " +
                    " <button  class =' btn btn-info ' onclick=window.location='${contextPath}/Ideas/view/"+ key  + "' > Quick View</button></div>" +
                    "</div>       </div>               </div>              </div>"


        });
        gallery += "<div class='clearfix'></div>";
        $("#products-gallery2").html(gallery);


    }


    function showFilters()
    {
        <c:forEach items="${categories}" var="category" >
        console.log("${category}")
        category += "<div class='checkbox'> <input data-parent='category' class='checkboxFilter' type='checkbox' value="+ "${category}"+">"+ "${category}" +"</div>"
        </c:forEach>
        $("#categoryFilter").html(category);


        <c:forEach items="${subcategories}" var="subcategory" >
        subcategory += "<div class='checkbox'> <input data-parent='subcategory' class='checkboxFilter' type='checkbox' value="+ "${subcategory}"+">"+ "${subcategory}" +"</div>"
        console.log("${subcategory}")
        </c:forEach>
        $("#subCategoryFilter").html(subcategory)


        <c:forEach items="${funds}" var="fund" >
        funds += "<div class='checkbox'> <input data-parent='funds' class='checkboxFilter' type='checkbox' value="+ "${fund}"+">"+ "${fund}" +"</div>"
        console.log("${fund}")
        </c:forEach>
        $("#fundsFilter").html(funds)
    }

    function filterItems()
    {

        var finalFilterItems = {}
        var finalFilterItems1  = [];
        var finalFilterItems2  = [];
        var finalFilterItems3  = [];

        var filterStatus = 0;

        if(!jQuery.isEmptyObject(categoryFilterList)){

            <c:forEach items="${ideas}" var="idea" >


            jQuery.each( categoryFilterList, function( key, value ) {

                if("${idea.category}" == key)
                {
                    finalFilterItems[("${idea.id}")] = true
                }
            });
            </c:forEach>
        }



        if( !jQuery.isEmptyObject(subcategoryFilterList) )
        {

            if(jQuery.isEmptyObject(finalFilterItems))
            {
                <c:forEach items="${ideas}" var="idea" >
                jQuery.each( subcategoryFilterList, function( key, value ) {

                    if("${idea.subCategory}" == key)
                    {
                        finalFilterItems.push("${idea.id}")
                    }
                });
                </c:forEach>
            }
            else
            {

                var flag = false
                jQuery.each( finalFilterItems, function( k, v ) {
                    flag = false
                    jQuery.each( subcategoryFilterList, function( key, value ) {

                        if(allItems[k]['subcategory'] == key)
                        {
                            flag = true

                        }
                    });

                    if(flag == false)
                    {

                        delete finalFilterItems[k]
                    }
                });
            }

        }


        console.log(" after subcategory")

        console.log(finalFilterItems)

        //--------funds filters-----------

        if( !jQuery.isEmptyObject(fundsFilterList) )
        {

            if(jQuery.isEmptyObject(finalFilterItems))
            {
                <c:forEach items="${ideas}" var="idea" >
                jQuery.each( fundsFilterList, function( key, value ) {

                    if("${idea.fundsRequired}" == key)
                    {
                        finalFilterItems.push("${idea.id}")
                    }
                });
                </c:forEach>
            }
            else
            {
                var flag = false
                jQuery.each( finalFilterItems, function( k, v ) {
                    flag = false
                    jQuery.each( fundsFilterList, function( key, value ) {

                        if(allItems[k]['funds'] == key)
                        {
                            flag = true
                        }
                    });

                    if(flag == false)
                    {
                        delete finalFilterItems[k]
                    }
                });
            }
        }

        createGallery(finalFilterItems)
    }

    function displayFilteredItems(finalFilterItems)
    {

        var output = ""
        var flag = false
        jQuery.each( finalFilterItems, function( key, value ) {
            if(flag == false)
            {
                output += "<div>"
                        + "<div " + "class='gallery-left gallery-Item col-md-3 grid-stn simpleCart_shelfItem' style='margin:0 0px 10px ;border:1px solid #F7F2F2 ;padding-bottom:3px;' >"
                        + "<div  class='ih-item square effect3 bottom_to_top'  >"
                        + "<div  class='bottom-2-top'>"
                        + "<div  class='img'><img style = 'width:40px;height:30px;' src='${contextPath}/resources/images/logo.png' alt='/' class='img-responsive gri-wid'/></div>"
                        + "<div> <span><strong>Idea: <span style='color:#A5040E ;'>" + allItems[key]['name'] + "</span></strong></span><br>"
                        + "<span> <strong>Funds Required: $<span style='color:#A5040E; font-style:bold;'>"+ '100' +"</span></strong></span><br> </div>"
                        + "</div> </div>"
                        + "<div style='padding-bottom:10px;'><span><strong>Quantity: </strong></span>"
                        + "<input " + "id="+ key + " " + " value = '' "  +" class='Quantity' style='width:90px;height:25px; font-weight:bold;border-style: solid; border-radius: 8px;padding-left:3px;border-color:#828689;'> </input> </div>"
                        + "<div class='quick-view' data-name="+  allItems[key]['name'] +" data-price="+ '100'  +"> "
                        + "<div style='padding-right:5px;float:left;padding-bottom:30px;'><button class = 'quick-view-btn btn btn-info' data-sku="+ " action='#' >Quick view</button></div>"
                        + "<div style='float:left;padding-bottom:30px;'><button class = 'add-to-cartP btn-success btn'  data-toggle='modal' data-id ="+ key +" data-target='#basicModal' data-name="+   allItems[key]['name'] + ">Add to Cart</button></div>"
                        + "</div></div></div>";
                flag = true
            }
        });

        output += "<div class='clearfix'></div>";
        $("#products-gallery").html(output);

    }





</script>



<div class="header_top">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-0">
                <div id="imaginary_container">
                    <div class="input-group stylish-input-group">
                        <input id="searchText"  type="text" class="form-control"  placeholder="Search" >
                        <span class="input-group-addon">
                        <button id = "searchBtn" type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <span class="header_top_text">
                    Welcome ${pageContext.request.userPrincipal.name} |
                    <a role="button" aria-pressed="true" onclick="document.forms['logoutForm'].submit()">Logout</a>
                </span>
            </div>
        </div>
    </div>
</div>

<div class="menu">
    <header class="container">
        <div class="navbar navbar-inner" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a href="#"><span class="glyphicon glyphicon-shopping-cart shopping-cart navbar-toggle"></span></a>

                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a id="closepage" menuid="0" class="navbar-brand visible-lg visible-md" href="${contextPath}/admin/">
                        <img src="${contextPath}/resources/images/logo.png"/>
                    </a>

                </div>
                <div class="collapse navbar-collapse navbar-right" id="main-menu">
                    <ul class="nav navbar-nav">
                        <li class="fadeInDown animated d1 "><a href="${contextPath}/admin/`" class="active" id="home">Home</a></li>

                        <li class="fadeInDown animated d2"><a href="#" menuid="1">Analytics</a></li>

                        <li class="fadeInDown animated d5 "><a href="${contextPath}/Ideas/list" menuid="1">List Ideas</a></li>

                        <li class="fadeInDown animated d2"><a href="#" menuid="1">Funding History</a></li>

                        <li class="fadeInDown animated d3"><a href="#Iletisim">Returns</a></li>

                    </ul>

                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </c:if>

                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </header>
</div><!--menu-->
