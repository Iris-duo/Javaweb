<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2026/9/11
  Time: 8:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>个人简历</title>
  <style>
    body {
      font-family: "SimSun", serif;
      background: #fff;
    }
    table {
      margin: 0 auto;          /* 表格居中 */
      border-collapse: collapse;
      width: 600px;
      text-align: center;
    }
    td {
      border: 1px solid #000;
      height: 38px;
      font-size: 16px;
      letter-spacing: 4px;
    }
    .title {
      background: #c4e09a;     /* 浅绿色表头 */
      font-weight: bold;
      font-size: 20px;
      letter-spacing: 10px;
      height: 42px;
    }
    .label {
      width: 100px;
    }
    .input {
      width: 130px;
    }
    .photo {
      width: 140px;
      letter-spacing: 0;
    }
  </style>
</head>
<body>

<table>
  <tr>
    <td colspan="5" class="title">个人简历</td>
  </tr>
  <tr>
    <td class="label">姓&nbsp;&nbsp;&nbsp;名：</td>
    <td class="input"></td>
    <td class="label">性&nbsp;&nbsp;&nbsp;别：</td>
    <td class="input"></td>
    <td rowspan="4" class="photo">照片</td>
  </tr>
  <tr>
    <td>婚姻状况：</td>
    <td></td>
    <td>出生年月：</td>
    <td></td>
  </tr>
  <tr>
    <td>民&nbsp;&nbsp;&nbsp;族：</td>
    <td></td>
    <td>政治面貌：</td>
    <td></td>
  </tr>
  <tr>
    <td>身&nbsp;&nbsp;&nbsp;高：</td>
    <td></td>
    <td>学&nbsp;&nbsp;&nbsp;历：</td>
    <td></td>
  </tr>
</table>

</body>
</html>
