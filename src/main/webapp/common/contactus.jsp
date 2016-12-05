<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<title>Contact Us</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico">
<link rel="stylesheet" href="${contextPath}/resources/css/contactus.css">
<body>
<jsp:include page="${contextPath}/${role}/header.jsp" />
<div id="contact-form">
    <div>
        <h1>Nice to Meet You!</h1>
        <h4>Have a question or just want to get in touch? We will be in touch as soon as possible...</h4>
    </div>

    <form:form method="POST" modelAttribute="contactForm" action="${contextPath}/contact">
        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="name">Name: *</form:label>
                <form:input type="text" path="name" class="form-control" placeholder="Your Name"
                            autofocus="true" id="name"></form:input>
                <form:errors path="name"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="email">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="email">Email: *</form:label>
                <form:input type="email" path="email" class="form-control" placeholder="Your Email"
                            autofocus="true" id="email"></form:input>
                <form:errors path="email"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="subject">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="subject">Subject: *</form:label>
                <form:input type="text" path="subject" class="form-control" placeholder="Your Question"
                            autofocus="true" id="subject"></form:input>
                <form:errors path="subject"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="message">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:label path="message">Message: *</form:label>
                <form:input type="text" path="message" class="form-control" placeholder="Please Wite your message here"
                            id="message"></form:input>
                <form:errors path="message"></form:errors>
            </div>
        </spring:bind>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">Submit</button>
    </form:form>

</div>
<div id="footer" class="footer">
    <jsp:include page="../templates/footer.jsp"></jsp:include>
</div>
</body>

</html>