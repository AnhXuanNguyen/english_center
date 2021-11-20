<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List teacher</title>
</head>
<body>
<c:if test="${mes != null}">
    <h2>${mes}</h2>
</c:if>
<td><a href="/TeacherServlet?action=create&id=${ministryid}">Them</a></td>
<table>
    <tr>
        <th>Ten</th>
        <th>Email</th>
        <th>Ngay Sinh</th>
        <th>Dia chi</th>
        <th>Sdt</th>
    </tr>
    <c:forEach items="${teachers}" var="teacher">
        <tr>
            <td>${teacher.name}</td>
            <td>${teacher.email}</td>
            <td>${teacher.dob}</td>
            <td>${teacher.address}</td>
            <td>${teacher.phone}</td>
            <td><a href="/TeacherServlet?action=edit&id=${teacher.id}&mid=${ministryid}">Sua</a></td>
            <td><a href="/TeacherServlet?action=drop&id=${teacher.id}&mid=${ministryid}">Xoa</a></td>
        </tr>
    </c:forEach>
</table>
<a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>
</body>
</html>
