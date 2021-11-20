<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>navbar example</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <style>
        .navbar-default {
            background-color: #69899f;
            border-color: #425766;
        }
        .navbar-default .navbar-brand {
            color: #d7e2e9;
        }
        .navbar-default .navbar-brand:hover, .navbar-default .navbar-brand:focus {
            color: #e5dbdb;
        }
        .navbar-default .navbar-text {
            color: #d7e2e9;
        }
        .navbar-default .navbar-nav > li > a {
            color: #d7e2e9;
        }
        .navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
            color: #e5dbdb;
        }
        .navbar-default .navbar-nav > li > .dropdown-menu {
            background-color: #69899f;
        }
        .navbar-default .navbar-nav > li > .dropdown-menu > li > a {
            color: #d7e2e9;
        }
        .navbar-default .navbar-nav > li > .dropdown-menu > li > a:hover,
        .navbar-default .navbar-nav > li > .dropdown-menu > li > a:focus {
            color: #e5dbdb;
            background-color: #425766;
        }
        .navbar-default .navbar-nav > li > .dropdown-menu > li > .divider {
            background-color: #69899f;
        }
        .navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus {
            color: #e5dbdb;
            background-color: #425766;
        }
        .navbar-default .navbar-nav > .open > a, .navbar-default .navbar-nav > .open > a:hover, .navbar-default .navbar-nav > .open > a:focus {
            color: #e5dbdb;
            background-color: #425766;
        }
        .navbar-default .navbar-toggle {
            border-color: #425766;
        }
        .navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus {
            background-color: #425766;
        }
        .navbar-default .navbar-toggle .icon-bar {
            background-color: #d7e2e9;
        }
        .navbar-default .navbar-collapse,
        .navbar-default .navbar-form {
            border-color: #d7e2e9;
        }
        .navbar-default .navbar-link {
            color: #d7e2e9;
        }
        .navbar-default .navbar-link:hover {
            color: #e5dbdb;
        }

        @media (max-width: 767px) {
            .navbar-default .navbar-nav .open .dropdown-menu > li > a {
                color: #d7e2e9;
            }
            .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
                color: #e5dbdb;
            }
            .navbar-default .navbar-nav .open .dropdown-menu > .active > a, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
                color: #e5dbdb;
                background-color: #425766;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>navbar Example</h1>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Web</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/TeacherServlet?action=info&id=${teacher.id}">Check Information</a></li>
                    <li><a href="/TeacherServlet?action=editpass&id=${teacher.id}">Change Password</a></li>
                    <li><a href="/TeacherServlet?action=logout">Log out</a></li>
                    <li class="dropdown">
                        <a href="https://www.jquery-az.com/bootstrap-tips-tutorials/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Bootstrap <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="https://www.jquery-az.com/bootstrap-carousel-5-single-multiple-horizontal-and-vertical-sliding-demos/">Carousel</a></li>
                            <li><a href="https://www.jquery-az.com/bootstrap-form-customized-styles-6-online-examples/">Forms</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="https://www.jquery-az.com/bootstrap-select-5-beautiful-styles/">Select</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Find topics">
                    </div>
                    <button type="submit" class="btn btn-info">Go</button>
                </form>
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">About <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="https://www.jquery-az.com/about-us/">Terms</a></li>
                            <li><a href="https://www.jquery-az.com/contact/">Contact</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
</body>
</html>

<%--<html>--%>
<%--<head>--%>
<%--    <title>${teacher.name}</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            background-image: url("https://chupgiare.com/wp-content/uploads/2021/08/tai-nguyen-background-dep-cho-be-2021-3.jpg");--%>
<%--        background-size: 100% 100%;--%>
<%--        }--%>
<%--    </style>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:if test="${teacher != null}">--%>
<%--    <h1>Hello ${teacher.name} Teacher</h1>--%>
<%--    <table class="table table-sm">--%>
<%--        <tr>--%>
<%--            <td><a href="/TeacherServlet?action=info&id=${teacher.id}">Check Information</a></td>--%>
<%--            <td> <a href="/TeacherServlet?action=editpass&id=${teacher.id}">Change Password</a></td>--%>
<%--            <td> <a href="/TeacherServlet?action=logout">Log out</a></td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</c:if>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>--%>
<%--</body>--%>
<%--</html>--%>
