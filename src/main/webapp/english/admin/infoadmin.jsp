<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Info admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
         span {
            position: absolute;
            display: block;
        }
         *{
             background-image: url(https://st.quantrimang.com/photos/image/2021/02/04/Hinh-nen-Quoc-Ky-VN-13.jpg);
             background-size:cover ;
         }
    </style>
</head>
<body>
<div class="info">
    <c:if test="${admin != null}">
        <h1 align="center" style="color: #4cd9b4">Here is admin's information and it's top secret!</h1>
        <table class="table table-dark table-striped">
            <tr>
                <th>Name</th>
                <td>${admin.name}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${admin.email}</td>
            </tr>
            <tr>
                <th>Date of birth</th>
                <td>${admin.dob}</td>
            </tr>
            <tr>
                <th>Address</th>
                <td>${admin.address}</td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td>${admin.phone}</td>
            </tr>
        </table>
        <div align="center">
            <a href="/Adminservlet?action=welcome">
                <button value="Back to HomePage">
                    Back to HomePage
                </button>
            </a>
        </div>

    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>

