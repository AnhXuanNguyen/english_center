<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Ministry info</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:if test="${ministry != null}">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>Ten</th>--%>
<%--            <td>${ministry.name}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th>Email</th>--%>
<%--            <td>${ministry.email}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th>Ngay sinh</th>--%>
<%--            <td>${ministry.dob}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th>Dia chi</th>--%>
<%--            <td>${ministry.address}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th>SDT</th>--%>
<%--            <td>${ministry.phone}</td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--    <a href="/MinistryServlet?action=welcome&id=${ministry.id}">quay lai trang chu</a>--%>
<%--</c:if>--%>
<%--</body>--%>
<%--</html>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Minitry info</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .inf-content {
            border: 1px solid #DDDDDD;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
        }

        body {
            background-color: #f3c63c;
        }
    </style>
</head>
<body>
<c:if test="${ministry != null}">

    <div style="margin-top:30px " class="container bootstrap snippets bootdey">
        <div class="panel-body inf-content">
            <div class="row">
                <div class="col-md-4">
                    <img alt="" style="width:600px;" title="" class="img-circle img-thumbnail isTooltip"
                         src="https://anhdepfree.com/wp-content/uploads/2020/05/hinh-anh-tham-tu-lung-danh-conan.jpg" data-original-title="Usuario">
                    <ul title="Ratings" class="list-inline ratings text-center">
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <strong>Information</strong><br>
                    <div class="table-responsive">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td>
                                    <strong>
                                        <span class="glyphicon glyphicon-user  text-primary"></span>
                                        Name
                                    </strong>
                                </td>
                                <td class="text-primary">
                                        ${ministry.name}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>
                                        <span class="glyphicon glyphicon-calendar text-primary"></span>
                                        User Name
                                    </strong>
                                </td>
                                <td class="text-primary">
                                        ${ministry.username}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>
                                        <span class="glyphicon glyphicon-calendar text-primary"></span>
                                        ID
                                    </strong>
                                </td>
                                <td class="text-primary">
                                        ${ministry.id}
                                </td>
                            <tr>
                                <td>
                                    <strong>
                                        <span class="glyphicon glyphicon-cloud text-primary"></span>
                                        Email
                                    </strong>
                                </td>
                                <td class="text-primary">
                                        ${ministry.email}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>
                                        <span class="glyphicon glyphicon-bookmark text-primary"></span>
                                        Date Of Birth
                                    </strong>
                                </td>
                                <td class="text-primary">
                                        ${ministry.dob}
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <strong>
                                        <span class="glyphicon glyphicon-eye-open text-primary"></span>
                                        Address
                                    </strong>
                                </td>
                                <td class="text-primary">
                                        ${ministry.address}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>
                                        <span class="glyphicon glyphicon-envelope text-primary"></span>
                                        Phone Number
                                    </strong>
                                </td>
                                <td class="text-primary">
                                        ${ministry.phone}
                                </td>
                            </tr>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%--    <!--    <%&#45;&#45;    <table class="table table-striped table-hover">&#45;&#45;%>-->--%>
<p align="center" style="margin: 20px">
    <a href="/MinistryServlet?action=welcome&id=${ministry.id}">Back to Ministry home</a>
</p>
</c:if>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>

