<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 12:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
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
<c:if test="${mes != null}">
<h2 align="center">${mes}</h2>
</c:if>
<div class="container">
    <h3 style="margin-left: 40px"><a style="color: yellow" href="/MinistryServlet?action=create">THÊM GIÁO VỤ</a></h3>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h2 align="center" class="card-title m-b-0">Danh sách Giáo vụ</h2>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead class="thead-light">
                        <tr>
                            <%--              <!--                            <th> <label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> </label> </th>-->--%>
                            <th scope="col">Tên</th>
                            <th scope="col">Email</th>
                            <th scope="col">Ngày Sinh</th>
                            <th scope="col">Địa chỉ</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody class="customtable">
                        <c:forEach items="${ministrylist}" var="ministry">
                            <tr>
                                    <%--                <!--                            <th> <label class="customcheckbox"> <input type="checkbox" class="listCheckbox"> </label> </th>-->--%>
                                <td>&ensp;&ensp;${ministry.name}</td>
                                <td>${ministry.email}</td>
                                <td>&ensp;${ministry.dob}</td>
                                <td>&ensp;${ministry.address}</td>
                                <td>&ensp;&ensp;${ministry.phone}</td>
                                <td>
                                    <a href="/MinistryServlet?action=edit&id=${ministry.id}">Edit</a>&ensp;
                                    <a href="/MinistryServlet?action=drop&id=${ministry.id}">Delete</a>
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
<a style="color:white; margin: 30px" href="/Adminservlet?action=welcome">Quay lại trang chủ</a>

</html>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Ministry List</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:if test="${mes != null}">--%>
<%--  <h2>${mes}</h2>--%>
<%--</c:if>--%>
<%--<td><a href="/MinistryServlet?action=create">Them</a></td>--%>
<%--<table>--%>
<%--  <tr>--%>
<%--    <th>Ten</th>--%>
<%--    <th>Email</th>--%>
<%--    <th>Ngay Sinh</th>--%>
<%--    <th>Dia chi</th>--%>
<%--    <th>Sdt</th>--%>
<%--  </tr>--%>
<%--    <c:forEach items="${ministrylist}" var="ministry">--%>
<%--      <tr>--%>
<%--        <td>${ministry.name}</td>--%>
<%--        <td>${ministry.email}</td>--%>
<%--        <td>${ministry.dob}</td>--%>
<%--        <td>${ministry.address}</td>--%>
<%--        <td>${ministry.phone}</td>--%>
<%--        <td><a href="/MinistryServlet?action=edit&id=${ministry.id}">Sua</a></td>--%>
<%--        <td><a href="/MinistryServlet?action=drop&id=${ministry.id}">Xoa</a></td>--%>
<%--      </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--<a href="/Adminservlet?action=welcome">quay lai trang chu</a>--%>
<%--</body>--%>
<%--</html>--%>
