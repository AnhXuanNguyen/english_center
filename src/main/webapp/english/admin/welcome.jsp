<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 2:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Welcome Admin</title>
</head>
<body>
  <c:if test="${admin != null}">
    <h1>Hello ${admin.name}</h1>
      <a href="/Adminservlet?action=info">Xem thong tin</a>
      <a href="/Adminservlet?action=edit">Sua thong tin</a>
      <a href="/Adminservlet?action=editpass">Doi mat khau</a>
      <a href="/Adminservlet?action=logout">Dang xuat</a>
      <a href="/MinistryServlet?action=listministry">Giao vu</a>
  </c:if>
</body>
</html>
