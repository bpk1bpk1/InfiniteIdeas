<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9hjOTRyxi4MyRZeG31M0uTiP3hf6w58o&callback=initMap"
        type="text/javascript"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load("upcoming", {packages:["map"]});
    google.charts.setOnLoadCallback(drawChart);
    function initMap() {
        console.log("Lets see");
    }
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