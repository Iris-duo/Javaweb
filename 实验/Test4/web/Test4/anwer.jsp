<%@ page contentType="text/html; charset=UTF-8" %>
<html style="background-color: cyan;">
<head><title>答题结果</title></head>
<body>
<%
  int score = 0;

  String q1 = request.getParameter("q1");
  String q2 = request.getParameter("q2");

  if ("B".equals(q1)) {
    score += 1;
  }
  if ("A".equals(q2)) {
    score += 1;
  }

  out.print("您得了" + score + "分");
%>
</body>
</html>