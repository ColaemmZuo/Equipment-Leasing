<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Equipment Leasing Management">
    <meta name="author" content="Zuo">
    <link rel="icon" href="${pageContext.request.contextPath}/fonts/favicon.ico">

    <title>建筑工地设备租赁管理系统</title>

    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">


</head>

<body>

<c:if test="${(requestScope.get('msg') == 'login wrong')}">
    <script>
        alert("用户名或密码有误！");
        $(window).attr('location','${pageContext.request.contextPath}/user/toUserLogin');
    </script>
</c:if>

<div class="container">

    <form class="form-signin" id="form_signin" >
        <h2 class="form-signin-heading" style="text-align:center;">设备租赁管理系统</h2>

        <input  name="username" id="inputEmail"  class="form-control" placeholder="用户名" required autofocus>

        <input  name="password" id="inputPassword" class="form-control" required  placeholder="密码" >

        <div class="radio">
            <label>
                <h4><input id="input1"  name="user-type" type="radio" class="radio-button" value="1" checked>租赁方</h4>
            </label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label >
                <h4><input id="input2" name="user-type" type="radio" class="radio-button" value="2" > 承租方</h4>
            </label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label >
                <h4><input id="input3" name="user-type" type="radio" class="radio-button" value="3" > 管理员</h4>
            </label>
        </div>
        <button  id="signin" class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        <a id="register"  href="${pageContext.request.contextPath}/user/toAddUser" class="btn btn-lg btn-primary btn-block" type="submit">注册</a>

        <script>
            $(function () {
                $('#signin').click(function () {
                    var type =  $('input[name="user-type"]:checked').val();
                    if (type == "1"){
                        $('#form_signin').attr("action","${pageContext.request.contextPath}/lease/leaseLogin");
                    } else if (type == "2") {
                        $('#form_signin').attr("action","${pageContext.request.contextPath}/leasing/leasingLogin");
                    } else if (type == "3") {
                        $('#form_signin').attr("action","${pageContext.request.contextPath}/admin/adminLogin");
                    } else {alert("登录时发生错误！");
                    }
                });
            })
        </script>


    </form>

</div> <!-- /container -->

</body>
</html>