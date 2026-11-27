<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/9/18
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>声明标识</title>
</head>
<body>
<!--
    只有一个servlet实例
-->
    <%
        int a=1;
    %>

    <%!
        int b=1;
    %>

    <%!
        int sum(int a,int b){
            return a+b;
        }
    %>

    <%
        out.println("a=" + a++);
        out.println("<br>b=" + b++);
        out.println("<br>"+ a + "+" + b + "=" + sum(a,b));
    %>
</body>
</html>
