<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 2:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Admin</title>
</head>
<body>
<c:if test="${mes != null}">
    <h2>${mes}</h2>
</c:if>
    <c:if test="${admin != null}">
        <form method="post">
            <table border="1">
            <tr>
                <th>Ten</th>
                <th>Email</th>
                <th>Ngay sinh</th>
                <th>Noi o</th>
                <th>SDT</th>
            </tr>
            <tr>
                <td><input type="text" name="name" value="${admin.name}"></td>
                <td><input type="text" name="email" value="${admin.email}"></td>
                <td><input type="date" name="dob" value="${admin.dob}"></td>
                <td><input type="text" name="address" value="${admin.address}"></td>
                <td><input type="text" name="phone" value="${admin.phone}"></td>
            </tr>
            <tr><td><input type="submit" value="Edit"></td></tr>
            </table>
        </form>
        <a href="/Adminservlet?action=welcome">quay lai trang chu</a>
    </c:if>
</body>
</html>
