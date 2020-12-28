<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 26/5/2020
  Time: 7:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/bootstrap.min.css">
    <script src="resources/js/vendor/jquery-3.2.1.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container h-100">
    <div class="row h-100 justify-content-center align-items-center">
        <form class="col-5">
            <div class="form-group">
                <div class="card">
                    <div class="card-header">
                        Warning
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">The session is not valid</h5>
                        <p class="card-text">Please return to the homepage to continue.</p>
                        <a href="${pageContext.request.getContextPath()}" class="btn btn-primary">Go home</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
