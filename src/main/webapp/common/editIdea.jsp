<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Edit an Idea</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${contextPath}/resources/images/favicon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <style>
        .container {
            height: 72%;
        }
        .identifier{
            padding-top: 25px;
            position: absolute;
            color: #122b40;
        }
        .value{
            padding-top: 5px;
            position: absolute;
        }
    </style>
</head>
<body>
<jsp:include page="${contextPath}/${role}/header.jsp"></jsp:include>
<div class="myDiv">
    <div class="bg"></div>
    <div class="container">
        <form:form method="POST" modelAttribute="ideaForm" class="form-signin edit-page" action="${contextPath}/Ideas/update">
            <h2 class="form-signin-heading">Edit an idea!</h2>
            <spring:bind path="name">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <span class="col-md-2 identifier">
                        <form:label path="name">Name: </form:label>
                    </span>
                    <span class="col-md-10 value">
                        <form:input type="text" path="name" class="form-control" placeholder="name"
                                    autofocus="true" id="name"></form:input>
                        <form:errors path="name"></form:errors>
                    </span>
                </div>
            </spring:bind>

            <spring:bind path="description">
                <span class="col-md-2 identifier">
                    <form:label path="description">Description: </form:label>
                </span>
                <span class="col-md-10 value">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="description" class="form-control" placeholder="Description"
                                    autofocus="true" id="description"></form:input>
                        <form:errors path="description"></form:errors>
                    </div>
                </span>
            </spring:bind>


            <spring:bind path="fundsRequired">
                <span class="col-md-2 identifier">
                    <form:label path="fundsRequired">Funds: </form:label>
                </span>
                <span class="col-md-10 value">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="number" path="fundsRequired" class="form-control" placeholder="500"
                                    id="fundsRequired"></form:input>
                        <form:errors path="fundsRequired"></form:errors>
                    </div>
                </span>
            </spring:bind>

            <spring:bind path="image">
                <span class="col-md-2 identifier">
                    <form:label path="image">Image: </form:label>
                </span>
                <span class="col-md-10 value">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="image" class="form-control"
                                    placeholder="Image url" id="image"></form:input>
                        <form:errors path="image"></form:errors>
                    </div>
                </span>
            </spring:bind>

            <spring:bind path="subCategory">
                <span class="col-md-4 identifier">
                    <form:label path="subCategory">Sub-Category: </form:label>
                </span>
                <span class="col-md-8 value">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="subCategory" class="form-control"
                                    placeholder="Sub-category" id="subCategory"></form:input>
                        <form:errors path="subCategory"></form:errors>
                    </div>
                </span>
            </spring:bind>


            <spring:bind path="category">
                <div style="color: white" class="dropdown form-group ${status.error ? 'has-error' : ''}">
                    <span class="col-md-2 identifier">
                            <form:label path="category">Category: </form:label>
                    </span>
                    <span class="col-md-10 value">
                        <form:select path="category">
                            <form:option cssStyle="color: black" value="">-Select Option-</form:option>
                            <form:option cssStyle="color: black" value="Food">Food</form:option>
                            <form:option cssStyle="color: black" value="Technology">Technology</form:option>
                            <form:option cssStyle="color: black" value="Art">Art</form:option>
                            <form:option cssStyle="color: black" value="Design">Design</form:option>
                            <form:option cssStyle="color: black" value="Games">Games</form:option>
                        </form:select>
                        <form:errors path="category"></form:errors>
                    </span>
                </div>
            </spring:bind>

            <spring:bind path="id">
                <div class="form-group">
                    <form:hidden path="id" id="id"></form:hidden>
                </div>
            </spring:bind>

            <spring:bind path="userId">
                <div class="form-group">
                    <form:hidden path="userId" id="userId"></form:hidden>
                </div>
            </spring:bind>

            <spring:bind path="collectedFunds">
                <div class="form-group">
                    <form:hidden path="collectedFunds" id="collectedFunds"></form:hidden>
                </div>
            </spring:bind>

            <button class="btn btn-lg btn-primary btn-block" type="submit" id="register">Submit</button>
        </form:form>
    </div>
    <div class="footer">
        <jsp:include page="${contextPath}/templates/footer.jsp"></jsp:include>
    </div>
</div>
</body>
</html>