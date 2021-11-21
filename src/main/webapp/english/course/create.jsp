<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/21/2021
  Time: 3:12 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Create course</title>
    <style>
        .pb-100 {
            padding-bottom: 100px;
        }
        .pt-100 {
            padding-top: 100px;
        }
        .mb-100 {
            margin-bottom: 100px;
        }
        a {
            text-decoration: none;
            color: #333;
            -webkit-transition: .4s;
            transition: .4s;
        }
        .section-title {
            position: relative;
        }
        .section-title p {
            font-size: 16px;
            margin-bottom: 5px;
            font-weight: 400;
        }
        .section-title h4 {
            font-size: 40px;
            font-weight: 600;
            text-transform: capitalize;
            position: relative;
            padding-bottom: 20px;
            display: inline-block;
        }
        .section-title h4::before {
            position: absolute;
            content: "";
            width: 80px;
            height: 2px;
            background-color: #d8d8d8;
            bottom: 0;
            left: 50%;
            margin-left: -40px;
        }
        .section-title h4::after {
            position: absolute;
            content: "";
            width: 50px;
            height: 2px;
            background-color: #FF7200;
            left: 0;
            bottom: 0;
            left: 50%;
            margin-left: -25px;
        }
        .contact {
            background-image: url("http://infinityflamesoft.com/html/abal-preview/assets/img/contact_back.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            position: relative;
            z-index: 2;
            color: #fff;
        }
        .contact-form input,
        textarea {
            width: 100%;
            border: 1px solid #555;
            padding: 5px 10px;
            text-transform: capitalize;
            margin-top: 15px;
            background-color: transparent;
            color: #fff;
        }
        .contact:before {
            position: absolute;
            content: "";
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            background-color: #333;
            z-index: -1;
            opacity: .85;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=85)";
        }
        .single-contact {
            text-align: left;
            position: relative;
            padding-left: 70px;
            margin-bottom: 50px;
            margin-top: 10px;
        }
        .single-contact i.fa {
            position: absolute;
            left: 0;
            top: 50%;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            background-color: #FF7200;
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            border-radius: 3px;
        }
        .single-contact h5 {
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: 500;
        }
        .single-contact p {
            font-size: 15px;
            font-weight: 400;
        }
        .contact-form input[type="submit"] {
            background-color: #FF7200;
            border: 0px;
            cursor: pointer;
            font-size: 16px;
            -webkit-transition: .4s;
            transition: .4s
        }
        .contact-form input[type="submit"]:hover {
            background-color: #CC5B00
        }
        .contact-form input:focus, textarea:focus {
            border-color: #CC5B00
        }
    </style>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,800,900%7cRaleway:300,400,500,600,700" rel="stylesheet">
<body>
<section class="contact pt-100 pb-100" id="contact">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 mx-auto text-center">
                <div class="section-title mb-100">
                    <p>A-B-T-A</p>
                    <h4>Thêm Khoá học</h4>
                </div>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-md-8">
                <form action="#" class="contact-form" method="post">
                    <div class="row">
                        <input type="hidden" name="mid" value="${ministryid}">

                        <div class="col-xl-6">
                            <input type="text" name="name" placeholder="name">
                        </div>

                        <div class="col-xl-6">
                            <input type="submit" value="Thêm Khoá Học">
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-4">
                <div class="single-contact">
                    <i class="fa fa-map-marker"></i>
                    <h5>Address</h5>
                    <p>Đâu cũng được</p>
                </div>
                <div class="single-contact">
                    <i class="fa fa-phone"></i>
                    <h5>Phone</h5>
                    <p>(+1) 517 397 7100</p>
                </div>
                <div class="single-contact">
                    <i class="fa fa-envelope"></i>
                    <h5>Email</h5>
                    <p>infor@personal.com</p>
                </div>
            </div>
        </div>
        <a style="color:white; margin: 30px" href="/MinistryServlet?action=welcome&id=${ministryid}">Quay lại quản lý Ministry</a>
    </div>
</section>
</body>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Create Course</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form method="post">--%>
<%--    <table>--%>
<%--        <input type="hidden" name="mid" value="${ministryid}">--%>
<%--        <tr>--%>
<%--            <th>Name</th>--%>
<%--            <td><input type="text" name="name"></td>--%>
<%--            <td><input type="submit" value="Them khoa hoc"></td>--%>
<%--        </tr>--%>

<%--    </table>--%>
<%--    <a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
