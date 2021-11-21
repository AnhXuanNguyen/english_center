<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/21/2021
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit grade</title>
</head>
<body>
<c:if test="${teach!=null}">
    <c:if test="${cour!=null}">
        <h2>${teach.name} khong day ${cour.name}</h2>
        <h1>Cac giao vien có the day ${cour.name}</h1>
        <c:forEach items="${teacherse}" var="tea">
            <h3>${tea.name}</h3>
        </c:forEach>
    </c:if>
</c:if>
  <c:if test="${grade != null}">
      <form method="post">
      <table>
          <input type="hidden" value="${ministryid}" name="mid">
          <tr>
              <th>Name</th>
              <th><input type="text" name="newname" value="${grade.name}"></th>
          </tr>
          <tr>
              <th>Giao vien phu trach</th>
              <td>
                  <select name="teacher">
                  <c:forEach items="${teachers}" var="t">
                      <option value="${t.id}">${t.name}</option>
                  </c:forEach>
                  </select>
              </td>
          </tr>
          <tr>
              <th>Mon hoc</th>
              <td>
                  <select name="course">
                      <c:forEach items="${courses}" var="c">
                          <option value="${c.id}">${c.name}</option>
                      </c:forEach>
                  </select>
              </td>
          </tr>
          <tr>
              <td><input type="submit" name="Edit"></td>
          </tr>
      </table>
          </form>
  </c:if>
</body>
</html>
