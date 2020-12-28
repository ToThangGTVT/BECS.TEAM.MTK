<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <link rel="stylesheet" type="text/css" href="resources/css/becs.css">

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

    <!-- Modernizer js -->
    <script src="${pageContext.request.getContextPath()}/resources/js/vendor/modernizr-3.5.0.min.js"></script>
	<style>
		.error{
			color: red;
		}
	</style>
</head>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <header id="wn__header" class="oth-page header__area header__absolute sticky__header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-7 col-lg-2">
                    <div class="logo">
                        <a href="index.html">
                            <img src="resources/images/logo/logo.png" alt="logo images">
                        </a>
                    </div>
                </div>
				<div class="col-lg-8 d-none d-lg-block">
					<nav class="mainmenu__nav">
						<ul class="meninmenu d-flex justify-content-start">
							<li class="drop with--one--item"><a href="index.html">Home</a>
								<div class="megamenu dropdown">
									<ul class="item item01">
										<li><a href="index.html">Home Style Default</a></li>
										<li><a href="index-2.html">Home Style Two</a></li>
										<li><a href="index-3.html">Home Style Three</a></li>
										<li><a href="index-box.html">Home Box Style</a></li>
									</ul>
								</div>
							</li>
							<li class="drop"><a href="shop-grid.html">Books</a>
								<div class="megamenu mega02">
									<ul class="item item02">
										<li class="title">Categories</li>
										<li><a href="shop-grid.html">Biography </a></li>
										<li><a href="shop-grid.html">Business </a></li>
										<li><a href="shop-grid.html">Cookbooks </a></li>
										<li><a href="shop-grid.html">Health & Fitness </a></li>
										<li><a href="shop-grid.html">History </a></li>
									</ul>
									<ul class="item item02">
										<li class="title">Author</li>
										<li><a href="shop-grid.html">Mystery</a></li>
										<li><a href="shop-grid.html">Religion & Inspiration</a></li>
										<li><a href="shop-grid.html">Romance</a></li>
										<li><a href="shop-grid.html">Fiction/Fantasy</a></li>
										<li><a href="shop-grid.html">Sleeveless</a></li>
									</ul>
								</div>
							</li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-md-8 col-sm-8 col-5 col-lg-2">
					<ul class="header__sidebar__right d-flex justify-content-end align-items-center">
						<li class="shop_search">
							<!-- <a class="search__active" href="#"></a> -->
							<form class="form-inline my-2 my-lg-0" style="display: contents;">
								<input class="form-control mr-sm-2" type="search" placeholder="Search"
									   aria-label="Search">
								<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
							</form>
						</li>
						<li class="wishlist"></li>
						<li class="shopcart"><a class="cartbox_active" href="#"><span
								class="product_qun">3</span></a>
							<!-- Start Shopping Cart -->
							<div class="block-minicart minicart__active">
								<div class="minicart-content-wrapper">
									<div class="micart__close">
										<span>close</span>
									</div>
									<div class="items-total d-flex justify-content-between">
										<span>3 items</span>
										<span>Cart Subtotal</span>
									</div>
									<div class="total_amount text-right">
										<span>$66.00</span>
									</div>
									<div class="mini_action checkout">
										<a class="checkout__btn" href="cart.html">Go to Checkout</a>
									</div>
									<div class="single__items">
										<div class="miniproduct">
											<div class="item01 d-flex">
												<div class="thumb">
													<a href="product-details.html"><img
															src="resources/images/product/sm-img/1.jpg"
															alt="product images"></a>
												</div>
												<div class="content">
													<h6><a href="product-details.html">Voyage Yoga Bag</a></h6>
													<span class="prize">$30.00</span>
													<div class="product_prize d-flex justify-content-between">
														<span class="qun">Qty: 01</span>
														<ul class="d-flex justify-content-end">
															<li><a href="#"><i class="zmdi zmdi-settings"></i></a>
															</li>
															<li><a href="#"><i class="zmdi zmdi-delete"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="item01 d-flex mt--20">
												<div class="thumb">
													<a href="product-details.html"><img
															src="resources/images/product/sm-img/3.jpg"
															alt="product images"></a>
												</div>
												<div class="content">
													<h6><a href="product-details.html">Impulse Duffle</a></h6>
													<span class="prize">$40.00</span>
													<div class="product_prize d-flex justify-content-between">
														<span class="qun">Qty: 03</span>
														<ul class="d-flex justify-content-end">
															<li><a href="#"><i class="zmdi zmdi-settings"></i></a>
															</li>
															<li><a href="#"><i class="zmdi zmdi-delete"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="item01 d-flex mt--20">
												<div class="thumb">
													<a href="product-details.html"><img
															src="resources/images/product/sm-img/2.jpg"
															alt="product images"></a>
												</div>
												<div class="content">
													<h6><a href="product-details.html">Compete Track Tote</a></h6>
													<span class="prize">$40.00</span>
													<div class="product_prize d-flex justify-content-between">
														<span class="qun">Qty: 03</span>
														<ul class="d-flex justify-content-end">
															<li><a href="#"><i class="zmdi zmdi-settings"></i></a>
															</li>
															<li><a href="#"><i class="zmdi zmdi-delete"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="mini_action cart">
										<a class="cart__btn" href="cart.html">View and edit cart</a>
									</div>
								</div>
							</div>
							<!-- End Shopping Cart -->
						</li>
						<li class="setting__bar__icon"><a class="setting__active" href="#"></a>
							<div class="searchbar__content setting__block">
								<div class="content-inner">
									<div class="switcher-currency">
										<strong class="label switcher-label">
											<span>Currency</span>
										</strong>
										<div class="switcher-options">
											<div class="switcher-currency-trigger">
												<span class="currency-trigger">USD - US Dollar</span>
												<ul class="switcher-dropdown">
													<li>GBP - British Pound Sterling</li>
													<li>EUR - Euro</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="switcher-currency">
										<strong class="label switcher-label">
											<span>Language</span>
										</strong>
										<div class="switcher-options">
											<div class="switcher-currency-trigger">
												<span class="currency-trigger">English01</span>
												<ul class="switcher-dropdown">
													<li>English02</li>
													<li>English03</li>
													<li>English04</li>
													<li>English05</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="switcher-currency">
										<strong class="label switcher-label">
											<span>Select Store</span>
										</strong>
										<div class="switcher-options">
											<div class="switcher-currency-trigger">
												<span class="currency-trigger">Fashion Store</span>
												<ul class="switcher-dropdown">
													<li>Furniture</li>
													<li>Shoes</li>
													<li>Speaker Store</li>
													<li>Furniture</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="switcher-currency">
										<strong class="label switcher-label">
											<span>My Account</span>
										</strong>
										<div class="switcher-options">
											<div class="switcher-currency-trigger">
												<div class="setting__menu">
													<span><a href="#">Compare Product</a></span>
													<span><a href="#">My Account</a></span>
													<span><a href="#">My Wishlist</a></span>
													<span><a href="#">Sign In</a></span>
													<span><a href="#">Create An Account</a></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- Start Mobile Menu -->
			<div class="row d-none">
				<div class="col-lg-12 d-none">
					<nav class="mobilemenu__nav">
						<ul class="meninmenu">
							<li><a href="index.html">Home</a>
								<ul>
									<li><a href="index.html">Home Style Default</a></li>
									<li><a href="index-2.html">Home Style Two</a></li>
									<li><a href="index-3.html">Home Style Three</a></li>
									<li><a href="index-box.html">Home Box Style</a></li>
								</ul>
							</li>
							<li><a href="#">Pages</a>
								<ul>
									<li><a href="about.html">About Page</a></li>
									<li><a href="portfolio.html">Portfolio</a>
										<ul>
											<li><a href="portfolio.html">Portfolio</a></li>
											<li><a href="portfolio-three-column.html">Portfolio 3 Column</a></li>
											<li><a href="portfolio-details.html">Portfolio Details</a></li>
										</ul>
									</li>
									<li><a href="my-account.html">My Account</a></li>
									<li><a href="cart.html">Cart Page</a></li>
									<li><a href="checkout.html">Checkout Page</a></li>
									<li><a href="wishlist.html">Wishlist Page</a></li>
									<li><a href="error404.html">404 Page</a></li>
									<li><a href="faq.html">Faq Page</a></li>
									<li><a href="team.html">Team Page</a></li>
								</ul>
							</li>
							<li><a href="shop-grid.html">Shop</a>
								<ul>
									<li><a href="shop-grid.html">Shop Grid</a></li>
									<li><a href="shop-list.html">Shop List</a></li>
									<li><a href="shop-left-sidebar.html">Shop Left Sidebar</a></li>
									<li><a href="shop-right-sidebar.html">Shop Right Sidebar</a></li>
									<li><a href="shop-no-sidebar.html">Shop No sidebar</a></li>
									<li><a href="single-product.html">Single Product</a></li>
								</ul>
							</li>
							<li><a href="blog.html">Blog</a>
								<ul>
									<li><a href="blog.html">Blog Page</a></li>
									<li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
									<li><a href="blog-no-sidebar.html">Blog No Sidebar</a></li>
									<li><a href="blog-details.html">Blog Details</a></li>
								</ul>
							</li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- End Mobile Menu -->
			<div class="mobile-menu d-block d-lg-none">
			</div>
			<!-- Mobile Menu -->
		</div>
	</header>
	<!-- //Header -->
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
	<section class="my_account_area pt--80 pb--55">
		<div class="container-fluid " id="contentLogin">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-12 ">
					<div class="my__account__wrapper mt-4">
						<h3 class="account__title">Register</h3>
						<form:form method="post" class="border border-light p-3 rounded" id="formRegister" modelAttribute="customer">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="text-white" for="inputFirstName">First Name</label>
									<form:input type="text" path="firstName" class="form-control" id="inputFirstName"
												placeholder="First Name"/>
									<form:errors class="text-danger" path="firstName"/>
								</div>
								<div class="form-group col-md-6">
									<label class="text-white" for="inputLastName">Last Name</label>
									<form:input type="text" path="lastName" class="form-control" id="inputLastName"
												placeholder="Last Name"/>
									<form:errors class="text-danger" path="lastName"/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="text-white" for="inputEmail">Email</label>
									<form:input type="email" path="email" class="form-control" id="inputEmail" placeholder="Email"/>
									<form:errors class="text-danger" path="email"/>
									<span>${emailMsg}</span>
								</div>
								<div class="form-group col-md-6">
									<label class="text-white" for="inputPhone">Phone</label>
									<form:input type="tel" path="phone" name="phone" class="form-control" id="inputPhone"
												placeholder="Phone"/>
									<form:errors class="text-danger" path="phone"/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="text-white" for="inputPassword">Password</label>
									<form:input type="password" path="password" name="password" class="form-control" id="inputPassword" placeholder="Password"/>
									<form:errors class="text-danger" path="password"/>
								</div>
								<div class="form-group col-md-6">
									<label class="text-white" for="inputRePassword">Re Password</label>
									<input type="password" data-rule-equalTo="#inputRePassword" name="re-password" required class="form-control" id="inputRePassword"
										   placeholder="Re Password"/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-5">
									<label class="text-white" for="inputCity">State</label>
									<form:select path="address.state" id="inputCity" name="state" class="form-control">
										<option></option>
									</form:select>
									<form:errors class="text-danger" path="address.state"/>
								</div>
								<div class="form-group col-md-5">
									<label class="text-white" for="inputState">Distric</label>
									<form:select path="address.distric" id="inputState" name="distric" class="form-control">
									</form:select>
									<form:errors class="text-danger" path="address.distric"/>
								</div>
								<div class="form-group col-md-2">
									<label class="text-white" for="inputZip">Zip</label>
									<form:input path="address.zip" type="text" name="zip" class="form-control" id="inputZip"/>
									<form:errors class="text-danger" path="address.zip"/>
								</div>
							</div>
							<div class="form-group">
								<label class="text-white" for="inputAddress">Detail Address</label>
								<form:input type="text" path="address.addressDetail" class="form-control" name="addressDetail" id="inputAddress"
											placeholder="1234 Main St"/>
								<form:errors class="text-danger" path="address.addressDetail"/>
							</div>

							<button type="submit" class="btn btn-primary">Register</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End My Account Area -->
	<!-- Footer Area -->
	<footer id="wn__footer" class="footer__area bg__cat--8 brown--color">
		<div class="footer-static-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="footer__widget footer__menu">
							<div class="ft__logo">
								<a href="index.html">
									<img src="images/logo/3.png" alt="logo">
								</a>
								<p>There are many variations of passages of Lorem Ipsum available, but the majority
									have suffered duskam alteration variations of passages</p>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright__wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="copyright">
                            <div class="copy__right__inner text-left">
                                <p>Copyright <i class="fa fa-copyright"></i> <a href="#">Boighor.</a> All Rights
                                    Reserved</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
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
<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>

