
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
  <style>
    .info{
      width: 100%;
      margin: 10px auto;
      text-align: center;
      font-size: 25px;
    }
    table{
      width: 40%;
      margin: 0 auto;
      border-collapse: collapse;
    }
    table,tr,td{
      border: 1px solid #ccc;
    }
    td{
      padding: 5px;
      height: 40px;
    }
    input{
      height: 30px;
      width: 300px;
      outline: none;
     }
    input[type="radio"],input[type="checkbox"]{
      height: 15px;
      width: 20px;
    }

    .title{
      text-align: right;
    }
    .sub{
      text-align: center;
    }
    select{
      width: 100px;
      height: 30px;
      outline: none;
    }
    textarea{
      width: 300px;
      height: 100px;
      resize: none;
      outline: none;
    }
  </style>
</head>
<body>
  <div class="info">用户登录</div>
  <%
    request.setCharacterEncoding("UTF-8");
    String msg = request.getParameter("msg");
    if(msg!=null){
  %>
  <div class="info" style ="color: aquamarine"><%=request.getParameter("msg")%>></div>
  <%}%>
  <form action="loginAction.jsp" method="post">
    <table>
      <tr><td class="title">用户名：</td><td><input type="text" name="username"></td></tr>
      <tr><td class="title">密码：</td><td><input type="password" name="password"></td></tr>
      <tr><td class="sub" colspan="2"><input style="width: 120px;" type="submit" value="登录">
        <input style="width: 120px;" type="reset"></td></tr>
    </table>
  </form>
</body>
</html>
