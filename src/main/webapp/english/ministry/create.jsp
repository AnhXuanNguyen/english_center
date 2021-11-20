<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 1:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Them Giao vu</title>
</head>
<body>
<form method="post">
    <table>
    <tr>
        <th>Ten</th>
        <th>Email</th>
        <th>Dob</th>
        <th>Address</th>
        <th>Phone</th>
        <th>username</th>
        <th>password</th>
    </tr>
    <tr>
        <td><input type="text" name="name"></td>
        <td><input type="text" name="email"></td>
        <td><input type="date" name="dob"></td>
        <td><input type="text" name="address"></td>
        <td><input type="number" name="phone"></td>
        <td><input type="text" name="username"></td>
        <td><input type="password" name="password"></td>
        <td colspan="2"><input type="submit" value="register"></td>
    </tr>
    </table>
</form>
</body>
</html>
