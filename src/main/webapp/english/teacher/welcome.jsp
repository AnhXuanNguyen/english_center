<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${teacher.name}</title>
</head>
<body>
<c:if test="${teacher != null}">
    <h1>Hello ${teacher.name}</h1>
    <a href="/TeacherServlet?action=info&id=${ministry.id}">Xem thong tin</a>
    <a href="/TeacherServlet?action=editpass&id=${ministry.id}">Doi mat khau</a>
    <a href="/TeacherServlet?action=logout">Dang xuat</a>
</c:if>
</body>
</html>
