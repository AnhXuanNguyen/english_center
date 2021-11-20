<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher info</title>
</head>
<body>
<c:if test="${teacher != null}">
    <table>
        <tr>
            <th>Ten</th>
            <td>${teacher.name}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>${teacher.email}</td>
        </tr>
        <tr>
            <th>Ngay sinh</th>
            <td>${teacher.dob}</td>
        </tr>
        <tr>
            <th>Dia chi</th>
            <td>${teacher.address}</td>
        </tr>
        <tr>
            <th>SDT</th>
            <td>${teacher.phone}</td>
        </tr>
    </table>
    <a href="/TeacherServlet?action=welcome&id=${teacher.id}">quay lai trang chu</a>
</c:if>
</body>
</html>
