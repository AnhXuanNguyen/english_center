<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 3:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit pass</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--important link source from "https://bootsnipp.com/snippets/A36DP"-->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <style>
        .edit-password {
            max-width: 800px;
            margin: 50px auto;
            position: relative;

        }
        .edit-password .title {
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
</head>
<body>

<c:if test="${mes!=null}">
    <h2>${mes}</h2>
</c:if>
<section class="edit-password">
    <h1 class="title">Edit Password</h1>
    <form class="contact-form row" method="post">
        <div class="form-field col-lg-12">
            <input id="oldpass" class="input-text js-input" type="password" required>
            <label class="label" for="oldpass">Input Old Password</label>
        </div>
        <div class="form-field col-lg-12">
            <input id="newpass" class="input-text js-input" type="password" required>
            <label class="label" for="newpass">Input new Password</label>
        </div>
        <div class="form-field col-lg-12 ">
            <input id="repass" class="input-text js-input" type="password" required>
            <label class="label" for="repass">Input Password again</label>
        </div>
        <div class="form-field col-lg-12">
            <input class="submit-btn" type="submit" value="Submit">
        </div>
    </form>
</section>
<div align="center">
    <a href="/Adminservlet?action=welcome">
        <button>
            Back to HomePage
        </button>
    </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>



