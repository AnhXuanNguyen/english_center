<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html lang="vn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>List course</title>
    <style>
        @import url(http://fonts.googleapis.com/css?family=Calibri:400,300,700);

        body {
            background-color: #673AB7;
            font-family: 'Calibri', sans-serif !important
        }

        .container {
            margin-top: 100px
        }

        .card {
            position: relative;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0px solid transparent;
            border-radius: 0px
        }

        .card-body {
            -webkit-box-flex: 1;
            -ms-flex: 1 1 auto;
            flex: 1 1 auto;
            padding: 1.25rem
        }

        .card .card-title {
            position: relative;
            font-weight: 600;
            margin-bottom: 10px
        }

        .table {
            width: 100%;
            max-width: 100%;
            margin-bottom: 1rem;
            background-color: transparent
        }

        * {
            outline: none
        }

        .table th,
        .table thead th {
            font-weight: 500
        }

        .table thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6
        }

        .table th {
            padding: 1rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6
        }

        .table th,
        .table thead th {
            font-weight: 500
        }

        th {
            text-align: inherit
        }

        .m-b-20 {
            margin-bottom: 20px
        }

        .customcheckbox {
            display: block;
            position: relative;
            padding-left: 24px;
            font-weight: 100;
            margin-bottom: 12px;
            cursor: pointer;
            font-size: 22px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none
        }

        .customcheckbox input {
            position: absolute;
            opacity: 0;
            cursor: pointer
        }

        .checkmark {
            position: absolute;
            top: -3px;
            left: 0;
            height: 20px;
            width: 20px;
            background-color: #CDCDCD;
            border-radius: 6px
        }

        .customcheckbox input:checked ~ .checkmark {
            background-color: #2196BB
        }

        .customcheckbox .checkmark:after {
            left: 8px;
            top: 4px;
            width: 5px;
            height: 10px;
            border: solid white;
            border-width: 0 3px 3px 0;
            -webkit-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            transform: rotate(45deg)
        }
    </style>
</head>
<body>
<<<<<<< HEAD
<a href="/CourseServlet?action=create&mid=${ministryid}">Them</a>
<table>
    <tr><th>Name</th></tr>
    <c:forEach items="${courses}" var="course">
        <tr>
            <td>${course.name}</td>
            <td><a href="/CourseServlet?action=edit&id=${course.id}&mid=${ministryid}">Sua</a></td>
            <td><a href="/CourseServlet?action=drop&id=${course.id}&mid=${ministryid}">Xoa</a></td>
        </tr>
    </c:forEach>
    <a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>
</table>
=======
<div class="container">
    <h3 style="margin-left: 40px"><a style="color: yellow" href="/CourseServlet?action=create&mid=${ministryid}">THÊM KHOÁ HỌC</a></h3>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h2 align="center" class="card-title m-b-0">Danh sách Khoá học</h2>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead class="thead-light">
                        <tr>
                            <%--              <!--                            <th> <label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> </label> </th>-->--%>
                            <th scope="col">Tên</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody class="customtable">
                        <c:forEach items="${courses}" var="course">
                            <tr>
                                    <%--                <!--                            <th> <label class="customcheckbox"> <input type="checkbox" class="listCheckbox"> </label> </th>-->--%>
                                <td>&ensp;&ensp;${course.name}</td>
                                <td>
                                    <a href="/CourseServlet?action=edit&id=${course.id}&mid=${ministryid}">Edit</a>&ensp;&ensp;
                                    <a href="/CourseServlet?action=drop&id=${course.id}&mid=${ministryid}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<a style="color:white; margin: 30px" href="/Adminservlet?action=welcome">Quay lại Trang Chủ</a>--%>
<p align="center" style="margin: 20px">
    <a style="color: white" href="/MinistryServlet?action=welcome&id=${ministryid}">Back to Ministry home</a>
</p>
>>>>>>> e60e35b9b8b0912c0c34a7710ddc8f39d9c23e20
</body>
</html>
<%--<html>--%>
<%--<head>--%>
<%--    <title>List course</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<table>--%>
<%--    <tr><th>Name</th></tr>--%>
<%--    <a href="/CourseServlet?action=create&mid=${ministryid}">Them</a>--%>
<%--    <c:forEach items="${courses}" var="course">--%>
<%--        <tr>--%>
<%--            <td>${course.name}</td>--%>
<%--            <td><a href="/CourseServlet?action=edit&id=${course.id}&mid=${ministryid}">Sửa</a></td>--%>
<%--            <td><a href="/CourseServlet?action=drop&id=${course.id}&mid=${ministryid}">Xóa</a></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    <a href="/MinistryServlet?action=welcome&id=${ministryid}">Quay lại trang chủ</a>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>
