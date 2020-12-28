<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Checkout | Books Library eCommerce Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="resources/images/favicon.ico">
    <link rel="apple-touch-icon" href="resources/images/icon.png">

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
			color: #ff0000!important;
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
    <jsp:include page="part/header.jsp"></jsp:include>
		<!-- //Header -->

		<!-- Start Bradcaump area -->
		<div class="ht__bradcaump__area bg-image--4">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="bradcaump__inner text-center">
							<h2 class="bradcaump-title">Checkout</h2>
							<nav class="bradcaump-content">
								<a class="breadcrumb_item" href="index.html">Home</a>
								<span class="brd-separetor">/</span>
								<span class="breadcrumb_item active">Checkout</span>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Bradcaump area -->
		<!-- Start Checkout Area -->
		<section class="wn__checkout__area section-padding--lg bg__white">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="wn_checkout_wrap">
							<!-- <div class="checkout_info">
								<span>Returning customer ?</span>
								<a class="showlogin" href="#">Click here to login</a>
							</div> -->
							<div class="checkout_login">
								<form class="wn__checkout__form" action="#">
									<p>If you have shopped with us before, please enter your details in the boxes below.
										If you are a new customer please proceed to the Billing & Shipping section.</p>

									<div class="input__box">
										<label>Username or email <span>*</span></label>
										<input type="text">
									</div>

									<div class="input__box">
										<label>password <span>*</span></label>
										<input type="password">
									</div>
									<div class="form__btn">
										<button>Login</button>
										<label class="label-for-checkbox">
											<input id="rememberme" name="rememberme" value="forever" type="checkbox">
											<span>Remember me</span>
										</label>
										<a href="#">Lost your password?</a>
									</div>
								</form>
							</div>
							<div class="checkout_coupon">
								<form action="#">
									<div class="form__coupon">
										<input type="text" placeholder="Coupon code">
										<button>Apply coupon</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div id="rowInfo" class="row">
					<div class="col-lg-6 col-12">
						<div class="customer_details">
							<h3>Billing details</h3>
							<form id="formRegister" class="customar__field">
								<div class="margin_between">
									<input type="hidden" id="id-idCus" value="${customer.id}">
									<div class="input_box space_between">
										<label>First name <span>*</span></label>
										<input type="text" name="firstName" id="cus-fisrtName" value="${customer.firstName}">
									</div>
									<div class="input_box space_between">
										<label>last name <span>*</span></label>
										<input type="text" name="lastName" id="cus-lastName" value="${customer.lastName}">
									</div>
								</div>
								<div class="margin_between">
									<div class="input_box space_between">
										<label>Phone <span>*</span></label>
										<input type="text" name="phone" id="cus-phone" value="${customer.phone}">
									</div>

									<div class="input_box space_between">
										<label>Email address <span>*</span></label>
										<input type="email" name="email" id="cus-email" value="${customer.email}">
									</div>
								</div>

								<div class="input_box">
									<label>Province<span>*</span></label>
									<select id="inputCity" class="select__option">
										<option>${customer.address.distric}</option>
									</select>
								</div>

								<div class="input_box">
									<label>State<span>*</span></label>
									<select id="inputState" class="select__option">
                                        <option>${customer.address.state}</option>
									</select>
								</div>

								<div class="input_box">
									<label>Address Detail<span>*</span></label>
									<input type="text" id="address-detail" placeholder="Address Detail" value="${customer.address.addressDetail}">
								</div>
								<div class="input_box">
									<label>Postcode / ZIP <span>*</span></label>
									<input type="text" name="address.zip" value="${customer.address.zip}" id="cus-zip">
								</div>
							</form>
						</div>
					</div>
					<div class="col-lg-6 col-12 md-mt-40 sm-mt-40">
						<div class="wn__order__box">
							<h3 class="onder__title">Your order</h3>
							<ul class="order__total">
								<li>Product</li>
								<li>Total</li>
							</ul>
							<ul class="order_product">
								<c:forEach var="cart" items="${bookList}">
									<li>${cart.title} × ${cart.quantityBuy}<span>${cart.priceBook*cart.quantityBuy}</span></li>
								</c:forEach>
							</ul>
							<ul class="shipping__method">
								<c:if test="${promotion.code == null}">
									<li id="promotion">Coupon <span>0 %</span></li>
								</c:if>
								<c:if test="${promotion.code != null}">
									<li id="promotion" data-code-promotion="${promotion.code}">Coupon <span>${promotion.discount} %</span></li>
								</c:if>
							</ul>
							<ul class="total__amount">
								<li>Order Total <span>${totalPrice}</span></li>
								<li>
									<div>
										<button type="button" id="btn-purchase" class="btn btn-success mb-3">Purchase</button>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
            </div>

			<!-- Modal success -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Susses</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							Please return to home page to continue
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal success -->
			<div class="modal fade" id="myModalError" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabelError">Error</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							Please check your information
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

		</section>
		<!-- End Checkout Area -->
		<!-- Footer Area -->
		<footer id="wn__footer" class="footer__area bg__cat--8 brown--color">
			<div class="footer-static-top">
				<div class="container">fom
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
<script src="resources/js/vendor/jquery-3.2.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<%--	<script src="resources/js/bootstrap.min.js"></script>--%>
<script src="resources/js/plugins.js"></script>
<script src="resources/js/active.js"></script>
<script src="resources/js/myJavascript.js"></script>
<script src="resources/js/bootstrap.min.js"
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
	</script>

	<script>
		$('#btn-purchase').click(function (e) {

			if ($('#cus-fisrtName').val()==="" || $('#cus-fisrtName').val().length > 50){
				e.preventDefault();
			}

			if ($('#cus-lastName').val()==="" || $('#cus-lastName').val().length > 50){
				e.preventDefault();
			}

			var firstName = $('#cus-fisrtName').val()
			var lastName = $('#cus-lastName').val()
			var email = $('#cus-email').val()
			var phone = $('#cus-phone').val()
			var cusId = $('#id-idCus').val();
			var state = $('#inputState').val();
			var zip = $('#cus-zip').val();
			var addressDetail = $('#address-detail').val();
			var distric = $('#inputCity').val();
			var codePromotion = $('#promotion').data('code-promotion')
			$.ajax({
				type: 'POST',
				url: 'checkout',
				data: {
					firstName: firstName,
					lastName: lastName,
					email: email,
					phone: phone,
					customerId: cusId,
					state: state,
					zip: zip,
					distric: distric,
					addressDetail: addressDetail,
					codePromotion: codePromotion
				},
				success: function () {
					$('#myModal').modal('show')
				},
				error: function () {
					$('#myModalError').modal('show')
				}
			})
		})

		$('#myModal').on('hidden.bs.modal', function (e) {
			window.location.href = "<%=request.getContextPath()%>/"
		})

		$().ready(function() {
			$("#formRegister").validate({
				rules:{
					"re-password":{
						required: true,
						equalTo: "#password",
						minlength: 8,
						maxlength: 15
					},
					"password": {
						required: true,
						minlength: 8,
						maxlength: 15
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
                success:{

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
