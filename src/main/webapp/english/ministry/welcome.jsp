<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Wellcome</title>
    <style>
        $nav-height: 3em;
        $nav-color: #bbb;
        $nav-background: #2e2e2e;
        .navbar-fixed {
            position: fixed;
            top: -($nav-height);
        }
        /*----------------------
          $NAVBAR
            basic navbar styling
          ----------------------*/
        nav {
            width: 100%;
            color: $nav-color;
            background: $nav-background;
            font-weight: bold;
            letter-spacing: 0.025em;
        }
        nav ul {
            text-align: center;
            margin: 0;
        }
        nav ul li {
            display: inline-block;
            padding: 0 3em;
            line-height: 3em;
        }
        nav ul li:hover {
            background: #00939C;
        }
        /*----------------------
          $BODY
          ----------------------*/
        body {
            background: #0B6AD4;
        }
        /*----------------------
          $MISC
          ----------------------*/
        .filler {
            width: 1px;
            height: 200px;
        }
        .two {
            height: 3000px;
        }
    </style>
</head>
<body>
<div class="filler one"></div>
<nav id="navbar">
    <t:if test="${ministry != null}">
        <h1 align="center">Xin Chao ${ministry.name}</h1>

        <ul>
            <li> <a style="color: white" href="/MinistryServlet?action=info&id=${ministry.id}">Xem thong tin</a></li>
            <li> <a style="color: white" href="/MinistryServlet?action=editpass&id=${ministry.id}">Doi mat khau</a></li>
            <li><a style="color: white" href="/TeacherServlet?action=list&id=${ministry.id}">danh sach giao vien</a></li>
            <li><a style="color: white" href="/CourseServlet?action=CourseServlet&id=${ministry.id}">Danh sach khoa hoc</a></li>
            <li><a style="color: white" href="/GradeServlet?action=GradeServlet&id=${ministry.id}">Danh sach lop hoc</a></li>
            <li> <a style="color: white" href="/MinistryServlet?action=logout">Dang xuat</a></li>
        </ul>
    </t:if>
</nav>
<div class="filler two"></div>

<script>
    (function($) {
        "use strict";
        var $navbar = $("#navbar"),
            y_pos = $navbar.offset().top,
            height = $navbar.height();
        $(document).scroll(function() {
            var scrollTop = $(this).scrollTop();
            if (scrollTop > y_pos + height) {
                $navbar.addClass("navbar-fixed").animate({
                    top: 0
                });
            } else if (scrollTop <= y_pos) {
                $navbar.removeClass("navbar-fixed").clearQueue().animate({
                    top: "-48px"
                }, 0);
            }
        });
    })(jQuery, undefined);
</script>
</body>
</html>