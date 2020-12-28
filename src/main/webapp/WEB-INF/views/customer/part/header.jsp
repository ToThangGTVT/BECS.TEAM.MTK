<%--
  Created by IntelliJ IDEA.
  User: dcm
  Date: 14/05/2020
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="wn__header" class="oth-page header__area header__absolute sticky__header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-7 col-lg-2">
                <div class="logo">
                    <a href="<%=request.getContextPath()%>">
                        <img src="<%=request.getContextPath()%>/resources/images/logo/logo.png" alt="logo images">
                    </a>
                </div>
            </div>
            <div class="col-lg-8 d-none d-lg-block">
                <nav class="mainmenu__nav">
                    <ul class="meninmenu d-flex justify-content-start">
                        <li class="drop with--one--item"><a href="<%=request.getContextPath()%>">Home</a>
<%--                            <div class="megamenu dropdown">--%>
<%--                                <ul class="item item01">--%>
<%--                                    <li><a href="/">Home Style Default</a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-8 col-sm-8 col-5 col-lg-2">
                <ul class="header__sidebar__right d-flex justify-content-end align-items-center">
                    <li class="shop_search">
                        <!-- <a class="search__active" href="#"></a> -->
                        <form class="form-inline my-2 my-lg-0" method="get" action="<%=request.getContextPath()%>/search" style="display: contents;">
                            <input class="form-control mr-sm-2" type="search" name="title" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </li>
                    <li class="wishlist"></li>
                    <li class="shopcart"><a class="cartbox_active" href="#"><span
                            class="product_qun">${sessionScope.cartItem.size()}</span></a>
                        <!-- Start Shopping Cart -->
                        <div class="block-minicart minicart__active">
                            <div class="minicart-content-wrapper">
                                <div class="micart__close">
                                    <span>close</span>
                                </div>
                                <c:forEach var="item" items="${sessionScope.cartItem}">
                                    <c:set var="calculatTotalPrice"
                                           value="${calculatTotalPrice=calculatTotalPrice+item.priceTotal}"/>
                                    <c:set var="itemQuantity" value="${itemQuantity=itemQuantity+item.quantityBuy}"/>
                                </c:forEach>
                                <div class="items-total d-flex justify-content-between">
                                    <span>${itemQuantity} Items</span>
                                    <span>Cart Subtotal</span>
                                </div>
                                <div class="total_amount text-right">
                                    <span>$${calculatTotalPrice}</span>
                                </div>
                                <div class="mini_action checkout mt-0">
                                    <a class="checkout__btn" href="${pageContext.request.getContextPath()}/checkout">Go
                                        to Checkout</a>
                                </div>
                                <div class="single__items" style="height: 250px">


                                    <div class="miniproduct">
                                        <c:forEach var="item" items="${sessionScope.cartItem}">
                                            <div class="item01 d-flex mt--20">
                                                <div class="col-3">
                                                    <a href="product-details.html"><img
                                                            src="<%=request.getContextPath()%>/resources/upload/${item.image}"
                                                            alt="product images"></a>
                                                </div>
                                                <div class="col-7">
                                                    <div class="product_prize d-flex justify-content-between"
                                                         style="font-weight: 600;font-size: large;"><a
                                                            href="product-details.html">${item.title}</a></div>
                                                    <div class="product_prize d-flex justify-content-between">
                                                        $${item.priceTotal}</div>
                                                    <div class="product_prize d-flex justify-content-between">
                                                        <span class="qun">Qty: ${item.quantityBuy}</span>

                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <ul class="d-flex justify-content-end mt-3">
                                                        <li><a data-item-id="${item.id}" class="btnDeleteCart"><i
                                                                style="font-size: xx-large"
                                                                class="zmdi zmdi-delete"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="mini_action cart">
                                    <a class="cart__btn" href="${pageContext.request.getContextPath()}/cart/cartDetail">View and edit cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- End Shopping Cart -->
                    </li>
                    <li class="setting__bar__icon"><a class="setting__active" href="#"></a>
                        <div class="searchbar__content setting__block pt-2">
                            <div class="content-inner p-0 pb-1 pr-1">
                                <div class="switcher-currency">
                                    <strong class="label switcher-label">
                                        <span>My Account</span>
                                    </strong>
                                    <div class="switcher-options">
                                        <div class="switcher-currency-trigger">
                                            <div class="setting__menu">
                                                <c:choose>
                                                    <c:when test="${sessionScope.cusInfor!=null}">
                                                        <span><a href="${pageContext.request.getContextPath()}/cart/cartDetail">My Cart</a></span>
                                                        <span><a href="${pageContext.request.getContextPath()}/logout">Log Out</a></span>
                                                    </c:when>
                                                    <c:when test="${sessionScope.cusInfor==null}">
                                                        <span><a href="${pageContext.request.getContextPath()}/cart/cartDetail">My Cart</a></span>
                                                        <span><a href="${pageContext.request.getContextPath()}/register">Register</a></span>
                                                        <span><a href="${pageContext.request.getContextPath()}/login">Log in</a></span>
                                                    </c:when>
                                                </c:choose>

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
