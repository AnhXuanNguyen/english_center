<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 2:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<c:if test="${mes != null}">
    <h2>${mes}</h2>
</c:if>
    <c:if test="${admin != null}">
<h1 align="center">Please edit your information</h1>
    <form method="post">
        <table border="1" class="table table-success table-striped">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Date of birth</th>
                <th>Address</th>
                <th>Phone Number</th>
            </tr>
            <tr>
                <td><input type="text" name="name" value="${admin.name}"></td>
                <td><input type="text" name="email" value="${admin.email}"></td>
                <td><input type="date" name="dob" value="${admin.dob}"></td>
                <td><input type="text" name="address" value="${admin.address}"></td>
                <td><input type="text" name="phone" value="${admin.phone}"></td>
            </tr>
            <tr><td><input type="submit" value="Edit"></td></tr>
        </table>
    </form>
    <div align="center">
        <a href="/Adminservlet?action=welcome">
            <button>Back To HomePage</button>
        </a>
    </div>

    </c:if>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