<script>
    $.get("https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/json/tinh.json", function (data) {
        $.each(JSON.parse(data), function (value, index) {
            $('#inputCity').append($('<option>').text(index.name))
        })
    });
</script>
<script>
    $('#inputCity').change(function () {
        $('#inputState').empty()
        $.get("https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/json/huyen.json", function (dataHuyen) {
            $.get("https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/json/tinh.json", function (dataTinh) {
                var jsonTinh = JSON.parse(dataTinh);
                var jsonHuyen = JSON.parse(dataHuyen);
                var tinh = jsonTinh.filter((a) => {
                    return a.name == $('#inputCity').val()
                });
                $.each(jsonHuyen, function (value, index) {
                    if (index.tinh_id == tinh["0"].id) {
                        $('#inputState').append($('<option>').text(index.name));
                    }
				})
			});
		});
	});

	$().ready(function() {
		$("#formRegister").validate({
			rules:{
				"re-password":{
					required: true,
					equalTo: "#inputPassword",
					minlength: 8,
					maxlength: 200
				},
				"password": {
					required: true,
					minlength: 8,
					maxlength: 200
				},
				"phone": {
					required: true,
					digits: true
				},
				"address.zip": {
					required: true,
					digits: true,
					minlength: 2,
					maxlength: 10
				},
				"firstName":{
					required: true,
					minlength: 2,
					maxlength: 80
				},
				"lastName":{
					required: true,
					minlength: 2,
					maxlength: 80
				},
				"email":{
					required: true,
					email: true,
					maxlength: 100
				},
				"address.state":{
					required: true
				},
				"address.distric":{
					required: true
				},
				"address.addressDetail":{
					required: true,
					minlength: 2,
					maxlength: 200
				}
			},
			messages:{
				"re-password":{
					equalTo: "No match password",
					minLength: "Min length is 8"
				}
			}
		})
	})
</script>
</body>

</html>
