<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/20/2021
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit teacher</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body{margin-top:20px;}
        .avatar{
            width:200px;
            height:200px;
        }
    </style>
</head>
<body>
<c:if test="${mes != null}">
    <h2>${mes}</h2>
</c:if>
<c:if test="${teacher != null}">
    <div class="container bootstrap snippets bootdey">
        <h1 class="text-primary">Edit Password Profile</h1>
        <hr>
        <div class="row">
            <!-- left column -->
            <div class="col-md-3">
                <div class="text-center">
                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" class="avatar img-circle img-thumbnail" alt="avatar">
                    <h6>Upload a different photo...</h6>

                    <input type="file" class="form-control">
                </div>
            </div>

            <!-- edit form column -->
            <div class="col-md-9 personal-info">
                <div class="alert alert-info alert-dismissable">
                    <a class="panel-close close" data-dismiss="alert">×</a>
                    <i class="fa fa-coffee"></i>
                    This is an <strong>.alert</strong>. Use this to show important messages to the user.
                </div>
                <h3>Personal info</h3>

                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Enter New Name</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${teacher.name}" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Enter New Email </label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" name="email" value="${teacher.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Enter New Date Of Birth</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" name="dob" value="${teacher.dob}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Enter New Address</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" name="address" value="${teacher.address}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Enter New Phone Number</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" name="phone" value="${teacher.phone}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Time Zone:</label>
                        <div class="col-lg-8">
                            <div class="ui-select">
                                <select id="user_time_zone" class="form-control">
                                    <option value="Hawaii">(GMT-10:00) Hawaii</option>
                                    <option value="Alaska">(GMT-09:00) Alaska</option>
                                    <option value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
                                    <option value="Arizona">(GMT-07:00) Arizona</option>
                                    <option value="Mountain Time (US &amp; Canada)">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
                                    <option value="Central Time (US &amp; Canada)" selected="selected">(GMT-06:00) Central Time (US &amp; Canada)</option>
                                    <option value="Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
                                    <option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Edit">
                    </div>
                </form>
                <a href="/MinistryServlet?action=welcome&id=${ministryid}">Back To Home Page</a>
            </div>
        </div>
    </div>
    <hr>
</c:if>
</body>
</html>
