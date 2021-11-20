<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 1:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Admin</title>
</head>
<body>
<c:if test="${mes != null}">
    <h2>${mes}</h2>
</c:if>
<form method="post">
    <tr>
        <th>Tên đăng nhập</th>
        <td><input type="text" name="username"></td>
    </tr>
    <tr>
        <th>Mật khẩu</th>
        <td><input type="password" name="password"></td>
    </tr>
    <tr>
        <td colspan="2"><input type="submit" value="Đăng nhập"></td>
    </tr>
</form>
</body>
</html>
