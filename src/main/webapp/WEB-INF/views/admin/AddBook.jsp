<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/21/2020
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Tables - SB Admin</title>
    <link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/resources/upload/favicon.ico"/>
    <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
          crossorigin="anonymous"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
            crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand" href="index.html">Start Bootstrap</a>
    <button
            class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i
            class="fas fa-bars"></i></button><!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">Settings</a><a class="dropdown-item" href="#">Activity Log</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="login.html">Logout</a>
            </div>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Core</div>
                    <a class="nav-link" href="index.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Dashboard
                    </a>
                    <div class="sb-sidenav-menu-heading">Interface</div>
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts"
                       aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Layouts
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                         data-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="layout-static.html">Static
                            Navigation</a><a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                       aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                        Pages
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                         data-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                               data-target="#pagesCollapseAuth" aria-expanded="false"
                               aria-controls="pagesCollapseAuth">Authentication
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                                 data-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav"><a class="nav-link"
                                                                           href="login.html">Login</a><a
                                        class="nav-link"
                                        href="register.html">Register</a><a class="nav-link"
                                                                            href="password.html">Forgot Password</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                               data-target="#pagesCollapseError" aria-expanded="false"
                               aria-controls="pagesCollapseError">Error
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                 data-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="401.html">401
                                    Page</a><a class="nav-link" href="404.html">404 Page</a><a class="nav-link"
                                                                                               href="500.html">500
                                    Page</a></nav>
                            </div>
                        </nav>
                    </div>

                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                Start Bootstrap
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4" style="color: #6c757d"><i
                        class="fas fa-plus-square" style="color: #0aab0a"></i> Add Book</h1>
                <div class="alert alert-danger" role="alert" id="danger-msg" style="display: none">
                    <span>Error!</span>
                </div>
                <div class="alert alert-success" role="alert" id="success-msg" style="display: none">
                    <i class="fas fa-clipboard-check"></i> <span>Add Book Success!</span>
                </div>
                <div class="card mb-4">
                    <div class="card-header"><i class="fas fa-book"></i> Add Book Form</div>
                    <div class="card-body">
                        <form id="addBookForm">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="inputTitle">Title</label>
                                    <input type="text" class="form-control" name="title" id="inputTitle"
                                           placeholder="Title">
                                    <small id="inputTitle-msg" style="color: #ff0000"></small>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputAuthor">Author</label>
                                    <input type="text" class="form-control" name="author" id="inputAuthor"
                                           placeholder="Author">
                                    <small id="inputAuthor-msg" style="color: #ff0000"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPublisher">Publisher</label>
                                    <input type="text" class="form-control" id="inputPublisher" name="publisher"
                                           placeholder="Publisher">
                                    <small id="inputPublisher-msg" style="color: #ff0000"></small>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputIsbn">ISBN</label>
                                    <input type="text" class="form-control" name="isbn" id="inputIsbn"
                                           placeholder="Isbn">
                                    <small id="inputIsbn-msg" style="color: #ff0000"></small>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="inputCategory">Category</label>
                                    <select id="inputCategory" name="categories" class="form-control">
                                        <c:forEach var="category" items="${categories}">
                                        <option value="${category.id}"/>
                                            ${category.name}<p>
                                        </c:forEach>
                                    </select>
                                    <small id="inputCategory-msg" style="color: #ff0000"></small>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="inputPageNumber">Page Number</label>
                                    <input type="number" class="form-control" name="pageNumber" id="inputPageNumber"
                                           placeholder="Page Number" value="0">
                                    <small id="inputPageNumber-msg" style="color: #ff0000"></small>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputPrice">Price</label>
                                    <input type="number" class="form-control" id="inputPrice" placeholder="Price"
                                           name="price" value="0">
                                    <small id="inputPrice-msg" style="color: #ff0000"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputQuantity">Quantity</label>
                                    <input type="number" class="form-control" id="inputQuantity"
                                           placeholder="Quantity" name="quantity" value="0">
                                    <small id="inputQuantity-msg" style="color: #ff0000"></small>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="inputDescription">Description:</label>
                                    <textarea class="form-control" rows="5" id="inputDescription"
                                              name="description"></textarea>
                                    <small id="inputDescription-msg" style="color: #ff0000"></small>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="inputImage">Book Photo</label>
                                    <input type="file" id="inputImage" class="form-control"
                                           style="padding-bottom: 37px;" name="image">
                                    <small id="inputImage-msg" style="color: #ff0000"></small>
                                </div>

                            </div>
                            <button type="submit" class="btn btn-primary" id="createBook-btn"><i
                                    class="fas fa-cloud-upload-alt"></i> Add Book
                            </button>
                        </form>
                    </div>
                </div>
                <h1 class="mt-4" style="color: #6c757d"><i
                        class="fas fa-bookmark" style="color: #a8741a"></i> Preview Book</h1>
                <div class="card mb-4">
                    <div class="card-header"><i class="fas fa-book-open"></i> Book Detail</div>
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-4">
                                    <img id="bookPhoto"
                                         src="<%=request.getContextPath()%>/resources/upload/default-book.png"
                                         class="img-thumbnail"
                                         alt="Responsive image">
                                </div>
                                <div class="col-md-4">
                                    <h1>Book's Title</h1>
                                    <h2>ISBN</h2>
                                    <h2>Author</h2>
                                    <h2>Publisher</h2>
                                    <h2>Category</h2>
                                </div>
                                <div class="col-md-4">
                                    <h2>Price</h2>
                                    <h2>Quantity</h2>
                                </div>
                                <div class="col-md-12 mt-4">
                                    <div class="card">
                                        <h5 class="card-header">Description</h5>
                                        <div class="card-body">
                                            <p class="card-text" id="bookDescription">With supporting text below as
                                                a
                                                natural lead-in to
                                                additional content.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2019</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/assets/demo/datatables-demo.js"></script>
