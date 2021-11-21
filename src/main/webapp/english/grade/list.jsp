<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/21/2021
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Grade list</title>
</head>
<body>
<a href="/GradeServlet?action=create&id=${ministryid}">Them</a>
<table>
    <tr>
        <th>Grade name</th>
        <th>Giao vien</th>
        <th>Mon hoc</th>
        <th>Student list</th>
        <th>Nhat ky</th>
    </tr>
    <c:forEach items="${grades}" var="g">
        <tr>
            <td>${g.name}</td>
            <c:if test="${g.teacher != null}">
                <td>${g.teacher.getName()}</td>
            </c:if>
            <c:if test="${g.teacher == null}">
                <td></td>
            </c:if>
            <c:if test="${g.course != null}">
                <td>${g.course.getName()}</td>
            </c:if>
            <c:if test="${g.course == null}">
                <td></td>
            </c:if>
            <td><a href="">Chi tiet</a></td>
            <td><a href="">Chi tiet</a></td>
            <td><a href="/GradeServlet?action=edit&id=${g.id}&mid=${ministryid}">Sua</a></td>
            <td><a href="/GradeServlet?action=drop&id=${g.id}&mid=${ministryid}">Xoa</a></td>
        </tr>
    </c:forEach>
</table>
<a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>
</body>
</html>
