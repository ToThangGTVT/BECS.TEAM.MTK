<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/22/2020
  Time: 8:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="card mb-4">
    <div class="card-header">

    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th scope="col"> Id</th>
                    <th scope="col"> Image</th>
                    <th scope="col"> Title</th>
                    <th scope="col"> ISBN</th>
                    <th scope="col"> Publisher</th>
                    <th scope="col"> Quantity</th>
                    <th scope="col"> Number Of Page</th>
                    <th scope="col"> Author</th>
                    <th scope="col"> Price</th>
                    <th scope="col"> Option</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${books}">
                    <tr id="book-${book.id}">
                        <td>${book.id}</td>
                        <td><img id="book-img-${book.id}" src="<%=request.getContextPath()%>/resources/upload/${book.image}"
                                             style="width: 150px; height: 150px;" /></td>
                        <td>${book.title}</td>
                        <td>${book.isbn}</td>
                        <td>${book.publisher}</td>
                        <td>${book.quantity}</td>
                        <td>${book.pageNumber}</td>
                        <td>${book.author}</td>
                        <td>${book.price}</td>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#exampleModal" data-whatever="${book.id}">Edit</button>
                        </td>
                        <td style="display: none">${book.description}</td>
                        <td style="display: none">${book.category.id}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                    <c:choose>
                        <c:when test="${pageNumber <= 1}">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" data-pageNumber="${pageNumber - 1}">Previous</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="#" data-pageNumber="${pageNumber - 1}">Previous</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <c:if test = "${numberOfPage > 0}">
                        <c:forEach var="i" begin="1" end="${numberOfPage}">
                            <li class="page-item ${pageNumber == i ? "active" : ""}" ><a class="page-link" href="" data-pageNumber="${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <c:choose>
                        <c:when test="${pageNumber == numberOfPage || numberOfPage == 0}">
                            <li class="page-item disabled" >
                                <a class="page-link" href="#" data-pageNumber="${pageNumber + 1}">Next</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="#" data-pageNumber="${pageNumber + 1}">Next</a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                </ul>
            </nav>
        </div>

    </div>
</div>



