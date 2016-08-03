<%--
  Created by IntelliJ IDEA.
  User: wanghongxiang
  Date: 16/7/2
  Time: 下午5:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>SpringMVC 用户管理</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <%--<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>--%>
    <%--<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>--%>
</head>
<body>


<div class="container">

    <h1>SpringMVC 博客系统-用户管理</h1>
    <hr/>

    <h3>所有用户<a href="/admin/users/add" type="button" class="btn btn-primary btn-sm">添加</a></h3>
    <%--如果用户列表为空--%>
    <c:if test="${empty userList}">
        <div class="alter alter-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>User表为空,请<a href="/admin/users/add"
                                                                                              type="button"
                                                                                              class="btn btn-primary btn-sm">添加</a>
        </div>
    </c:if>

    <%--如果用户列表非空--%>
    <c:if test="${!empty userList}">
        <table class="table table-bordered table-stripe">
            <tr>
                <th>ID</th>
                <th>昵称</th>
                <th>姓名</th>
                <th>密码</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.nickname}</td>
                    <td>${user.firstName} ${user.lastName}</td>
                    <td>${user.password}</td>
                    <td>
                        <a href="/admin/users/show/${user.id}" type="button" class="btn btn-sm btn-success">详情</a>
                        <a href="/admin/users/update/${user.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a href="/admin/users/delete/${user.id}" type="button" class="btn btn-sm btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>


</div>


<!--jQuery文件。务必在bootstrap.min.js之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!--最新的Bootstrap核心 Javascipt文件-->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>