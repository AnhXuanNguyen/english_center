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
</head>
<body>
    <c:if test="${admin != null}">
        <table>
            <tr>
                <th>Ten</th>
                <td>${admin.name}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${admin.email}</td>
            </tr>
            <tr>
                <th>Ngay sinh</th>
                <td>${admin.dob}</td>
            </tr>
            <tr>
                <th>Dia chi</th>
                <td>${admin.address}</td>
            </tr>
            <tr>
                <th>SDT</th>
                <td>${admin.phone}</td>
            </tr>
        </table>
        <a href="/Adminservlet?action=welcome">quay lai trang chu</a>
    </c:if>
</body>
</html>
