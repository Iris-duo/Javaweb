<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/11/26
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
<body>
<form action="reg" method="post">
    <%-- 【补充】表里 username、password 是 varchar(20)，不限制长度会报 Data too long 导致注册失败 --%>
    用户名：<input type="text" name="username" maxlength="20"><br>
    密码：<input type="password" name="password" maxlength="20"><br>
    年龄：<input type="text" name="age"><br>
    简介：<textarea name="description" cols="30" rows="10"></textarea><br>
    <input type="submit" value="注册">
</form>
</body>
</html>