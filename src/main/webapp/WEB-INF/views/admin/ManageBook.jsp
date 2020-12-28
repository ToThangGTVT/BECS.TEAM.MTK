<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/22/2020
  Time: 8:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Tables - SB Admin</title>
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
                <a class="dropdown-item" href="<%=request.getContextPath()%>/admin/logout">Logout</a>
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
                    <div class="sb-sidenav-menu-heading">Addons</div>
                    <a class="nav-link" href="charts.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        Charts
                    </a><a class="nav-link" href="tables.html">
                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                    Tables
                </a>
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
                <h1 class="mt-4">Book Management</h1>
                <div class="row" style="padding-bottom: 1rem">

                    <div class="input-group col-sm-2" style="margin-top: 0.5rem">
                        <div id="idSort" data-idSort="asc">
                            <span><i class="fas fa-sort-numeric-up"></i></span> Sort by Id
                        </div>
                    </div>

                    <div class="input-group col-sm-4" style="margin-top: 0.5rem">
                        <label for="pageSize" style="padding-right: 1rem">Show</label>
                        <select class="form-control form-control-sm" id="pageSize" style="max-width: 4rem">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                        </select>
                        <label for="pageSize" style="padding-left: 1rem">Entries</label>
                    </div>
                    <div class="input-group col-md-6">
                        <div class="input-group-prepend">
                            <div class="input-group-text" id="btnGroupAddon">@</div>
                        </div>
                        <input type="text" class="form-control" id="searchContent" placeholder="Input group example"
                               aria-label="Input group example" aria-describedby="btnGroupAddon">
                    </div>
                </div>
                <!-- BEGIN for load book paging content -->
                <div id="book-paging-content">

                    <!-- BOOK PAGING CONTENT LOAD HERE!!! -->
                </div>
                <!-- END for load book paging content -->
            </div>
            <div class="modal fade " id="exampleModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit book</h5>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="alert alert-danger" role="alert" id="danger-msg" style="display: none">
                                    <i class="fas fa-exclamation-triangle"></i> <span></span>
                                </div>
                                <div class="alert alert-success" role="alert" id="success-msg" style="display: none">
                                    <i class="fas fa-clipboard-check"></i> <span>Add Book Success!</span>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <img id="bookPhoto"
                                             src="<%=request.getContextPath()%>/resources/upload/default-book.png"
                                             class="img-thumbnail"
                                             alt="Responsive image">
                                    </div>
                                    <div class="col-md-8">
                                        <form id="editBookForm">
                                            <input type="text" class="form-control" name="id" id="inputId"
                                                   placeholder="Id" hidden>
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
                                                    <input type="text" class="form-control" name="author"
                                                           id="inputAuthor"
                                                           placeholder="Author">
                                                    <small id="inputAuthor-msg" style="color: #ff0000"></small>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="inputPublisher">Publisher</label>
                                                    <input type="text" class="form-control" id="inputPublisher"
                                                           name="publisher"
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
                                                    <input type="number" class="form-control" name="pageNumber"
                                                           id="inputPageNumber"
                                                           placeholder="Page Number" value="0">
                                                    <small id="inputPageNumber-msg" style="color: #ff0000"></small>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="inputPrice">Price</label>
                                                    <input type="number" class="form-control" id="inputPrice"
                                                           placeholder="Price"
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
                                            <button type="submit" class="btn btn-primary" id="editBook-btn"><i
                                                    class="fas fa-cloud-upload-alt"></i> Edit Book
                                            </button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer"></div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2020</div>
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
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/admin/book/paging",
            data: {
                pageSize: 5,
                pageNumber: 1,
                searchContent: "",
                order: "asc"
            },
            timeout: 60000,
            success: function (res) {
                $("#book-paging-content").html(res);
            },
            error: function (e) {
                alert("Some thing wrong happen! Cant load books!");
            }
        });
    });

    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var id = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        $("#inputTitle-msg").html("");
        $("#inputAuthor-msg").html('');
        $("#inputPublisher-msg").html('');
        $("#inputIsbn-msg").html('');
        $("#inputPageNumber-msg").html('');
        $("#inputPrice-msg").html('');
        $("#inputQuantity-msg").html('');
        $("#inputImage-msg").html('');
        $("#inputDescription-msg").html('');

        var tr = $("#book-" + id + " td");
        $("#inputId").val(id);
        $("#inputTitle").val(tr[2].innerText);
        $("#inputAuthor").val(tr[7].innerText);
        $("#inputPublisher").val(tr[4].innerText);
        $("#inputIsbn").val(tr[3].innerText);
        $("#inputPageNumber").val(tr[6].innerText);
        $("#inputPrice").val(tr[8].innerText);
        $("#inputQuantity").val(tr[5].innerText);
        $("#inputDescription").val(tr[10].innerText);
        $("#inputCategory").val(tr[11].innerText);
        var src = $("#book-img-" + id).attr("src");
        $("#bookPhoto").attr("src", src);
    });

    $("#inputImage").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#bookPhoto')
                    .attr('src', e.target.result);
            };
            reader.readAsDataURL(this.files[0]);
        } else {
            var id = $("#inputId").val();
            $('#bookPhoto')
                .attr('src', $("#book-img-" + id).attr("src"));
        }
    });
    $("#editBook-btn").click(function (event) {
        event.preventDefault();
        var flag = editBookValidate();
        if (1 == flag) {
            // Get form
            var form = $('#editBookForm')[0];

            // Create an FormData object
            var data = new FormData(form);

            data.append('image', $('#inputImage')[0].files[0]);
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "<%=request.getContextPath()%>/admin/book/edit",
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
                        var id = $("#inputId").val();
                        var tr = $("#book-" + id + " td");

                        tr[2].innerText = $("#inputTitle").val();
                        tr[7].innerText = $("#inputAuthor").val();
                        tr[4].innerText = $("#inputPublisher").val();
                        tr[3].innerText = $("#inputIsbn").val();
                        tr[6].innerText = $("#inputPageNumber").val();
                        tr[8].innerText = $("#inputPrice").val();
                        tr[5].innerText = $("#inputQuantity").val();
                        tr[10].innerText = $("#inputDescription").val();
                        tr[11].innerText = $("#inputCategory").val();
                        var src = $("#bookPhoto").attr("src");
                        $("#book-img-" + id).attr("src",src);
                        setTimeout(function () {
                            $("#success-msg").hide()
                        }, 10000);
                    } else {
                        //Set error messages
                        $("#success-msg").hide()
                        var msg = "";
                        $.each(res.errorMessages, function (key, value) {
                            msg += "<p><i class=\"fas fa-exclamation-triangle\"></i> " + value + "</p>";
                        });
                        $("#danger-msg span").html(msg);

                        $("#danger-msg").show();
                        setTimeout(function () {
                            $("#danger-msg").hide()
                        }, 10000);
                    }
                },
                error: function (e) {
                    alert("Some thing wrong happen! Cant add book!");
                    $("#danger-msg span").html("Server Error!");
                    $("#danger-msg").show();
                    setTimeout(function () {
                        $("#danger-msg").hide()
                    }, 10000);
                }
            });
        } else {
            alert("Invalid input!");
        }

    })

    function editBookValidate() {
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

    function pagingBook(pageSize, pageNumber, searchContent, order) {
        alert('Paging :::::' + pageSize + ' ' + pageNumber + ' ' + searchContent + ' ' + order)
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/admin/book/paging",
            data: {
                pageSize: pageSize,
                pageNumber: pageNumber,
                searchContent: searchContent,
                order: order
            },
            timeout: 60000,
            success: function (res) {
                $("#book-paging-content").html(res);
            },
            error: function (e) {
                alert("Some thing wrong happen! Cant load books!");
            }
        });
    }

    function paging(pageNumber) {
        var searchContent = $("#searchContent").val();
        if (searchContent == undefined) {
            searchContent == "";
        }
        var order = $("#idSort").data('idSort');
        if ("desc" != order) {
            order = "asc";
        }
        var pageSize = $("#pageSize").val();
        if (pageSize == undefined) {
            pageSize = 5;
        }
        if (isNaN(pageSize)) {
            console.log(pageSize);
            pageSize = 5;
        }
        if (pageNumber == undefined) {
            pageNumber = 1;
        }
        pagingBook(pageSize, pageNumber, searchContent, order);
    }

    $('body').on('click', '.page-link', function (e) {
        e.preventDefault();
        var pageNumber = $(this).data('pagenumber');
        console.log(pageNumber);
        paging(pageNumber);
    });
    $('body').on('change', '#searchContent', function (e) {
        paging(1);
    });
    $('body').on('change', '#pageSize', function (e) {
        paging(1);
    });
</script>
</body>


</html>
