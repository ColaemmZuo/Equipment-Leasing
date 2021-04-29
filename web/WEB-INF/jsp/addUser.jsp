<%--
  Created by IntelliJ IDEA.
  User: ColaemmZuo
  Date: 2021/4/14
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Equipment Leasing Management">
    <meta name="author" content="Zuo">
    <title>建筑工地设备租赁管理系统</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/fonts/favicon.ico">
    <script>
        function a() {
            var type =  $('input[name="user-type"]:checked').val();
            if (type == "1") { a1();}
            else { a2(); }
        }

        function a1() {
            $.post({
                url:"${pageContext.request.contextPath}/a1",
                data:{'username':$("input[name='username']").val()},
                success:function (data) {
                    if (data.toString()==='用户名允许被注册(◍´꒳`◍)') {
                        $("#userInfo").css("color","green");
                    }else {
                        $("#userInfo").css("color","red");
                    }
                    $("#userInfo").html(data);
                }
            })
        }
        function a2() {
            $.post({
                url:"${pageContext.request.contextPath}/a2",
                data:{'username':$("input[name='username']").val()},
                success:function (data) {
                    if (data.toString()==='用户名允许被注册(◍´꒳`◍)') {
                        $("#userInfo").css("color","green");
                    }else {
                        $("#userInfo").css("color","red");
                    }
                    $("#userInfo").html(data);
                }
            })
        }
    </script>





</head>
<body>


<div class="container">

    <form class="form-signin" id="form_signup" >
        <h2 class="form-signin-heading" style="text-align:center;">设备租赁管理系统</h2>

        <input   name="username" id="inputEmail"  class="form-control" placeholder="用户名(以下均为必填项)"
                 onblur="a()" required autofocus>
        <span id="userInfo"></span>

        <input  name="password" id="inputPassword" class="form-control" required  placeholder="密码" >

        <input  name="userphone" id="inputPhone" class="form-control" required  placeholder="手机号码" >

        <div class="radio" >
            <font size="4">用户类型为：</font>
            <label>
                <h4><input id="input1"  name="user-type" type="radio" class="radio-button" value="1" onblur="a()" checked>租赁方</h4>
            </label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label >
                <h4><input id="input2" name="user-type" type="radio" class="radio-button" value="2" onblur="a()"> 承租方</h4>
            </label>
        </div>

        <button  id="signup" class="btn btn-lg btn-primary btn-block" type="submit">注册</button>

        <script>
            $(function () {
                $('#signup').click(function () {

                    if ($("#userInfo").text() != '用户名允许被注册(◍´꒳`◍)') {
                        alert("请正确填写用户名噢(^人^)");
                    } else {
                        var type =  $('input[name="user-type"]:checked').val();
                        if (type == "1"){
                            $('#form_signup').attr("action","${pageContext.request.contextPath}/lease/addLease");
                        } else if (type == "2") {
                            $('#form_signup').attr("action","${pageContext.request.contextPath}/leasing/addLeasing");
                        } else {
                            alert("注册时发生错误！");
                        }
                    }
                });
            })
        </script>
    </form>


</div> <!-- /container -->
</body>
</html>
