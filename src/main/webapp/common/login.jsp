<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Infiniteideas</title>
    <link rel="icon" href="${contextPath}/resources/images/favicon.ico">
    <!-- Bootstrap Core -->
    <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="application/javascript" src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script type="application/javascript" src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Custom Fonts -->
    <link href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="${contextPath}/resources/css/agency.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script type="application/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script type="application/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" class="index">

<!-- Header -->
<header>
    <div class="container">
        <div class="logo">
            <img src="${contextPath}/resources/images/logo.png">
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="intro-text">
                    <div class="intro-lead-in">We are InfiniteIdeas</div>
                    <div class="intro-heading">It's Nice To Meet You</div>
                    <a href="#services" class="page-scroll btn btn-xl">Know More</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-lock"></span> Login</div>
                    <div class="panel-body">
                        <form method="POST" action="${contextPath}/login" class="form-horizontal" role="form">
                            <div class="form-group ${error != null ? 'has-error' : ''}">
                                <label for="username" class="col-sm-3 control-label">
                                    Username</label>
                                <div class="col-sm-9">
                                    <input name="username" type="text" class="form-control" id="username" placeholder="Username" required>
                                </div>

                                <label for="inputPassword3" class="col-sm-3 control-label">
                                    Password</label>
                                <div class="col-sm-9">
                                    <input name="password" type="password" class="form-control" id="inputPassword3" placeholder="Password" required>
                                    <span>${error}</span>
                                </div>
                                <span>${message}</span>

                                <div class="col-sm-offset-3 col-sm-9">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"/>
                                            Remember me
                                        </label>
                                    </div>
                                </div>

                                <div class="col-sm-offset-3 col-sm-9 last">
                                    <button type="submit" class="btn btn-success btn-sm">
                                        Sign in</button>
                                    <button type="reset" class="btn btn-default btn-sm">
                                        Reset</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="panel-footer">
                        Not Registered? <a href="${contextPath}/registration">Register here</a></div>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Services Section -->
<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Services</h2>
                <h3 class="section-subheading text-muted">We bet you're interested in our services.</h3>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-md-6">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
                    </span>
                <h4 class="service-heading">Are you looking to invest?</h4>
                <p class="text-muted">We at InfiniteIdeas help you invest in ideas according your taste. A set of refined ideas will help you delve into investing for your favourite pick of the lot.</p>
            </div>
            <div class="col-md-6">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                <h4 class="service-heading">Are you looking to fund your idea?</h4>
                <p class="text-muted">We at InfiniteIdeas help attract investors and raise the funding that is vital to commence your idea.</p>
            </div>
            <%--<div class="col-md-4">--%>
                    <%--<span class="fa-stack fa-4x">--%>
                        <%--<i class="fa fa-circle fa-stack-2x text-primary"></i>--%>
                        <%--<i class="fa fa-lock fa-stack-1x fa-inverse"></i>--%>
                    <%--</span>--%>
                <%--<h4 class="service-heading">Web Security</h4>--%>
                <%--<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>--%>
            <%--</div>--%>
        </div>
    </div>
</section>

