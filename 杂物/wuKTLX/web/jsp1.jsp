<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/9/18
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>代码片段内容</title>
  <!--
  记得要导入jsp-api和servlet-api
  file -> project structure -> libraries -> + -> tomcat -> lib
  -->
</head>
<body>
  选择出生日期：
  <select name="year">
    <!--
    <option value="1930">1930年</option>
    -->
    <%
      for(int i = 1930;i<=2026;i++){
        String s = "<option value=\"" + i + "\">" + i + "年</option>";
        out.println(s);
      }
    %>
  </select>
  <select name="month">
    <!--
    <option value="1930">1930年</option>
    -->
    <%
      for(int i = 1;i<=12;i++){
        String s = "<option value=\"" + i + "\">" + i + "月</option>";
        out.println(s);
      }
    %>
  </select>
  <select name="day">
    <!--
    <option value="1930">1930年</option>
    -->
    <%
      for(int i = 1;i <= 31;i++){
        String s = "<option value=\"" + i + "\">" + i + "日</option>";
        out.println(s);
      }
    %>
  </select>
</body>
</html>
