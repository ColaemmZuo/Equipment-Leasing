<%--
  Created by IntelliJ IDEA.
  User: ColaemmZuo
  Date: 2021/4/14
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍展示</title>

    <%--bookstrap--%>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 ———— 显示书籍</small>
                </h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增书籍</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">显示全部书籍</a>
            </div>



            <!--查询功能-->
            <div class="col-md-8 column">
                <form class="form-inline" action="${pageContext.request.contextPath}/book/queryBook" method="post" style="float: right">
                    <span style="color: red;font-weight: bold">${error}</span>
                    <input type="text" class="form-control" name="queryBookName" placeholder="请输入要查询的书籍名称">
                    <input type="submit" value="查询" class="btn btn-primary">

                </form>
            </div>

        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>书籍编号</th>
                        <th>书籍名称</th>
                        <th>书籍数量</th>
                        <th>书籍详情</th>
                        <th>操作</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="book" items="${requestScope.get('list')}">
                        <tr>
                            <td>${book.getBookID()}</td>
                            <td>${book.getBookName()}</td>
                            <td>${book.getBookCounts()}</td>
                            <td>${book.getDetail()}</td>
                            <td>

                                <a href="${pageContext.request.contextPath}/book/toUpdate?id=${book.getBookID()}">修改</a>
                                &nbsp;  |  &nbsp;
                                <a href="${pageContext.request.contextPath}/book/deleteBook/${book.getBookID()}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>
