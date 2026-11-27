<%@ page contentType="text/html; charset=UTF-8" %>
<html style="background-color: #9ad7d7;">
<head>
    <title>请输入用户名</title>
    <style>
        body {
            font-family: KaiTi, "楷体", STKaiti, serif;
            font-size: 20px;
            margin: 30px;
        }
        input[type="text"] {
            font-family: KaiTi, "楷体", serif;
            font-size: 18px;
            padding: 6px 10px;
            border: 1px solid #999;
            border-radius: 6px;
        }
        input[type="submit"] {
            font-family: KaiTi, "楷体", serif;
            font-size: 18px;
            color: #fff;
            background-color: #6694c0;
            padding: 10px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.3);
        }
        input[type="submit"]:hover {
            background-color: #5a82a9;
        }
    </style>
</head>
<body>
<form action="inputGoods.jsp" method="post">
    请输入您的姓名：<input type="text" name="username">
    <input type="submit" value="下一步">
</form>
</body>
</html>