<!-- Projects Grid Section -->
<section id="portfolio" class="bg-light-gray">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Projects</h2>
                <h3 class="section-subheading text-muted">InfiniteIdeas that have flourished.</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="${contextPath}/resources/images/portfolio/Baymax.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>Artifical Intelligent Systems</h4>
                    <p class="text-muted">A personal healthcare companion.</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="${contextPath}/resources/images/portfolio/Obama.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>Art</h4>
                    <p class="text-muted">Mosaic Art: Obama</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="${contextPath}/resources/images/portfolio/donald-trump.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>The Moronic Productions</h4>
                    <p class="text-muted">Trump as President?Holy Guacamole!</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal4" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="${contextPath}/resources/images/portfolio/FF.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>Flouroscent Fix</h4>
                    <p class="text-muted">The Bling Jacket</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal5" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="${contextPath}/resources/images/portfolio/Animal%20Shelter.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>Nature's Disappointed</h4>
                    <p class="text-muted">Under one Woof - Animal Shelter</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal6" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="${contextPath}/resources/images/portfolio/Comic.jpeg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>Comic Graduate Life</h4>
                    <p class="text-muted">AI versus Natural Stupidity.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<section id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">The story of InfiniteIdeas</h2>
                <h3 class="section-subheading text-muted">Get to know us better!</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="timeline">
                    <li>
                        <div class="timeline-image">
                            <img class="img-circle img-responsive" src="${contextPath}/resources/images/about/Infinity-Symbol.jpg" alt="">
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>The second of October 2016</h4>
                                <h4 class="subheading">Our Humble Beginnings</h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted">The team met for the first time. Thus,the seed called InfiniteIdeas was implanted.</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <img class="img-circle img-responsive" src="${contextPath}/resources/images/about/fall.jpg" alt="">
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>The Fall of 2016</h4>
                                <h4 class="subheading">Our embryo received it's first few doses of nourishment.</h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted">The customer and the team had their initial meetings and suited the software to meet customer's requirements. </p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image">
                            <img class="img-circle img-responsive" src="${contextPath}/resources/images/about/3.jpg" alt="">
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Winter is coming.</h4>
                                <h4 class="subheading">The crux time.</h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted">The final preparations before the big day.</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <img class="img-circle img-responsive" src="${contextPath}/resources/images/about/Group.jpeg" alt="">
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>7th of December 2016</h4>
                                <h4 class="subheading">The Launch!</h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted">The platform InfiniteIdeas was born.</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>Be Part
                                <br>Of Our
                                <br>Story!</h4>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>

<!-- Team Section -->
<section id="team" class="bg-light-gray">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">The Infinitely Brilliant Team</h2>
                <h3 class="section-subheading text-muted">The brains of InfiniteIdeas.</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="team-member">
                    <img src="${contextPath}/resources/images/team/Prerana.jpg" class="img-responsive img-circle" alt="">
                    <h4>Burde Prerana Kamath</h4>
                    <p class="text-muted">Chief Executive Officer</p>
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="team-member">
                    <img src="${contextPath}/resources/images/team/Vishwas.JPG" class="img-responsive img-circle" alt="">
                    <h4>Vishwas Vijaya Kumar</h4>
                    <p class="text-muted">Chief Operating Officer</p>
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="team-member">
                    <img src="${contextPath}/resources/images/team/Srikanth.jpg" class="img-responsive img-circle" alt="">
                    <h4>Sriknath Srinivas Holavanahalli</h4>
                    <p class="text-muted">Cheif Technical Officer</p>
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="team-member">
                    <img src="${contextPath}/resources/images/team/Madhukiran.jpg" class="img-responsive img-circle" alt="">
                    <h4>Madhukiran Radhakrishnan</h4>
                    <p class="text-muted">Chief Marketing Officer</p>
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="team-member">
                    <img src="${contextPath}/resources/images/team/Saif.jpg" class="img-responsive img-circle" alt="">
                    <h4>Syed Saif Ahmed</h4>
                    <p class="text-muted">Chief Financial Officer</p>
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="team-member">
                    <img src="${contextPath}/resources/images/team/Rohith.jpg" class="img-responsive img-circle" alt="">
                    <h4>Rohith Nedunuri</h4>
                    <p class="text-muted">Customer</p>
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <p class="large text-muted">We are pleased you have visited us. Invest! Become an entrepreneur! Be a part of the InfiniteIdeas. </p>
            </div>
        </div>
    </div>
</section>



<!-- Portfolio Modals -->
<!-- Use the modals below to showcase details about your portfolio projects! -->

