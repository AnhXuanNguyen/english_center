<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/21/2021
  Time: 2:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit course</title>
</head>
<body>
<form method="post">
    <c:if test="${course != null}">
        <tr>
            <th>Name</th>
            <td><input type="text" name="name" value="${course.name}"></td>
            <td><input type="submit" value="Edit"></td>
        </tr>
        <input type="hidden" name="mid" value="${ministryid}">
    </c:if>
</form>
<a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>
</body>
</html>
