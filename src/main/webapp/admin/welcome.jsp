<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Welcome to infiniteideas!</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resources/images/favicon.ico" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/css/homepage.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
<div class="myDiv">
    <div class="bg"></div>
<jsp:include page="header.jsp"></jsp:include>
<script type="application/javascript" src="${contextPath}/resources/js/datarangepicker.js"></script>
<script type="application/javascript" src="${contextPath}/resources/js/sparklines.js"></script>
<script type="application/javascript" src="${contextPath}/resources/js/float.js"></script>

<div class="container">
    <div class="row horizontal-strip top_tiles">
        <div class="animated flipInY col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="tile-stats">
                <div class="icon"><i class="fa fa-check-square-o"></i></div>
                <div class="count">${signUps['entrepreneur']}</div>
                <h3>Sign ups</h3>
                <p>Entrepreneur</p>
            </div>
        </div>
        <div class="animated flipInY col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="tile-stats">
                <div class="icon"><i class="fa fa-check-square-o"></i></div>
                <div class="count">${signUps['investor']}</div>
                <h3>Sign ups</h3>
                <p>Investors</p>
            </div>
        </div>
    </div>
    <div class="row horizontal-strip">
        <div class="col-md-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Transaction Summary <small>Weekly progress</small></h2>
                    <div class="filter">
                        <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                            <span>August 1, 2016 - October 8, 2016</span> <b class="caret"></b>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="demo-container" style="height:280px">
                            <div id="placeholder33x" class="demo-placeholder"></div>
                        </div>
                        <div class="tiles">
                            <div class="col-md-6 tile">
                                <span>Total Sessions</span>
                                <h2>231,809</h2>
                                <span class="sparkline11 graph" style="height: 160px;">
                                          <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                      </span>
                            </div>
                            <div class="col-md-6 tile">
                                <span>Total Revenue</span>
                                <%--<h2>$231,809</h2>--%>
                                <h2>$${revenue}</h2>
                                <span class="sparkline22 graph" style="height: 160px;">
                                          <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                      </span>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div>
                            <div class="x_title">
                                <h2>Top Profiles</h2>
                                <div class="clearfix"></div>
                            </div>
                            <ul class="list-unstyled top_profiles scroll-view">
                                <li class="media event">
                                    <a class="pull-left border-aero profile_thumb">
                                        <i class="fa fa-user aero"></i>
                                    </a>
                                    <div class="media-body">
                                        <a class="title" href="#">Nograj</a>
                                        <p><strong>$15600. </strong> Investor </p>
                                        </p>
                                    </div>
                                </li>
                                <li class="media event">
                                    <a class="pull-left border-green profile_thumb">
                                        <i class="fa fa-user green"></i>
                                    </a>
                                    <div class="media-body">
                                        <a class="title" href="#">Prerana Kamath</a>
                                        <p><strong>$10800. </strong> Investor </p>
                                        </p>
                                    </div>
                                </li>
                                <li class="media event">
                                    <a class="pull-left border-blue profile_thumb">
                                        <i class="fa fa-user blue"></i>
                                    </a>
                                    <div class="media-body">
                                        <a class="title" href="#">Srikanth Holavanahalli</a>
                                        <p><strong>$9200. </strong> Investor </p>
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="row horizontal-strip">
        <div class="col-md-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Weekly Summary <small>Activity shares</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">

                    <div class="row" style="border-bottom: 1px solid #E0E0E0; padding-bottom: 5px; margin-bottom: 5px;">
                        <div class="col-md-12">
                            <div class="row" style="text-align: center;">
                                <div class="col-md-4">
                                    <canvas id="memory" height="110" width="110" style="margin: 5px 10px 10px 0"></canvas>
                                    <h4 style="margin:0">Memory</h4>
                                </div>
                                <div class="col-md-4">
                                    <canvas id="heap" height="110" width="110" style="margin: 5px 10px 10px 0"></canvas>
                                    <h4 style="margin:0">Heap</h4>
                                </div>
                                <div class="col-md-4">
                                    <canvas id="time" height="110" width="110" style="margin: 5px 10px 10px 0"></canvas>
                                    <h4 style="margin:0">Up-Time</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row horizontal-strip">
        <div class="heading">
            OUR CUSTOMERS
        </div>
        <jsp:include page="${contextPath}/templates/map.jsp"></jsp:include>
        <div id="map_div"></div>
    </div>
</div>

<div class="footer">
    <jsp:include page="../templates/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>
