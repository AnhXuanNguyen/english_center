<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello Ministry</title>
</head>
<body>
    <c:if test="${ministry != null}">
        <h1>Hello ${ministry.name}</h1>
        <a href="/MinistryServlet?action=info&id=${ministry.id}">Xem thong tin</a>
        <a href="/MinistryServlet?action=editpass&id=${ministry.id}">Doi mat khau</a>
        <a href="/TeacherServlet?action=list&id=${ministry.id}">danh sach giao vien</a>
        <a href="/CourseServlet?action=CourseServlet&id=${ministry.id}">Danh sach khoa hoc</a>
        <a href="/MinistryServlet?action=logout">Dang xuat</a>
    </c:if>
</body>
</html>
