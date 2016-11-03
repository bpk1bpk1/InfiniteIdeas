<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Title</title>
</head>
<body>

<form id="logoutForm" method="POST" action="${contextPath}/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>


<div class="header">
    <div class="top_bg">
        <div class="container">

            <div class="header_top">
                <div class="logo">
                    <img class="imge" src="${contextPath}/resources/images/logo.jpg" />
                </div>
                <div class="top_right">
                    <ul>
                        <li>Welcome <span style='font-weight:bold;'> ${pageContext.request.userPrincipal.name}  </span></li>
                        <li class="logout">
                            <div   id="logoutContainer">
                                <a class="btn btn-success" onclick="document.forms['logoutForm'].submit()">Logout</a>
                            </div>
                        </li>


                        <li class="cart">
                            <div>
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="${contextPath}/cart/checkout"><img class="imge" alt=""
                                                                                    src="${contextPath}/resources/images/logo.jpg" /></a>
                            </div>
                        </li>

                      <!--  <a href="${contextPath}/Ideas/list" class="btn btn-success">Back</a>-->


                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>



</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link href="${contextPath}/resources/css/Cstyle.css" rel="stylesheet">
<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
</html>
