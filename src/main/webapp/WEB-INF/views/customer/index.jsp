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
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->

	<!-- Main wrapper -->
	<div class="wrapper" id="wrapper">
		<!-- Header -->
		<jsp:include page="part/header.jsp"></jsp:include>
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
							<h2 class="bradcaump-title">Shop Bán sách sịn sò con bò</h2>
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

        <%--toash--%>
        <div class="toast" id="toastComponent" data-type-toast="" data-delay="1500">
            <div class="toast-header">
                Toast Header
            </div>
            <div class="toast-body">
                Some text inside the toast body
            </div>
        </div>
        <%--end toash--%>

		<!-- Start Shop Page -->
		<div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-12 order-2 order-lg-1 md-mt-40 sm-mt-40">
						<div class="shop__sidebar">
							<aside class="wedget__categories poroduct--cat">
								<h3 class="wedget__title">Product Categories</h3>
								<ul>
									<c:forEach var="category" items="${categoryList}">
										<li><a href="category/${category.category.name}-${category.category.id}">${category.category.name}<span>(${category.count})</span></a></li>
									</c:forEach>
								</ul>
							</aside>
							</aside>
						</div>
					</div>
					<div class="col-lg-9 col-12 order-1 order-lg-2">
						<div class="row">
							<div class="col-lg-12">
								<div
									class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">

									<p>Showing 1–${bookList.size()} of ${countBook} results</p>
                                    <div class="orderby__wrapper">
<%--										<span>Sort By</span>--%>
<%--										<select class="shot__byselect">--%>
<%--											<option>Title</option>--%>
<%--											<option>Author</option>--%>
<%--										</select>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab__container">
                            <div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">
                                <div class="row">
                                    <!-- Start Single Product -->
                                    <c:forEach var="book" items="${bookList}">
                                        <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                            <div class="product__thumb" style="max-height: 220px; height: 220px">
                                                <a class="first__img" href="single-product.jsp"><img
                                                        src="<%=request.getContextPath()%>/resources/upload/${book.image}"
                                                        style="width: 230px"
                                                        alt="${book.title} not have image"></a>
                                            </div>
                                            <div class="product__content content--center">
                                                <c:if test="${book.quantity>0}">
                                                    <h4><a>${book.title}</a></h4>
                                                </c:if>
                                                <c:if test="${book.quantity<=0}">
                                                    <h4><strike style="font-weight: normal; font-size: medium">${book.title}</strike></h4>
                                                    <h4><span class="text-danger">OUT OF STOKE</span></h4>
                                                </c:if>
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
                                            <c:if test="${pageNum!=1}">
                                                <li class="page-item text-success"><a class="page-link" href="?page=${pageNum-1}">Prev</a></li>
                                            </c:if>
											<c:if test="${pageNum != 1}">
												<li class="page-item text-success"><a class="page-link" href="?page=1">1</a></li>
											</c:if>

                                            <c:if test="${(pageNum != 2) && (pageNum != 1)}">
                                                <li class="page-item"><a class="page-link" href="?page=2">2</a></li>
                                            </c:if>

                                            <c:if test="${pageNum > 1}">
                                                <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                                            </c:if>

                                            <li class="page-item disabled"><a class="page-link" href="?page=${pageNum}">${pageNum}</a></li>

                                            <c:if test="${pageNum < maxPage}">
                                                <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                                            </c:if>

                                            <c:if test="${(pageNum < maxPage) && (pageNum != (maxPage-1))}">
                                                <li class="page-item"><a class="page-link" href="?page=${maxPage-1}">${maxPage-1}</a></li>
                                            </c:if>

                                            <c:if test="${pageNum != maxPage}">
												<li class="page-item"><a class="page-link" href="?page=<fmt:formatNumber value="${maxPage}" type="number" pattern="#"/>">${maxPage}</a></li>
											</c:if>
                                            <c:if test="${pageNum != maxPage}">
                                                <li class="page-item text-success"><a class="page-link" href="?page=${pageNum+1}">Next</a></li>
                                            </c:if>
										</ul>
									</nav>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Shop Page -->

		<!-- footter -->
		<jsp:include page="part/footer.jsp"></jsp:include>
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
                                    <input id="qty" class="input-text qty" oninput="validity.valid||(value=' ');" name="qty" min="1" value="1" title="Qty"
                                           type="number">
                                    <div class="addtocart__actions">
                                        <button class="tocart" data-item="" id="modal-add-to-cart" type="submit" title="Add to Cart">Add to
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
                success: function (result) {
                    $('#modal-add-to-cart').attr('data-item',result.id)
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
<script>
    $(document).ready(function () {
        checkReport('${error}', '${success}')
        $(".addTo.cart").click(function () {
            console.log($(this));
            addToCart($(this).attr("data-item"));
        });
        $("#modal-add-to-cart").click(function () {
            addToCartWithQuantity($(this).attr("data-item"),$('#qty').val());
        });
        $(document).on("click", ".btnDeleteCart", function () {
            deleteItemInCart($(this).attr("data-item-id"));
        });

    })

    $(document).ready(function () {

    })

</script>

</html>
