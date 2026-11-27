<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/11/19
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
sessionId = <%=session.getId()%> <br>
<%
  Cookie[] cookies = request.getCookies();
  if(cookies != null){
    for(Cookie cookie:cookies){
      out.println(cookie.getName() + ": " + cookie.getValue() + "<br>");
    }
  }
%>
</body>
</html>
