<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load("upcoming", {packages:["map"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Lat', 'Long'],
            <c:forEach items="${locations}" var="loc" varStatus="itr">
            [<c:out value="${loc.key}"/>,<c:out value="${loc.value}"/>],
            </c:forEach>
        ]);

        var map = new google.visualization.Map(document.getElementById('map_div'));
        map.draw(data, {
            showTooltip: true,
            showInfoWindow: true
        });
    }
</script>