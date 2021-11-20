<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit ministry</title>
</head>
<body>
<c:if test="${mes != null}">
  <h2>${mes}</h2>
</c:if>
<c:if test="${ministry != null}">
  <form method="post">
    <table border="1">
      <tr>
        <th>Ten</th>
        <th>Email</th>
        <th>Ngay sinh</th>
        <th>Noi o</th>
        <th>SDT</th>
      </tr>
      <tr>
        <td><input type="text" name="name" value="${ministry.name}"></td>
        <td><input type="text" name="email" value="${ministry.email}"></td>
        <td><input type="date" name="dob" value="${ministry.dob}"></td>
        <td><input type="text" name="address" value="${ministry.address}"></td>
        <td><input type="text" name="phone" value="${ministry.phone}"></td>
      </tr>
      <tr><td><input type="submit" value="Edit"></td></tr>
    </table>
  </form>
  <a href="/MinistryServlet?action=listministry">quay lai danh sach giao vu</a>
</c:if>
</body>
</html>
