<%--
  Created by IntelliJ IDEA.
  User: wanghongxiang
  Date: 16/7/2
  Time: 下午5:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>SpringMVC 添加用户</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <%--<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>--%>
    <%--<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>--%>
</head>
<body>


<div class="container">

    <h1>SpringMVC 添加用户</h1>
    <hr/>
    <%--在所有的input标签中，name一定要与UserEntity中的成员相同，不然无法找到--%>
    <form:form action="/admin/users/addP" method="post" commandName="user" role="form">
        <div class="form-group">
            <label for="nickname">NickName:</label>
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="Enter NickName:"/>
        </div>
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter FirstName:"/>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter LastName:"/>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password:"/>
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