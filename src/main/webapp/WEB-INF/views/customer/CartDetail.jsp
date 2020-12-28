<%--
  Created by IntelliJ IDEA.
  User: dcm
  Date: 17/05/2020
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shopping Cart | Books Library eCommerce Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/icon.png">


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
    <jsp:include page="part/header.jsp"/>
    <!-- //Header -->

    <%-- Start Modal--%>
    <jsp:include page="part/ModalReport.jsp"/>
    <%-- End Modal--%>
    <!-- Start Search Popup -->
    <div class="box-search-content search_active block-bg close__top">
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
    </div>
    <!-- End Search Popup -->
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--3">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Shopping Cart</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Shopping Cart</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- cart-main-area start -->
    <div class="cart-main-area section-padding--lg bg--white">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 ol-lg-12">
                    <form action="#">
                        <div class="table-content wnro__table table-responsive">
                            <table id="tableCartDetail">
                                <thead>
                                <tr class="title-top">
                                    <th class="product-thumbnail">Image</th>
                                    <th class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="totalPrice" value="0"/>
                                <c:forEach items="${listCart}" var="cart">
                                    <c:set var="totalPrice" value="${totalPrice=totalPrice+cart.priceTotal}"></c:set>
                                    <tr>
                                        <td class="product-thumbnail"><a href="#"><img
                                                src="<%=request.getContextPath()%>/resources/upload/${cart.image}" alt="product img"></a></td>
                                        <td class="product-name"><a href="#">${cart.title}</a></td>
                                        <td class="product-price"><span class="amount">$${cart.priceBook}</span></td>
                                        <td class="product-quantity">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-primary btn-decrease" data-btn-type="decrease"> - </button>
                                                <input data-preVal="${cart.quantityBuy}" type="text" name="${cart.id}" data-item-id="${cart.id}" pattern="[1-9][0-9]+"  class="btn btn-default input-quantity" value="${cart.quantityBuy}">
                                                <button type="button" class="btn btn-primary btn-increase" data-btn-type="increase">+</button>
                                            </div>

                                        </td>
                                        <td class="product-subtotal">$${cart.priceTotal}</td>
                                        <td class="product-remove"><a class="iconDelete" data-item-id="${cart.id}">X</a></td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </form>

                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 offset-lg-6">
                    <div class="cartbox__total__area">
                        <div class="cartbox-total d-flex justify-content-between">
                            <ul class="cart__total__list">
                                <li>Cart total</li>
                                <li>Sub Total</li>
                            </ul>
                            <ul class="cart__total__tk">
                                <li>$${totalPrice}</li>
                                <li>$${totalPrice}</li>
                            </ul>
                        </div>

                        <form action="${pageContext.request.getContextPath()}/checkout" method="get">
                            <div class="cart__total__amount">
                                <div class="input-group mb-2 mt-3">
                                    <input type="text" name="coulpon" class="form-control" placeholder="Input Coulpon">
                                    <button class="btn btn-dark" id="checkCoulpon" type="button">Coulpon</button>
                                </div>
                            </div>

                            <div class="cart__total__amount">
                                <span>Grand Total</span>
                                <span>${totalPrice}</span>
                            </div>
                            <div class="cart__total__amount">
                                <button class="btn btn-dark mb-2" type="submit">CheckOut</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- cart-main-area end -->
    <!-- Footer Area -->
    <jsp:include page="part/footer.jsp"/>
    <!-- //Footer Area -->

</div>
<!-- //Main wrapper -->

<%--<!-- JS Files -->--%>
<%--<script src="${pageContext.request.getContextPath()}/resources/js/vendor/jquery-3.2.1.min.js"></script>--%>
<%--<script src="${pageContext.request.getContextPath()}/resources/js/popper.min.js"></script>--%>
<%--<script src="${pageContext.request.getContextPath()}/resources/js/bootstrap.min.js"></script>--%>
<%--<script src="${pageContext.request.getContextPath()}/resources/js/plugins.js"></script>--%>
<%--<script src="${pageContext.request.getContextPath()}/resources/js/active.js"></script>--%>
<%--<script src="${pageContext.request.getContextPath()}/resources/js/myJavascript.js"></script>--%>
<%--<script src="${pageContext.request.getContextPath()}/resources/js/CartDetail.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>--%>


<!-- JS Files -->
<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
<%--	<script src="resources/js/bootstrap.min.js"></script>--%>
<script src="<%=request.getContextPath()%>/resources/js/plugins.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/active.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/myJavascript.js"></script>
<script src="${pageContext.request.getContextPath()}/resources/js/CartDetail.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<%--	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>--%>


<script>
    $(document).ready(function () {
        $(document).on("click", "div.btn-group button", function () {
            buttonChangeQuantity($(this));
        });
        $("#checkCoulpon").click(function () {
            checkCoulpon();
        })
        $(document).on("change", ".input-quantity", function (event) {
            console.log("dsad");
            inputNumberQuantity($(event.target));
        });
        $(document).on("click", ".iconDelete", function (event) {
            deleteCartInCartDetail($(event.target).attr("data-item-id"));
        });

    });

</script>
</body>

</html>
