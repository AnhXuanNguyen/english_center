<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/21/2021
  Time: 3:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Course</title>
</head>
<body>
<form method="post">
    <table>
        <input type="hidden" name="mid" value="${ministryid}">
        <tr>
            <th>Name</th>
            <td><input type="text" name="name"></td>
            <td><input type="submit" value="Them khoa hoc"></td>
        </tr>

    </table>
    <a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>
</form>
</body>
</html>