<script>
    var validExtensions = ["jpg", "jpeg", "png"];

    $("#inputImage").bind("change", function() {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#bookPhoto')
                    .attr('src', e.target.result);
            };
            reader.readAsDataURL(this.files[0]);
        }else {
            $('#bookPhoto')
                .attr('src', '<%=request.getContextPath()%>/resources/upload/default-book.png');
        }
    });
    $("#inputTitle").on('input', function () {
        $("#bookTitle").text("Titlte: " + this.value);
    });
    $("#inputPrice").on('input', function () {
        $("#bookPrice").text("Price: " + this.value);
    });
    $("#inputAuthor").on('input', function () {
        $("#bookAuthor").text("Author: " + this.value);
    });
    $("#inputPublisher").on('input', function () {
        $("#bookPublisher").text("Publisher: " + this.value);
    });
    $('#inputCategory').on('change', function (e) {
        var optionSelected = $("option:selected", this);
        $("#bookCategory").text("Category: " + optionSelected.val());
    });
    $("#inputDescription").on('input', function () {
        $("#bookDescription").text(this.value);
    });

    $("#createBook-btn").click(function () {
        event.preventDefault();
        var flag = addBookValidate();
        if (1 == flag) {
            // Get form
            var form = $('#addBookForm')[0];

            // Create an FormData object
            var data = new FormData(form);

            data.append('image', $('#inputImage')[0].files[0]);
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "<%=request.getContextPath()%>/admin/book/add",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 60000,
                success: function (res) {
                    if (res.validated) {
                        //Set response
                        $("#danger-msg").hide();
                        $("#success-msg").show();
                        alert("Success : ");
                        setTimeout(function (){$("#success-msg").hide()}, 10000);
                    } else {
                        //Set error messages
                        $("#success-msg").hide()
                        var msg = "";
                        $.each(res.errorMessages, function (key, value) {
                            msg += "<p><i class=\"fas fa-exclamation-triangle\"></i> " + value + "</p>";
                        });
                        $("#danger-msg span").html(msg);

                        $("#danger-msg").show();
                        setTimeout(function (){$("#danger-msg").hide()}, 10000);
                    }
                },
                error: function (e) {
                    alert("Some thing wrong happen! Cant add book!");
                    $("#danger-msg span").html("Server Error!");
                    $("#danger-msg").show();
                    setTimeout(function (){$("#danger-msg").hide()}, 10000);
                }
            });
        } else {
            alert("Invalid input!");
        }

    })

    function addBookValidate() {
        flag = 1;
        var title = $("#inputTitle").val();
        var author = $("#inputAuthor").val();
        var isbn = $("#inputIsbn").val();
        var publisher = $("#inputPublisher").val();
        var description = $("#inputDescription").val();
        var price = $("#inputPrice").val();
        var quantity = $("#inputQuantity").val();
        var pageNumber = $("#inputPageNumber").val();
        var image = $("#inputImage")[0].files[0];

        //Validate image
        if (image != null) {
            var imageType = image.type;
            var imageSize = image.size;
            var pattern = new RegExp("^image/(jpg|png|jpeg)$");

            if (!pattern.test(imageType) || imageSize > 5000000) {
                $("#inputImage-msg").html("*Only accept file .jpg, .png, .jpeg with maximum size is 5Mb");
            }
        }

        //Validate title
        var length = title.length;
        if (length <= 0 || length > 255) {
            flag = 0;
            $("#inputTitle-msg").html("");
            $("#inputTitle-msg").html("*Title's length from 1 - 255 character!");
        }

        //Validate price
        if (isNaN(price) || price < 0) {
            flag = 0;
            $("#inputPrice-msg").html("");
            $("#inputPrice-msg").html("*Must be native number");
        }
        //Validate quantity
        if (isNaN(quantity) || quantity < 0) {
            flag = 0;
            $("#inputQuantity-msg").html("");
            $("#inputQuantity-msg").html("*Must be native number");
        }
        //Validate pageNumber
        if (isNaN(pageNumber) || pageNumber < 0) {
            flag = 0;
            $("#inputPageNumber-msg").html("");
            $("#inputPageNumber-msg").html("*Must be native number");
        }

        return flag;
    }
</script>
</body>


</html>
