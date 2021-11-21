<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/21/2021
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Grade</title>
</head>
<body>
<form method="post">
    <tr>
        <th>Grade name</th>
        <td><input type="text" name="name"></td>
        <th><input type="hidden" name="ministryid" value="${ministryid}"></th>
        <td><input type="submit" value="Them"></td>
    </tr>
    <a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>
</form>
</body>
</html>
