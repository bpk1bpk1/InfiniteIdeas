<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${contextPath}/resources/css/contactus.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
</head>
<body>
<div class="myDiv">
    <div class="bg"></div>
<div id="contact-form">
    <jsp:include page="${contextPath}/investor/header.jsp" />
    <div>
        <h1>Nice to Meet You!</h1>
        <h4>Have a question or just want to get in touch? Let's chat.</h4>
    </div>
    <p id="failure">Oopsie...message not sent.</p>
    <p id="success">Your message was sent successfully. Thank you!</p>

    <form method="post" action="/">
        <div>
            <label for="name">
                <span class="required">Name: *</span>
                <input type="text" id="name" name="name" value="" placeholder="Your Name" required="required" tabindex="1" autofocus="autofocus" />
            </label>
        </div>
        <div>
            <label for="email">
                <span class="required">Email: *</span>
                <input type="email" id="email" name="email" value="" placeholder="Your Email" tabindex="2" required="required" />
            </label>
        </div>
        <div>
            <label for="subject">
                <span>Subject: </span>
                <select id="subject" name="subject" tabindex="4">
                    <option value="hello">Product Price Question</option>
                    <option value="quote">Where are my dragons?!</option>
                    <option value="general">- Valar Morghulis - </option>
                </select>
            </label>
        </div>
        <div>
            <label for="message">
                <span class="required">Message: *</span>
                <textarea id="message" name="message" placeholder="Please write your message here." tabindex="5" required="required"></textarea>
            </label>
        </div>
        <div>
            <button name="submit" type="submit" id="submit" >Send</button>
        </div>

    </form>

</div>
<div class="footer">
    <jsp:include page="${contextPath}/templates/footer.jsp"></jsp:include>
</div>
</div>
</body>

</html>