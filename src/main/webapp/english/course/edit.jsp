<%--
  Created by IntelliJ IDEA.
  User: 84888
  Date: 11/21/2021
  Time: 2:39 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Edit Course</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Sniglet|Raleway:900);


        body, html{
            height: 100%;
            padding: 0;
            margin: 0;
            font-family: 'Sniglet', cursive;
        }
        h1{
            font-weight: normal;
            font-size: 4em;
            font-family: 'Raleway', sans-serif;
            margin: 0 auto;
            margin-top: 30px;
            width: 500px;
            color: #F90;
            text-align: center;

        }

        /* Animation webkit */
        @-webkit-keyframes myfirst
        {
            0% {margin-left: -235px}
            90% {margin-left: 100%;}
            100% {margin-left: 100%;}
        }

        /* Animation */
        @keyframes myfirst
        {
            0% {margin-left: -235px}
            70% {margin-left: 100%;}
            100% {margin-left: 100%;}
        }

        .fish{
            background-image: url('http://www.geertjanhendriks.nl/codepen/form/fish.png');
            width: 235px;
            height: 104px;
            margin-left: -235px;
            position: absolute;
            animation: myfirst 24s;
            -webkit-animation: myfirst 24s;
            animation-iteration-count: infinite;
            -webkit-animation-iteration-count: infinite;
            animation-timing-function: linear;
            -webkit-animation-timing-function: linear;
        }

        #fish{
            top: 120px;
        }

        #fish2{
            top: 260px;
            animation-delay: 12s;
            -webkit-animation-delay: 12s;
        }


        header{
            height: 160px;
            background: url('http://www.geertjanhendriks.nl/codepen/form/golf.png') repeat-x bottom;
        }

        #form{
            height: 100%;
            background-color: #98d4f3;
            overflow: hidden;
            position: relative;

        }
        form{
            margin: 0 auto;
            width: 500px;
            padding-top: 40px;
            color: white;
            position: relative;


        }
        label, input, textarea{
            display: block;
        }
        input, textarea{
            width: 500px;
            border: none;
            border-radius: 20px;
            outline: none;
            padding: 10px;
            font-family: 'Sniglet', cursive;
            font-size: 1em;
            color: #676767;
            transition: border 0.5s;
            -webkit-transition: border 0.5s;
            -moz-transition: border 0.5s;
            -o-transition: border 0.5s;
            border: solid 3px #98d4f3;
            -webkit-box-sizing:border-box;
            -moz-box-sizing:border-box;
            box-sizing:border-box;

        }
        input:focus, textarea:focus{
            border: solid 3px #77bde0;
        }

        textarea{
            height: 100px;
            resize: none;
            overflow: auto;
        }
        input[type="submit"]{
            background-color: #F90;
            color: white;
            height: 50px;
            cursor: pointer;
            margin-top: 30px;
            font-size: 1.29em;
            font-family: 'Sniglet', cursive;
            -webkit-transition: background-color 0.5s;
            -moz-transition: background-color 0.5s;
            -o-transition: background-color 0.5s;
            transition: background-color 0.5s;
        }
        input[type="submit"]:hover{
            background-color: #e58f0e;

        }
        label{
            font-size: 1.5em;
            margin-top: 20px;
            padding-left: 20px;
        }
        .formgroup, .formgroup-active, .formgroup-error{
            background-repeat: no-repeat;
            background-position: right bottom;
            background-size: 10.5%;
            transition: background-image 0.7s;
            -webkit-transition: background-image 0.7s;
            -moz-transition: background-image 0.7s;
            -o-transition: background-image 0.7s;
            width: 566px;
            padding-top: 2px;
        }

        .formgroup{
            background-image: url('http://www.geertjanhendriks.nl/codepen/form/pixel.gif');
        }
        .formgroup-active{
            background-image: url('http://www.geertjanhendriks.nl/codepen/form/octo.png');
        }
        .formgroup-error{
            background-image: url('http://www.geertjanhendriks.nl/codepen/form/octo-error.png');
            color: red;
        }
    </style>
</head>
<body>
<header>
    <h1>UPDATE COURSE</h1>
</header>

<div id="form">

    <div class="fish" id="fish"></div>
    <div class="fish" id="fish2"></div>

    <form id="waterform" method="post">
        <c:if test="${course != null}">
        <div class="formgroup" id="name-form">
            <label for="name">New Course Name*</label>
            <input value="${course.name}" type="text" id="name" name="name" />
        </div>

        <input type="submit" value="Edit Course" />
        <input type="hidden" name="mid" value="${ministryid}">
        </c:if>
    </form>
    <script>
        $('document').ready(function(){
            $('input[type="text"], input[type="email"], textarea').focus(function(){
                var background = $(this).attr('id');
                $('#' + background + '-form').addClass('formgroup-active');
                $('#' + background + '-form').removeClass('formgroup-error');
            });
            $('input[type="text"], input[type="email"], textarea').blur(function(){
                var background = $(this).attr('id');
                $('#' + background + '-form').removeClass('formgroup-active');
            });

            function errorfield(field){
                $(field).addClass('formgroup-error');
                console.log(field);
            }

            $("#waterform").submit(function() {
                var stopsubmit = false;

                if($('#name').val() == "") {
                    errorfield('#name-form');
                    stopsubmit=true;
                }
                if($('#email').val() == "") {
                    errorfield('#email-form');
                    stopsubmit=true;
                }
                if(stopsubmit) return false;
            });

        });
    </script>
</div>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Edit course</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form method="post">--%>
<%--    <c:if test="${course != null}">--%>
<%--        <tr>--%>
<%--            <th>Name</th>--%>
<%--            <td><input type="text" name="name" value="${course.name}"></td>--%>
<%--            <td><input type="submit" value="Edit"></td>--%>
<%--        </tr>--%>
<%--        <input type="hidden" name="mid" value="${ministryid}">--%>
<%--    </c:if>--%>
<%--</form>--%>
<%--<a href="/MinistryServlet?action=welcome&id=${ministryid}">quay lai trang chu</a>--%>
</body>
</html>