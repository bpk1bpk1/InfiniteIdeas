<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link href="${contextPath}/resources/css/header.css" rel="stylesheet">
    <script type="application/javascript" src="${contextPath}/resources/js/header.js"></script>
</head>
<body>
<div class="header_top"></div>

<div class="menu">
    <header class="container">
        <div class="navbar navbar-inner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-menu">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a id="closepage" menuid="0" class="brand" href="/welcome" followlink="true">
                        <img src="${contextPath}/resources/images/logo.png"/>
                    </a>

                </div>
                <div class="collapse navbar-collapse pull-right" id="main-menu">
                    <ul class="nav">
                        <li class="fadeInDown animated d1 "><a href="#" class="active" id="home" menuid="0" followlink="true" >Home</a></li>

                        <li class="fadeInDown animated d2"><a href="#" menuid="1" followlink="true">About</a></li>

                        <li class="dropdown fadeInDown animated d3">
                            <a href="#" class="trigger right-caret">Service</a>
                            <ul class="firstlevel dropdown-menu sub-menu" style="display: none;">
                                <li class="twolevel">
                                    <a class="trigger right-caret">Email Support</a>
                                    <!--   <ul class="thirdlevel dropdown-menu sub-menu" style="margin-left: -563px; display: none;">
                                           <li><a href="#" menuid="220" followlink="true">ŞİRKET BİRLEŞME & SATIN ALMA</a></li>
                                           <li><a href="#" menuid="221" followlink="true">HALKA ARZ</a></li>
                                           <li><a href="#" menuid="222" followlink="true">TAHVİL/BONO İHRACI</a></li>
                                           <li><a href="#" menuid="223" followlink="true">DANIŞMANLIK</a></li>

                                       </ul>-->
                                </li>
                                <li><a href="#" menuid="224" followlink="true">Router Support</a></li>
                                <li class="twolevel">
                                    <a class="trigger right-caret">Antivirus Support</a>
                                    <!-- <ul class="thirdlevel dropdown-menu sub-menu">
                                         <li><a href="#Forex" menuid="311" followlink="true">FOREX</a></li>
                                         <li><a href="#CFD" menuid="312" followlink="true">CFD</a></li>
                                         <li><a href="#Hisse" menuid="3" followlink="true">HİSSE/VİOP</a></li>
                                         <li><a href="#Turev" menuid="4" followlink="true">TÜREV</a></li>
                                         <li><a href="#UluslararasiPiyasalar" menuid="5" followlink="true">ULUSLARARASI PİYASALAR</a></li>
                                     </ul>-->
                                </li>
                                <li><a href="#Varlik-Yonetimi" menuid="10" followlink="true">Quickbook Support</a></li>
                                <li><a href="#Varlik-Yonetimi" menuid="10" followlink="true">Printer Support</a></li>
                                <li><a href="#Varlik-Yonetimi" menuid="10" followlink="true">Game Support</a></li>
                            </ul>


                        </li>

                        <li class="fadeInDown animated d3"><a href="#Iletisim" menuid="11" followlink="true">Dislaimer</a></li>

                        <li class="fadeInDown animated d2"><a href="#" menuid="1" followlink="true">Blog</a></li>

                        <li class="fadeInDown animated d2"><a href="#" menuid="1" followlink="true">Contact Us</a></li>

                    </ul>

                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </header>
</div><!--menu-->

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<%--<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">--%>
<%--<link href="${contextPath}/resources/css/common.css" rel="stylesheet">--%>
<%--<link href="${contextPath}/resources/css/Cstyle.css" rel="stylesheet">--%>
<%--<link href="${contextPath}/resources/css/style.css" rel="stylesheet">--%>
</html>
