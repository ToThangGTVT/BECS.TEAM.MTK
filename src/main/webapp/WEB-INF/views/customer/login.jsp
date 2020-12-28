<%--
  Created by IntelliJ IDEA.
  User: dcm
  Date: 14/05/2020
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>My Account | Books Library eCommerce Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="resources/images/favicon.ico">
    <link rel="apple-touch-icon" href="resources/images/icon.png">
    <link rel="stylesheet" href="resources/css/becs.css">

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <%--    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">--%>
    <%--    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800"--%>
    <%--          rel="stylesheet">--%>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,300,400,500,700,900" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/bootstrap.min.css">
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/plugins.css">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/style.css">
    <%--	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">--%>

    <!-- Cusom css -->
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/Toast.css">
	<link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/Modal.css">
    <!-- Modernizer js -->
    <script src="${pageContext.request.getContextPath()}/resources/js/vendor/modernizr-3.5.0.min.js"></script>
</head>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <%--    <jsp:include page="part/header.jsp"/>--%>
	<!-- //Header -->
	<jsp:include page="part/ModalReport.jsp"/>
	<!-- Start Search Popup -->

	<!-- phần tìm kiếm -->


	<!-- <div class="box-search-content search_active block-bg close__top">
        <form id="search_mini_form" class="minisearch" action="#">
            <div class="field__search">
                <input type="text" placeholder="Search entire store here...">
                <div class="action">
                    <a href="#"><i class="zmdi zmdi-search"></i></a>
                </div>
            </div>
        </form>
        <div class="close__wrap">
            <span>close</span>
        </div>
    </div> -->
	<!-- End Search Popup -->
	<!-- Start My Account Area -->
	<section class="my_account_area pt--80 pb--55 bg--white">
		<div class="container-fluid" id="contentLogin">
			<div class="row">
				<div class="col-lg-4 offset-lg-4 col-md-12">
					<div class="my__account__wrapper">
						<h3 class="account__title">Login</h3>
						<form:form modelAttribute="customer" action="${pageContext.request.getContextPath()}/login"
								   method="post">
							<div class="account__form">
								<div class="input__box">
									<label>Username or email address <span>*</span></label>
									<form:input path="email" type="text" required="required" pattern="(([a-z-A-Z]+\\w+[a-zA-Z0-9]+[@][a-z-A-Z]+\\w+[a-zA-Z0-9][.][a-z-A-Z]+\\w+[a-zA-Z0-9])([.][a-z-A-Z]+\\w+[a-zA-Z0-9])?)"/>
									<form:errors path="email" cssClass="errorSpan"/>
								</div>
								<div class="input__box">
									<label>Password<span>*</span></label>
									<form:input path="password" autocomplete="true" type="password" pattern="\w{5,10}" required="required"/>
									<form:errors path="password" cssClass="errorSpan"/>
								</div>
								<div class="input__box">
									<a href="register">Click here to register</a>
								</div>
								<div class="form__btn">
									<button class="btn btn-primary">Login</button>
								</div>
							</div>
							<c:if test="${error==null}">
								<c:set var="error">
									<form:errors path="*"/>
								</c:set>
							</c:if>
						</form:form>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- End My Account Area -->
    <!-- Footer Area -->

    <!-- //Footer Area -->

</div>
<!-- //Main wrapper -->

<!-- JS Files -->
<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
<%--	<script src="resources/js/bootstrap.min.js"></script>--%>
<script src="<%=request.getContextPath()%>/resources/js/plugins.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/active.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/myJavascript.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<%--	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>--%>


<script>

    $(document).ready(function () {
        checkReport('${error}', '${success}')
        // $("form").submit(function () {
        //     console.log("ok");
        //     ValidateLogin();
        //     return false;
        //
        // })
        $("form").submit(function () {
            console.log("ok");
            ValidateLogin();
            return false;
        })
    })

</script>
</body>

</html>
