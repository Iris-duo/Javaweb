<%@ page contentType="text/html; charset=UTF-8" %>
<html style="background-color: #9ad7d7;">
<head>
    <title>购买结果</title>
    <style>
        body {
            font-family: KaiTi, "楷体", STKaiti, serif;
            font-size: 20px;
            margin: 30px;
            line-height: 2;
        }
    </style>
</head>
<body>
<%
    String goods = request.getParameter("goods");

    String username = (String) session.getAttribute("username");

    out.print("用户 " + username + " <br>购买的商品是：" + goods);
%>
</body>
</html>