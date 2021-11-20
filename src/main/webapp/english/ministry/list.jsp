<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 12:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ministry List</title>
</head>
<body>
<c:if test="${mes != null}">
  <h2>${mes}</h2>
</c:if>
<td><a href="/MinistryServlet?action=create">Them</a></td>
<table>
  <tr>
    <th>Ten</th>
    <th>Email</th>
    <th>Ngay Sinh</th>
    <th>Dia chi</th>
    <th>Sdt</th>
  </tr>
    <c:forEach items="${ministrylist}" var="ministry">
      <tr>
        <td>${ministry.name}</td>
        <td>${ministry.email}</td>
        <td>${ministry.dob}</td>
        <td>${ministry.address}</td>
        <td>${ministry.phone}</td>
        <td><a href="/MinistryServlet?action=edit&id=${ministry.id}">Sua</a></td>
        <td><a href="/MinistryServlet?action=drop&id=${ministry.id}">Xoa</a></td>
      </tr>
    </c:forEach>
</table>
<a href="/Adminservlet?action=welcome">quay lai trang chu</a>
</body>
</html>
