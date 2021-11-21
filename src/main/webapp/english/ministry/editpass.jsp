<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<head>
<%--    <meta charset="UTF-8">--%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>

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
    <title>Edit pass</title>
</head>
<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<c:if test="${ministry!=null}">
    <c:if test="${ministry!=null}">
        <h2 align="center">Account: ${ministry.name}</h2>
    </c:if>
    <section class="get-in-touch">
        <h1 class="title">Cho em cái PASS mới nào</h1>
        <form class="contact-form row" method="post">
            <div class="form-field col-lg-6">
                <input name="oldpass" id="name" class="input-text js-input" type="password" required>
                <label class="label" for="name">Nhập mật khẩu cũ</label>
            </div>
            <div class="form-field col-lg-6 ">
                <input name="newpass" id="email" class="input-text js-input" type="password" required>
                <label class="label" for="email">Nhập mật khẩu mới</label>
            </div>
            <div class="form-field col-lg-6 ">
                <input name="repass" id="company" class="input-text js-input" type="password" required>
                <label class="label" for="company">Nhập lại mật khẩu</label>
            </div>

            <div class="form-field col-lg-12">
                <input class="submit-btn" type="submit" value="Submit">
            </div>
        </form>
        <a href="/MinistryServlet?action=welcome&id=${ministry.id}">Quay lại trang chủ</a>
    </section>
</c:if>
</body>
</html>
