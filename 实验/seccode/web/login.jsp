<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/11/12
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<script>
    function reloadCode(){
        let img = document.querySelector("#seccode");
        img.src="seccode?t=" + Math.random();
    }
</script>
<body>
<%
    String msg = (String)request.getAttribute("msg");
    if(msg!=null){
        out.println("<font color='red'>" + msg  + "</font>");
    }
%>
    <form action="login" method="post">
        用户名：<input type="text" name="username"><br>
        密  码：<input type="password" name="password"><br>
        验证码：<input type="text" name="seccode">
        <img id="seccode" onclick="reloadCode();" style="cursor: pointer" src="seccode" alt=""width="200" height="50"><br>
        <input type="submit" value="登录">
    </form>
</body>
</html>
