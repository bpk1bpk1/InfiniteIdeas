<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="${contextPath}/header.jsp" />
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
    <script type="application/javascript">
        function fund() {
            $.ajax({
                type: "POST",
                url: "/cart/fund",
                data: JSON.stringify({sc1: { id: "1", name: "IU idea", funds: "100" },
                    sc2 :{ id: "10", name: "PU idea", funds: "50" }}),
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

    <input type="submit" id="button" onclick="fund()">

<script type="application/javascript" src="js/jquery.js"></script>
<script type="application/javascript" src="js/bootstrap.js"></script>


</body>
</html>
