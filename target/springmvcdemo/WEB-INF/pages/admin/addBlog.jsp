<%--
  Created by IntelliJ IDEA.
  User: wanghongxiang
  Date: 16/7/2
  Time: 下午5:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>SpringMVC 添加博客</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <%--<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>--%>
    <%--<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>--%>
</head>
<body>


<div class="container">

    <h1>SpringMVC 添加博客</h1>
    <hr/>
    <%--在所有的input标签中，name一定要与UserEntity中的成员相同，不然无法找到--%>
    <form:form action="/admin/blogs/addP" method="post" commandName="blog" role="form">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Enter Title:"/>
        </div>
        <div class="form-group">
            <label for="userByUserId.id">Author:</label>
            <select class="form-control" id="userByUserId.id" name="userByUserId.id">
                <c:forEach items="${userList}" var="user">
                    <option value="${user.id}">${user.nickname}, ${user.firstName} ${user.lastName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="content">Content:</label>
            <textarea class="form-control" id="content" name="content" rows="3" placeholder="Please Input Content"></textarea>
        </div>
        <div class="form-group">
            <label for="pubDate">Publish Date:</label>
            <input type="date" class="form-control" id="pubDate" name="pubDate"/>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>

    </form:form>

</div>


<!--jQuery文件。务必在bootstrap.min.js之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!--最新的Bootstrap核心 Javascipt文件-->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>