<!-- Portfolio Modal 1 -->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>A personal healthcare companion</h2>
                            <p class="item-intro text-muted">A safe pair of hands with you always.</p>
                            <img class="img-responsive img-centered" src="${contextPath}/resources/images/portfolio/Baymax.jpg" alt="">
                            <p> A personal healthcare companion who does not occupy much space and will be used for emergency care anywhere at any time!In an ambulance, in a bag, in a hospital , this system will take immediate care of the hurt human before a doctor can attend to the human being if required.</p>
                            <p>
                                <strong>Want to have doctor with you always?</strong> Invest in the idea and be carefree</p>
                            <ul class="list-inline">
                                <li>Date: December 2016</li>
                                <li>Client: Artificial Intelligent Systems</li>
                                <li>Category: Science</li>
                            </ul>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 2 -->
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Mosaic Art : Obama</h2>
                            <p class="item-intro text-muted">Have the potrait of the greatest leader the world has ever seen.</p>
                            <img class="img-responsive img-centered" src="${contextPath}/resources/images/portfolio/Obama.jpg" alt="">
                            <p><a href="http://designmodo.com/startup/?u=787">Mosaic portrait of President Obama</a> is an exquisite piece of art that can be developed with unique pictures of all the investors that can be sent to us.</p>
                            <p>You can contact us, Mosaic Arts on our website for further details.</p>
                            <ul class="list-inline">
                                <li>Date: December 2016</li>
                                <li>Client: Mosaic Art</li>
                                <li>Category: Art</li>
                            </ul>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 3 -->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>Trump as President?Holy Guacamole!</h2>
                            <p class="item-intro text-muted">Another movie to have you laughing with tears.</p>
                            <img class="img-responsive img-centered" src="${contextPath}/resources/images/portfolio/donald-trump.jpg" alt="">
                            <p>The movie is built on the Presendital elections that took place in United States of America during 2016. The possible impacts of choosing Trump as President will be showcased.</p>
                            <p> Guaranteed to tickle your funny bones.</p>
                            <ul class="list-inline">
                                <li>Date: December 2016</li>
                                <li>Client: The Moronic Productions</li>
                                <li>Category: Film Making</li>
                            </ul>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 4 -->
<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>The Bling Jacket</h2>
                            <p class="item-intro text-muted">Be a part of the world wide trend with this jacket .</p>
                            <img class="img-responsive img-centered" src="${contextPath}/resources/images/portfolio/FF.jpg" alt="">
                            <p>The Bling Jacket is available in more sizes than what is known to common public. Invest in us to get 20% off and begin the trend in your area with the jacket.</p>
                            <p>DO NOT LET YOUR WARDROBE MISS OUT ON THIS!</p>
                            <ul class="list-inline">
                                <li>Date: December 2016</li>
                                <li>Client: Flouroscent Fix</li>
                                <li>Category: Fashion</li>
                            </ul>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 5 -->
<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>Under one Woof - Animal Shelter</h2>
                            <p class="item-intro text-muted">Why will you not invest in Animal Shelter?</p>
                            <img class="img-responsive img-centered" src="${contextPath}/resources/images/portfolio/Animal%20Shelter.jpg" alt="">
                            <p>Under one Woof is a social project hoping to attain some funds to start building an animal shelter for the old dogs and provide an opportunity for adoption to everyone interested.</p>
                            <p>Please invest in us to have animals to play with in your locality!</p>
                            <ul class="list-inline">
                                <li>Date: December 2016</li>
                                <li>Client: Nature's Disaapointed</li>
                                <li>Category: Social Service</li>
                            </ul>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 6 -->
<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>Artifical Intelligence versus Natural Stupidity.</h2>
                            <p class="item-intro text-muted">Ever wondered if the field was required or not?.</p>
                            <img class="img-responsive img-centered" src="${contextPath}/resources/images/portfolio/Comic.jpeg" alt="">
                            <p>These two series comic books are going to portray a computer scientist and his real life difficultly in solving day to day inference obstacles. .</p>
                            <p>Invest in us to win merchandise upto 50$ and get the first few episodes of the second series.</p>
                            <ul class="list-inline">
                                <li>Date: December 2016</li>
                                <li>Client: Comic Graduate Life</li>
                                <li>Category: Comics</li>
                            </ul>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../templates/footer.jsp"></jsp:include>
</body>
</html>