<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shop | Books Library eCommerce Store</title>
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
    <jsp:include page="part/header.jsp"></jsp:include>

    <script>
        const urlParams = new URLSearchParams(window.location.search);
        const myParam = urlParams.get('myParam');
        console.log(myParam)
    </script>


    <!-- //Header -->
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
                        <h2 class="bradcaump-title">Shop</h2>
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

                <%--CATEGORY TAB--%>
                <div class="col-md-3">
                    <div class="shop__sidebar">
                        <aside class="wedget__categories poroduct--cat">
                            <h3 class="wedget__title">Product Categories</h3>
                            <ul>
                                <c:forEach var="category" items="${categoryList}">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/category/${category.category.name}-${category.category.id}">${category.category.name}<span>(${category.count})</span></a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </aside>
                        </aside>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="container">
                        <div class="row">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-all-tab" data-toggle="tab" href="#nav-all"
                                       role="tab" aria-controls="nav-all" aria-selected="true"><b>All</b> (${countBookSearchAll})</a>
                                    <a class="nav-item nav-link" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab"
                                       aria-controls="nav-home" aria-selected="false"><b>Title</b> (${countBookSearchTitle})</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                                       role="tab" aria-controls="nav-profile" aria-selected="false"><b>Author</b> (${countBookSearchAuthor})</a>
                                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
                                       role="tab" aria-controls="nav-contact" aria-selected="false"><b>Publisher</b> (${countBookSearchPublisher})</a>
                                </div>
                                <hr style="width: 825px;">
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-all" role="tabpanel"
                                     aria-labelledby="nav-all-tab">
                                    <%--BEGIN TAB SEARCH ALL--%>
                                    <div class="row">
                                        <c:if test="${bookListAll.size()>0}">
                                            <div class="col-lg-12">
                                                <div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
                                                    <p>Showing 1–${bookListAll.size()} of ${countBookSearchAll} results</p>
                                                    <div class="orderby__wrapper">
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="tab__container flex-wrap">
                                        <c:if test="${bookListAll.size()<=0}">
                                            <div class="alert alert-warning mt--90 mr--50" style="margin-left: 300px;" role="alert">
                                                No result for "${param['title']}"
                                            </div>
                                        </c:if>
                                        <c:if test="${bookListAll.size()>0}">
                                            <div class="shop-grid tab-pane fade show active" id="nav-grid-publisher"
                                                 role="tabpanel">
                                                <div class="row">
                                                    <!-- Start Single Product -->
                                                    <c:forEach var="book" items="${bookListAll}">
                                                        <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                                            <div class="product__thumb" style="max-height: 250px; height: 250px">
                                                                <a class="first__img"><img
                                                                        src="<%=request.getContextPath()%>/resources/upload/${book.image}"
                                                                        style="width: 530px"
                                                                        alt="resources/images/404img.png"></a>
                                                            </div>
                                                            <div class="product__content content--center">
                                                                <h4><a href="single-product.html">${book.title}</a></h4>
                                                                <ul class="prize d-flex">
                                                                    <li>${book.price}$</li>
                                                                </ul>
                                                                <div class="action">
                                                                    <div class="actions_inner">
                                                                        <ul class="add_to_links">
                                                                            <li><a class="addTo cart" data-item="${book.id}"><i
                                                                                    class="bi bi-shopping-bag4"></i></a></li>
                                                                            <li><a id="btn-book-detail" data-whatever="${book.id}"
                                                                                   data-toggle="modal"
                                                                                   data-target=".bd-example-modal-lg" title="Quick View"
                                                                                   class="quickview modal-view detail-link"
                                                                            ><i class="bi bi-search"></i></a>
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
                                                    </c:forEach>
                                                    <!-- End Single Product -->
                                                </div>

                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <c:if test="${pageNum > 0}">
                                                            <li class="page-item text-success"><a class="page-link"
                                                                                                  href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageAll=1">First</a></li>
                                                        </c:if>
                                                        <c:if test="${pageNum < countBookSearchAll/12+1}">
                                                            <li class="page-item disabled"><a class="page-link"
                                                                                              href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageAll=${pageNum}">${pageNum}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum + 1 < countBookSearchAll/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageAll=${pageNum+1}">${pageNum+1}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum+2 < countBookSearchAll/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageAll=${pageNum+2}">${pageNum+2}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum+3 < countBookSearchAll/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageAll=${pageNum+3}">${pageNum+3}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum > 0}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageAll=<fmt:formatNumber value="${countBookSearchAll/12+1}" type="number" pattern="#"/>">End</a>
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </nav>

                                            </div>
                                        </c:if>

                                    </div>
                                    <%--end content search title--%>
                                    <%--END TAB SEARCH ALL--%>
                                </div>
                                <div class="tab-pane fade" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                    <%--BEGIN TAB SEARCH TITLE--%>
                                    <div class="row">
                                        <c:if test="${bookListTitle.size()>0}">
                                            <div class="col-lg-12">
                                                <div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
                                                    <p>Showing 1–${bookListTitle.size()} of ${countBook} results</p>
                                                    <div class="orderby__wrapper">

                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="tab__container flex-wrap">
                                        <c:if test="${bookListTitle.size()<=0}">
                                            <div class="alert alert-warning mt--90 mr--50" style="margin-left: 300px;" role="alert">
                                                No result for "${param['title']}"
                                            </div>
                                        </c:if>
                                        <c:if test="${bookListTitle.size()>0}">
                                            <div class="shop-grid tab-pane fade show active" id="nav-grid-all"
                                                 role="tabpanel">
                                                <div class="row">
                                                    <!-- Start Single Product -->
                                                    <c:forEach var="book" items="${bookListTitle}">
                                                        <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                                            <div class="product__thumb" style="max-height: 250px; height: 250px">
                                                                <a class="first__img"><img
                                                                        src="<%=request.getContextPath()%>/resources/upload/${book.image}"
                                                                        style="width: 530px"
                                                                        alt="resources/images/404img.png"></a>
                                                            </div>
                                                            <div class="product__content content--center">
                                                                <h4><a>${book.title}</a></h4>
                                                                <c:if test="${book.quantity<=0}">
                                                                    <h4><span class="text-danger">OUT OF STOKE</span></h4>
                                                                </c:if>
                                                                <ul class="prize d-flex">
                                                                    <li>${book.price}</li>
                                                                </ul>
                                                                <div class="action">
                                                                    <div class="actions_inner">
                                                                        <ul class="add_to_links">
                                                                            <li><a class="cart"><i
                                                                                    class="bi bi-shopping-bag4"></i></a></li>
                                                                            <li><a data-toggle="modal" data-whatever="${book.id}" data-toggle="modal" data-target=".bd-example-modal-lg" title="Quick View"
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
                                                    </c:forEach>
                                                    <!-- End Single Product -->
                                                </div>

                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <c:if test="${pageNum > 0}">
                                                            <li class="page-item text-success"><a class="page-link"
                                                                                                  href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageTitle=1">First</a></li>
                                                        </c:if>
                                                        <c:if test="${pageNum < countBookSearchAll/12+1}">
                                                            <li class="page-item disabled"><a class="page-link"
                                                                                              href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageTitle=${pageNum}">${pageNum}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum + 1 < countBookSearchAll/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageTitle=${pageNum+1}">${pageNum+1}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum+2 < countBookSearchAll/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageTitle=${pageNum+2}">${pageNum+2}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum+3 < countBookSearchAll/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageTitle=${pageNum+3}">${pageNum+3}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum > 0}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pageTitle=<fmt:formatNumber value="${countBookSearchAll/12+1}" type="number" pattern="#"/>">End</a>
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </c:if>
                                    </div>

                                    <%--END TAB SEARCH TITLE--%>
                                </div>
                                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                    <%--BEGIN TAB SEARCH AUTHOR--%>
                                    <div class="row">
                                        <c:if test="${bookListAuthor.size()>0}">
                                            <div class="col-lg-12">
                                                <div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
                                                    <p>Showing 1–${bookListAuthor.size()} of ${countBook} results</p>
                                                    <div class="orderby__wrapper">

                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="tab__container flex-wrap">
                                        <c:if test="${bookListAuthor.size()<=0}">
                                            <div class="alert alert-warning mt--90 mr--50" style="margin-left: 300px;" role="alert">
                                                No result for "${param['title']}"
                                            </div>
                                        </c:if>

                                        <c:if test="${bookListAuthor.size()>0}">
                                            <div class="shop-grid tab-pane fade show active" id="nav-grid-title"
                                                 role="tabpanel">
                                                <div class="row">
                                                    <!-- Start Single Product -->
                                                    <c:forEach var="book" items="${bookListAuthor}">
                                                        <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                                            <div class="product__thumb" style="max-height: 250px; height: 250px">
                                                                <a class="first__img"><img
                                                                        src="<%=request.getContextPath()%>/resources/upload/${book.image}"
                                                                        style="width: 530px"
                                                                        alt="resources/images/404img.png"></a>
                                                            </div>
                                                            <div class="product__content content--center">
                                                                <h4><a>${book.title}</a></h4>
                                                                <c:if test="${book.quantity<=0}">
                                                                    <h4><span class="text-danger">OUT OF STOKE</span></h4>
                                                                </c:if>
                                                                <ul class="prize d-flex">
                                                                    <li>${book.price}</li>
                                                                </ul>
                                                                <div class="action">
                                                                    <div class="actions_inner">
                                                                        <ul class="add_to_links">
                                                                            <li><a class="cart"><i
                                                                                    class="bi bi-shopping-bag4"></i></a></li>
                                                                            <li><a data-toggle="modal" data-whatever="${book.id}" data-toggle="modal" data-target=".bd-example-modal-lg" title="Quick View"
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
                                                    </c:forEach>
                                                    <!-- End Single Product -->
                                                </div>

                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <c:if test="${pageNum > 0}">
                                                            <li class="page-item text-success"><a class="page-link" href="?pageAuthor=1">First</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum + 1 < countBookSearchAuthor/12+1}">
                                                            <li class="page-item disabled"><a class="page-link"
                                                                                              href="?pageAuthor=${pageNum}">${pageNum}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum + 1 < countBookSearchAuthor/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="?pageAuthor=${pageNum+1}">${pageNum+1}</a></li>
                                                        </c:if>
                                                        <c:if test="${pageNum+2 < countBookSearchAuthor/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="?pageAuthor=${pageNum+2}">${pageNum+2}</a></li>
                                                        </c:if>
                                                        <c:if test="${pageNum+3 < countBookSearchAuthor/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="?pageAuthor=${pageNum+3}">${pageNum+3}</a></li>
                                                        </c:if>
                                                        <c:if test="${pageNum > 0}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="?pageAuthor=<fmt:formatNumber value="${countBookSearchAuthor/12+1}" type="number" pattern="#"/>">End</a>
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </c:if>
                                    </div>

                                    <%--END TAB SEARCH AUTHOR--%>
                                </div>
                                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                    <%--BEGIN TAB SEARCH PUBLISHER--%>
                                    <div class="row">
                                        <c:if test="${bookListPublisher.size()>0}">
                                            <div class="col-lg-12">
                                                <div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
                                                    <p>Showing 1–${bookListPublisher.size()} of ${countBookSearchPublisher} results</p>
                                                    <div class="orderby__wrapper">

                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="tab__container">
                                        <c:if test="${bookListPublisher.size()<=0}">
                                            <div class="alert alert-warning mt--90 mr--50" style="margin-left: 300px;" role="alert">
                                                No result for "${param['title']}"
                                            </div>
                                        </c:if>
                                        <c:if test="${bookListPublisher.size()>0}">
                                            <div class="shop-grid tab-pane fade show active" id="nav-grid-author"
                                                 role="tabpanel">
                                                <div class="row">
                                                    <!-- Start Single Product -->
                                                    <c:forEach var="book" items="${bookListPublisher}">
                                                        <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                                            <div class="product__thumb" style="max-height: 250px; height: 250px">
                                                                <a class="first__img"><img
                                                                        src="<%=request.getContextPath()%>/resources/upload/${book.image}"
                                                                        style="width: 530px"
                                                                        alt="resources/images/404img.png"></a>
                                                            </div>
                                                            <div class="product__content content--center">
                                                                <h4><a>${book.title}</a></h4>
                                                                <c:if test="${book.quantity<=0}">
                                                                    <h4><span class="text-danger">OUT OF STOKE</span></h4>
                                                                </c:if>
                                                                <ul class="prize d-flex">
                                                                    <li>${book.price}</li>
                                                                </ul>
                                                                <div class="action">
                                                                    <div class="actions_inner">
                                                                        <ul class="add_to_links">
                                                                            <li><a class="cart"><i
                                                                                    class="bi bi-shopping-bag4"></i></a></li>
                                                                            <li><a data-toggle="modal" data-whatever="${book.id}" data-toggle="modal" data-target=".bd-example-modal-lg" title="Quick View"
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
                                                    </c:forEach>
                                                    <!-- End Single Product -->
                                                </div>

                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <c:if test="${pageNum > 0}">
                                                            <li class="page-item text-success"><a class="page-link"
                                                                                                  href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pagePublisher=1">First</a></li>
                                                        </c:if>
                                                        <c:if test="${pageNum < countBookSearchAll/12+1}">
                                                            <li class="page-item disabled"><a class="page-link"
                                                                                              href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pagePublisher=${pageNum}">${pageNum}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum + 1 < countBookSearchAll/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pagePublisher=${pageNum+1}">${pageNum+1}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum+2 < countBookSearchAll/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pagePublisher=${pageNum+2}">${pageNum+2}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum+3 < countBookSearchAll/12+1}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pagePublisher=${pageNum+3}">${pageNum+3}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageNum > 0}">
                                                            <li class="page-item"><a class="page-link"
                                                                                     href="${requestScope['javax.servlet.forward.request_uri']}?title=${qSearch}&pagePublisher=<fmt:formatNumber value="${countBookSearchAll/12+1}" type="number" pattern="#"/>">End</a>
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </c:if>
                                    </div>
                                    <%--END TAB SEARCH PUBLISHER--%>
                                </div>
                            </div>
                        </div>
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
<jsp:include page="part/footer.jsp"/>
<!-- footter -->
<div class="modal fade bd-example-modal-lg" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="row p-4">
                <div class="col-4">
                    <div class="product__thumb">
                        <a class="first__img">
                            <img id="imageModal">
                        </a>
                    </div>
                </div>
                <div class="col-8" style="padding-left: 60px" ;>
                    <div>
                        <div class="product__info__main">

                            <div class="row mb-3">
                                <div class="col-3">
                                    <span class="posted_in">Title: </span>
                                </div>
                                <div class="col-9">
                                    <span class="posted_in" id="id-title-book"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-3">
                                    <span class="posted_in">Price: </span>
                                </div>
                                <div class="col-9">
                                    <span class="posted_in" id="id-price-book"></span>
                                    <span class="posted_in"> $</span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-3">
                                    <span class="posted_in">Description: </span>
                                </div>
                                <div class="col-9">
                                    <span class="posted_in" id="id-description-book"></span>
                                </div>
                            </div>

                            <div class="box-tocart d-flex mt-4">
                                <span>Quantity</span>
                                <input id="qty" class="input-text qty" name="qty" min="1" value="1" title="Qty"
                                       type="number">
                                <div class="addtocart__actions">
                                    <button class="tocart" type="submit" title="Add to Cart">Add to
                                        Cart
                                    </button>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-3">
                                    <span class="posted_in">Categories: </span>
                                </div>
                                <div class="col-9">
                                    <span class="posted_in" id="id-category-book"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-3">
                                    <span class="posted_in">Publisher: </span>
                                </div>
                                <div class="col-9">
                                    <span class="posted_in" id="id-publisher-book"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-3">
                                    <span class="posted_in">Author: </span>
                                </div>
                                <div class="col-9">
                                    <span class="posted_in" id="id-author-book"></span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
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
        if (document.location.toString().match('pageAll') != null) {
            $('#nav-all-tab').click();
        } else if (document.location.toString().match('pageTitle') != null) {
            $('#nav-home-tab').click();
        } else if (document.location.toString().match('pageAuthor') != null) {
            $('#nav-profile-tab').click();
        } else if (document.location.toString().match('pagePublisher') != null) {
            $('#nav-contact-tab').click();
        }
    })
</script>
<script>
    $('#myModal').on("show.bs.modal", function (e) {
        const button = $(e.relatedTarget);
        const recipient = button.data('whatever');
        const content = this
        console.log(this)
        $.getJSON({
            type: "POST",
            url: "api/info/book",
            data: {
                id: recipient
            },
            success: function(result) {
                $('#id-price-book').html(result.price)
                $('#id-title-book').html(result.title)
                $('#id-description-book').html(result.description)
                $('#id-category-book').html(result.category.name)
                $('#id-publisher-book').html(result.publisher)
                $('#id-author-book').html(result.author)
                $('#imageModal').attr('src', "<%=request.getContextPath()%>/resources/upload/" + result.imageView)
            },
        })

    });
</script>
</body>

</html>
