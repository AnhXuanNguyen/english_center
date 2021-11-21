<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 1:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html lang="vi">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <style>
        .test {
            background: #ffffff;
            font-size:24px;
            font-weight:bold;
            -webkit-animation: my 700ms infinite;
            -moz-animation: my 700ms infinite;
            -o-animation: my 700ms infinite;
            animation: my 700ms infinite;
        }
        .get-in-touch {
            max-width: 800px;
            margin: 50px auto;
            position: relative;

        }
        .get-in-touch .title {
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 3px;
            font-size: 3.2em;
            line-height: 48px;
            padding-bottom: 48px;
            color: #5543ca;
            background: #5543ca;
            background: -moz-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
            background: -webkit-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
            background: linear-gradient(to right,#f4524d  0%,#5543ca  100%) !important;
            -webkit-background-clip: text !important;
            -webkit-text-fill-color: transparent !important;
        }

        .contact-form .form-field {
            position: relative;
            margin: 32px 0;
        }
        .contact-form .input-text {
            display: block;
            width: 100%;
            height: 36px;
            border-width: 0 0 2px 0;
            border-color: #5543ca;
            font-size: 18px;
            line-height: 26px;
            font-weight: 400;
        }
        .contact-form .input-text:focus {
            outline: none;
        }
        .contact-form .input-text:focus + .label,
        .contact-form .input-text.not-empty + .label {
            -webkit-transform: translateY(-24px);
            transform: translateY(-24px);
        }
        .contact-form .label {
            position: absolute;
            left: 20px;
            bottom: 11px;
            font-size: 18px;
            line-height: 26px;
            font-weight: 400;
            color: #5543ca;
            cursor: text;
            transition: -webkit-transform .2s ease-in-out;
            transition: transform .2s ease-in-out;
            transition: transform .2s ease-in-out,
            -webkit-transform .2s ease-in-out;
        }
        .contact-form .submit-btn {
            display: inline-block;
            background-color: #000;
            background-image: linear-gradient(125deg,#a72879,#064497);
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 16px;
            padding: 8px 16px;
            border: none;
            width:200px;
            cursor: pointer;
        }

    </style>
    <title>Edit Info</title>
</head>
<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<p class="test">
    <c:if test="${mes!=null}">
        <span align="center">${mes}</span>
    </c:if>
</p>

<section class="get-in-touch">
    <h1 align="center" class="title">Thêm Em Giáo Vụ</h1>
    <form class="contact-form row" method="post">
        <div class="form-field col-lg-6">
            <input name="name" id="name" class="input-text js-input" type="text" required>
            <label class="label" for="name">Tên</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input name="email" id="email" class="input-text js-input" type="email" required>
            <label class="label" for="email">Email</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input name="dob" id="dob" class="input-text js-input" type="date" required>
            <label class="label" for="dob">Ngày mừng thọ</label>
        </div>

        <div class="form-field col-lg-6 ">
            <input name="address" id="address" class="input-text js-input" type="text" required>
            <label class="label" for="address">Địa chỉ</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input name="phone" id="phone" class="input-text js-input" type="number" required>
            <label class="label" for="phone">Số điện thoại</label>
        </div>

        <div class="form-field col-lg-6 ">
            <input name="username" id="user" class="input-text js-input" type="text" required>
            <label class="label" for="user">Username</label>
        </div>

        <div class="form-field col-lg-6 ">
            <input name="password" id="pass" class="input-text js-input" type="password" required>
            <label class="label" for="pass">Password</label>
        </div>

        <div class="form-field col-lg-12">
            <input class="submit-btn" type="submit" value="Thêm">
        </div>
    </form>
    <a href="/MinistryServlet?action=listministry">Quay lại danh sách giáo vụ</a>
</section>
</body>
</html>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Them Giao vu</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form method="post">--%>
<%--    <table>--%>
<%--    <tr>--%>
<%--        <th>Ten</th>--%>
<%--        <th>Email</th>--%>
<%--        <th>Dob</th>--%>
<%--        <th>Address</th>--%>
<%--        <th>Phone</th>--%>
<%--        <th>username</th>--%>
<%--        <th>password</th>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td><input type="text" name="name"></td>--%>
<%--        <td><input type="text" name="email"></td>--%>
<%--        <td><input type="date" name="dob"></td>--%>
<%--        <td><input type="text" name="address"></td>--%>
<%--        <td><input type="number" name="phone"></td>--%>
<%--        <td><input type="text" name="username"></td>--%>
<%--        <td><input type="password" name="password"></td>--%>
<%--        <td colspan="2"><input type="submit" value="register"></td>--%>
<%--    </tr>--%>
<%--    </table>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
