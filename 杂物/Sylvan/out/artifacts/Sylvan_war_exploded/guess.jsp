<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>
<html>
<style>
  h3{
    font-family: "Segoe UI";
    background-color: darkseagreen;
  }
</style>
<body>
  <%! int num = 0; %>
  <%
    String method = request.getMethod();
  %>
  <%
    if("GET".equals(method)){
      Random random = new Random();
      num = random.nextInt(100) + 1;
  %>
  <h3>猜数字游戏(1~100)</h3>
  <form method="post">
    输入数字：<input type="number" name="guess">
    <input type="submit" value="提交">
  </form>
  <%
    }else{
      String guessStr = request.getParameter("guess");
      int guess = Integer.parseInt(guessStr);
      if(guess == num){
        out.print("<h3>恭喜，猜对了！答案是"+num+"</h3>");
        out.print("<a href=''>重新开始</a>");
    }else if(guess > num){
      out.print("<h3>猜大了</h3>");
  %>
  <form method="post">
    再次输入：<input type="number" name="guess">
    <input type="submit" value="提交">
  </form>
  <%
  }else{
    out.print("<h3>猜小了</h3>");
  %>
  <form method="post">
    再次输入：<input type="number" name="guess">
    <input type="submit" value="提交">
  </form>
  <%
    }
  }
%>
</body>
</html>
