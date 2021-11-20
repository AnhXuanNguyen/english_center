<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>HOME PAGE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
      .card-header{
        background-color: bisque;
      }
      *{
        background-image: url("https://nhathauxaydung24h.com/wp-content/uploads/2021/11/nen-trang-dep-1.jpg");
        background-size: cover;
      }

      .link{
        background-color: white;
      }
    </style>
  </head>
  <body>
  <div class="card text-center">
    <div class="card-header">
      B-A-T-A CENTER
    </div>
    <div class="card-body">
      <h5 class="card-title">Thank you for using our service</h5>
      <p class="card-text">Where you want to go, sir?</p>
      <div class="link">
        <a href="/Adminservlet?action=Adminservlet">
          <button>Admin</button>
        </a>
        <a href="/MinistryServlet?action=Ministryservlet">
          <button>Ministry</button>
        </a>
        <a href="/TeacherServlet?action=TeacherServlet">
          <button>Teacher</button>
        </a>
      </div>

    </div>
    <div class="card-footer text-muted">
      Raising over your limit
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>

