<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit pass</title>
</head>
<body>
<c:if test="${teacher!=null}">
    <c:if test="${mes!=null}">
        <h2>${mes}</h2>
    </c:if>
    <form method="post">
        <table>
            <tr>
                <th>Nhap mat khau cu</th>
                <td><input type="password" name="oldpass"></td>
            </tr>
            <tr>
                <th>Nhap mat khau moi</th>
                <td><input type="password" name="newpass"></td>
            </tr>
            <tr>
                <th>Nhap lai mat khau</th>
                <td><input type="password" name="repass"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Doi mat khau"></td>
            </tr>
        </table>
    </form>
    <a href="/TeacherServlet?action=welcome&id=${teacher.id}">quay lai trang chu</a>
</c:if>
</body>
</html>
