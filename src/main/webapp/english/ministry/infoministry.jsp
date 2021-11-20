<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ministry info</title>
</head>
<body>
<c:if test="${ministry != null}">
    <table>
        <tr>
            <th>Ten</th>
            <td>${ministry.name}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>${ministry.email}</td>
        </tr>
        <tr>
            <th>Ngay sinh</th>
            <td>${ministry.dob}</td>
        </tr>
        <tr>
            <th>Dia chi</th>
            <td>${ministry.address}</td>
        </tr>
        <tr>
            <th>SDT</th>
            <td>${ministry.phone}</td>
        </tr>
    </table>
    <a href="/MinistryServlet?action=welcome&id=${ministry.id}">quay lai trang chu</a>
</c:if>
</body>
</html>
