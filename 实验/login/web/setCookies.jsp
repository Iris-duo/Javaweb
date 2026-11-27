<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/11/19
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    Cookie cookie = new Cookie("username","admin");
    cookie.setMaxAge(600);
    response.addCookie(cookie);
  %>
</body>
</html>
