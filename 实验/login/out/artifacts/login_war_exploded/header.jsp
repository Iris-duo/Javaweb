
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%//判断是否登录
    String user = "";
    String password = "";
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie cookie: cookies){
            if("username".equals(cookie.getName())){
                user = cookie.getValue();
            }
            if("password".equals(cookie.getName())){
                password = cookie.getValue();
            }
        }
        if("admin".equals(user) && "123".equals(password)){
            session.setAttribute("username",user);
        }
    }

    String username = (String)session.getAttribute("username");
    if(username != null){
        out.println("欢迎您 " + username + "!");
        out.println("<a href='user?method=logout'>退出登录</a>");
    }else{
%>

<%//显示提示信息
String msg = (String)session.getAttribute("msg");
if(msg != null){
    session.removeAttribute("msg");
    out.println("<font color = red>" + msg + "</font>");
}
%>

  <form action="user?method=login" method="post">
      用户名：<input type="text" name="username">
      密码：<input type="password" name="password">
      <select name="age">
          <option value="0">不自动登录</option>
          <option value="1">1天</option>
          <option value="7">1周</option>
          <option value="30">1月</option>
      </select>
      <input type="submit" value="登录">
  </form>
<% } %>
<hr>
<hr>

</body>
</html>
