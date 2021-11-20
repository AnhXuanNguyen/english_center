<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 6:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create teacher</title>
</head>
<body>
<form method="post">
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>DOB</th>
            <th>Address</th>
            <th>Phone</th>
            <th>User</th>
            <th>Passwor</th>
            <th>Courses</th>
        </tr>
        <tr>
            <td><input type="text" name="name"></td>
            <td><input type="text" name="email"></td>
            <td><input type="date" name="dob"></td>
            <td><input type="text" name="address"></td>
            <td><input type="number" name="phone"></td>
            <td><input type="text" name="username"></td>
            <td><input type="password" name="password"></td>
            <td>
                <select name="courseid" multiple>
                <c:forEach items="${courses}" var="course">
                    <option value="${course.id}">${course.name}</option>
                </c:forEach>
                </select>
            </td>
        </tr>
        <td>
            <td><input type="submit" value="add"></td>
        </tr>
    </table>
</form>
<a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>
</body>
</html>
