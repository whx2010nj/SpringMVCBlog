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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>SpringMVC 修改博客</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <%--<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>--%>
    <%--<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>--%>
</head>
<body>


<div class="container">

    <h1>SpringMVC 修改博客</h1>
    <hr/>
    <%--在所有的input标签中，name一定要与UserEntity中的成员相同，不然无法找到--%>
    <form:form action="/admin/blogs/updateP" method="post" commandName="blogP" role="form">
        <%--把id一并写入userP中--%>
        <input type="hidden" id="id" name="id" value="${blog.id}">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Enter Title:"
                   value="${blog.title}"/>
        </div>
        <div class="form-group">
            <label for="userByUserId.id">Author:</label>
            <select type="text" class="form-control" id="userByUserId.id" name="userByUserId.id">

                <c:forEach items="${userList}" var="user">
                    <option value="${user.id}"
                            selected="selected">${user.nickname}, ${user.firstName} ${user.lastName}</option>
                </c:forEach>

            </select>
        </div>
        <div class="form-group">
            <label for="content">Content:</label>
            <textarea type="text" class="form-control" id="content" name="content" placeholder="Please Input Content"
                      rows="3">
                    ${blog.content}
            </textarea>
        </div>
        <div class="form-group">
            <label for="pubDate">Password:</label>
            <input type="date" class="form-control" id="pubDate" name="pubDate" value="<fmt:formatDate value="${blog.pubDate}"
      pattern="yyyy-MM-dd"/>"/>
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