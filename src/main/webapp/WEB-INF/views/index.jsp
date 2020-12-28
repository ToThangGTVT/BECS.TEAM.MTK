<%--
  Created by IntelliJ IDEA.
  User: dcm
  Date: 14/05/2020
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shop | Books Library eCommerce Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="${pageContext.request.getContextPath()}/resources/images/favicon.ico">
    <link rel="apple-touch-icon" href="${pageContext.request.getContextPath()}/resources/images/icon.png">

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/plugins.css">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/style.css">

    <!-- Custom css -->
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/Modal.css">
    <!-- Modernizer js -->
    <script src="${pageContext.request.getContextPath()}resources/js/vendor/modernizr-3.5.0.min.js"></script>
</head>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">

    <!-- Header -->
    <jsp:include page="customer/part/header.jsp"/>
    <!-- //Header -->

    <%--Modal report--%>
    <jsp:include page="customer/part/ModalReport.jsp"/>
    <%--End modal report--%>

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
    <div class="ht__bradcaump__area bg-image--5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Shop BÁN SÁCH</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="index.html">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Shop</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start Shop Page -->
    <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-12 order-2 order-lg-1 md-mt-40 sm-mt-40">
                    <div class="shop__sidebar">
                        <aside class="wedget__categories poroduct--cat">
                            <h3 class="wedget__title">Product Categories</h3>
                            <ul>
                                <li><a href="#">Biography <span>(3)</span></a></li>
                                <li><a href="#">Business <span>(4)</span></a></li>
                                <li><a href="#">Cookbooks <span>(6)</span></a></li>
                                <li><a href="#">Health & Fitness <span>(7)</span></a></li>
                                <li><a href="#">History <span>(8)</span></a></li>
                                <li><a href="#">Mystery <span>(9)</span></a></li>
                                <li><a href="#">Inspiration <span>(13)</span></a></li>
                                <li><a href="#">Romance <span>(20)</span></a></li>
                                <li><a href="#">Fiction/Fantasy <span>(22)</span></a></li>
                                <li><a href="#">Self-Improvement <span>(13)</span></a></li>
                                <li><a href="#">Humor Books <span>(17)</span></a></li>
                                <li><a href="#">Harry Potter <span>(20)</span></a></li>
                                <li><a href="#">Land of Stories <span>(34)</span></a></li>
                                <li><a href="#">Kids' Music <span>(60)</span></a></li>
                                <li><a href="#">Toys & Games <span>(3)</span></a></li>
                                <li><a href="#">hoodies <span>(3)</span></a></li>
                            </ul>
                        </aside>

                        <!-- tìm kiế mtheo giá -->
                        <!-- <aside class="wedget__categories pro--range">
                            <h3 class="wedget__title">Filter by price</h3>
                            <div class="content-shopby">
                                <div class="price_filter s-filter clear">
                                    <form action="#" method="GET">
                                        <div id="slider-range"></div>
                                        <div class="slider__range--output">
                                            <div class="price__output--wrap">
                                                <div class="price--output">
                                                    <span>Price :</span><input type="text" id="amount" readonly="">
                                                </div>
                                                <div class="price--filter">
                                                    <a href="#">Filter</a>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </aside> -->
                        <aside class="wedget__categories poroduct--tag">
                            <h3 class="wedget__title">Product Tags</h3>
                            <ul>
                                <li><a href="#">Biography</a></li>
                                <li><a href="#">Business</a></li>
                                <li><a href="#">Cookbooks</a></li>
                                <li><a href="#">Health & Fitness</a></li>
                                <li><a href="#">History</a></li>
                                <li><a href="#">Mystery</a></li>
                                <li><a href="#">Inspiration</a></li>
                                <li><a href="#">Religion</a></li>
                                <li><a href="#">Fiction</a></li>
                                <li><a href="#">Fantasy</a></li>
                                <li><a href="#">Music</a></li>
                                <li><a href="#">Toys</a></li>
                                <li><a href="#">Hoodies</a></li>
                            </ul>
                        </aside>
                        <aside class="wedget__categories sidebar--banner">
                            <img src="images/others/banner_left.jpg" alt="banner images">
                            <div class="text">
                                <h2>new products</h2>
                                <h6>save up to <br> <strong>40%</strong>off</h6>
                            </div>
                        </aside>
                    </div>
                </div>
                <div class="col-lg-9 col-12 order-1 order-lg-2">
                    <div class="row">
                        <div class="col-lg-12">
                            <div
                                    class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">

                                <p>Showing 1–12 of 40 results</p>
                                <div class="orderby__wrapper">
                                    <span>Sort By</span>
                                    <select class="shot__byselect">
                                        <option>Title</option>
                                        <option>Author</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab__container">
                        <div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">
                            <div class="row">
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/1.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/2.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALLER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4><a href="single-product.html">robin parrish</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$35.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart" data-item="1"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li> -->
                                                    <!-- compare -->
                                                    <!-- <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/3.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/4.jpg" alt="product image"></a>
                                        <div class="hot__box color--2">
                                            <span class="hot-label">HOT</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4><a href="single-product.html">The Remainng</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$35.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/7.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/8.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">HOT</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4><a href="single-product.html">Lando</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$35.00</li>
                                            <li class="old_prize">$50.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- Wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/9.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/10.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">HOT</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4><a href="single-product.html">Doctor Wldo</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$35.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/11.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/2.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4><a href="single-product.html">Animals Life</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$50.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/1.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/6.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4><a href="single-product.html">War Of Dragon</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$50.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/3.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/8.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4><a href="single-product.html">Soad Humber</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$50.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/10.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/2.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4><a href="single-product.html">Animals Life</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$50.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/7.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/3.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4><a href="single-product.html">Olio Madu</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$50.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- Wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/1.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/5.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4><a href="single-product.html">War Of Dragon</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$50.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/9.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/4.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4><a href="single-product.html">New Wear</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$50.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="single-product.html"><img
                                                src="images/books/5.jpg" alt="product image"></a>
                                        <a class="second__img animation1" href="single-product.html"><img
                                                src="images/books/8.jpg" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4><a href="single-product.html">Our Wear</a></h4>
                                        <ul class="prize d-flex">
                                            <li>$50.00</li>
                                            <li class="old_prize">$35.00</li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="addTo cart"><i
                                                            class="bi bi-shopping-bag4"></i></a></li>
                                                    <!-- wishlist compare -->
                                                    <!-- <li><a class="wishlist" href="wishlist.html"><i
                                                                class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="compare" href="#"><i
                                                                class="bi bi-heart-beat"></i></a></li> -->
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="bi bi-search"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <br>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                            </div>
                            <ul class="wn__pagination">
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- End Shop Page -->

<!-- footter -->
<jsp:include page="customer/part/footer.jsp"/>
<!-- footter -->
</div>
<!-- //Main wrapper -->

<!-- JS Files -->
<script src="${pageContext.request.getContextPath()}/resources/js/vendor/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.getContextPath()}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.getContextPath()}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.getContextPath()}/resources/js/plugins.js"></script>
<script src="${pageContext.request.getContextPath()}/resources/js/active.js"></script>
<script src="${pageContext.request.getContextPath()}/resources/js/myJavascript.js"></script>
<script>

    $(document).ready(function () {
        checkReport('${error}', '${success}')
        $(".addTo.cart").click(function () {
            console.log("dsa")
            // addToCart($(this));
        })
    })

</script>
</body>

</html>
