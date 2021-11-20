<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 5:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List course</title>
</head>
<body>
<table>
    <tr><th>Name</th></tr>
    <a href="/CourseServlet?action=create&mid=${ministryid}">Them</a>
    <c:forEach items="${courses}" var="course">
        <tr>
            <td>${course.name}</td>
            <td><a href="/CourseServlet?action=edit&id=${course.id}&mid=${ministryid}">Sua</a></td>
            <td><a href="/CourseServlet?action=drop&id=${course.id}&mid=${ministryid}">Xoa</a></td>
        </tr>
    </c:forEach>
    <a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>
</table>
</body>
</html>
