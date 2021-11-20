<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 2:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Welcome Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
            <use xlink:href="#bootstrap"></use>
        </svg>
    </a>

    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="/Adminservlet?action=info" class="nav-link px-2 link-secondary">Show Information</a></li>
        <li><a href="/Adminservlet?action=edit" class="nav-link px-2 link-dark">Edit Information</a></li>
        <li><a href="/Adminservlet?action=editpass" class="nav-link px-2 link-dark">Edit PassWord</a></li>
        <li><a href="/Adminservlet?action=logout" class="nav-link px-2 link-dark">Log Out</a></li>
        <li><a href="/MinistryServlet?action=listministry" class="nav-link px-2 link-dark">Ministry Manager</a></li>
    </ul>
    <div class="col-md-3 text-end">
        <c:if test="${admin != null}">
            <h1>Hello ${admin.name}</h1>

        </c:if>
    </div>
</header>
<div align="center">
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://netviethuman.com/wp-content/uploads/2021/07/toeic-la-gi-1.jpg" class="d-block w-99" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://acet.edu.vn/wp-content/uploads/2021/01/hoc-ielts-de-lam-gi.jpg" class="d-block w-99" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://i.imgur.com/NhNwyjP.jpeg" class="d-block w-99" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>