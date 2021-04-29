<%--
  Created by IntelliJ IDEA.
  User: ColaemmZuo
  Date: 2021/4/17
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>中转页面</title>
    <style>
        body{background-color: #eee}
    </style>
</head>
<body>

    <script type="text/javascript">
        onload = function() {
            setInterval(go, 1000);
        };
        var x = 3; //利用了全局变量来执行
        function go() {
            x--;
            if (x > 0) {
                document.getElementById("sp").innerHTML = x; //每次设置的x的值都不一样了。
            } else {
                location.href = '${pageContext.request.contextPath}/index.jsp';

            }
        }
    </script>


    <div style="text-align: center;width: 400px;height: 100px;left:37%;top:20%;position: absolute;font-size: 18px;border: solid 1px ;line-height: 100px;">
        ${msg},
        <span id="sp" style="color: red;">3</span>
        秒后返回首页
    </div>



</body>
</html>
