<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/9/27
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    //设置用什么编码接受参数值
    request.setCharacterEncoding("UTF-8");

    //设置发送客户端的编码
    //response.setCharacterEncoding("UTF-8");
    // response.setContentType("test/html;charset=UTF-8");

    //getParameter("");返回的是字符串
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if("admin".equals(username) && "123456".equals(password)){
%>
    <jsp:forward page="loginSuccess.jsp">
        <jsp:param name="username" value="<%=username%>"/>
    </jsp:forward>
<%
    }else{
%>
    <jsp:forward page="login.jsp">
        <jsp:param name="msg" value="请输入正确的用户名和密码"/>
    </jsp:forward>
<%
    }
%>
</body>
</html>
