<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/10/22
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
    String method = request.getMethod();
    %>
  <form action="result.jsp" method="post">
    请输入圆的半径:<input type="text" name="radius">
    <input type="submit" value="计算">
  </form>
    <%=request.getMethod()%>
</body>
</html>
