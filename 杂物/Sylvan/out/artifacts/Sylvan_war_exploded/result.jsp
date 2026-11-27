<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/10/22
  Time: 8:41
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
  <%
    if("POST".equals(method)) {
      double radius = Double.parseDouble(request.getParameter("radius"));
      out.print("圆的周长是：" + 2 * 3.14 * radius + "<br>");
      out.print("圆的面积是" + 3.14 * radius * radius);
    }
  %>
</body>
</html>
