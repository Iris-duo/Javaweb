<%@ page contentType="text/html; charset=UTF-8" %>
<html style="background-color: cyan;">
<head>
    <title>网上单选问答题</title>
    <style>
        body {
            font-family: KaiTi, "楷体", STKaiti, serif;
            font-size: 20px;
            margin: 30px;
        }

        /* 单选按钮和文字之间的间距 */
        input[type="radio"] {
            margin-right: 4px;
        }

        /* 提交按钮 */
        input[type="submit"] {
            font-family: KaiTi, "楷体", serif;
            font-size: 18px;
            color: #ccc;
            background-color: gainsboro;
            padding: 10px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.3);
        }

        /* 鼠标悬停效果 */
        input[type="submit"]:hover {
            background-color: #0066CC;
        }
    </style>
</head>
<body>
<form action="anwer.jsp" method="post">

    诗人李白是中国历史上哪个朝代的人：<br>
    <input type="radio" name="q1" value="A">宋朝
    <input type="radio" name="q1" value="B">唐朝
    <input type="radio" name="q1" value="C">明朝
    <input type="radio" name="q1" value="D">元朝
    <br><br>

    小说红楼梦的作者是：<br>
    <input type="radio" name="q2" value="A">曹雪芹
    <input type="radio" name="q2" value="B">罗贯中
    <input type="radio" name="q2" value="C">李白
    <input type="radio" name="q2" value="D">司马迁
    <br><br>

    <input type="submit" value="提交答案">
</form>
</body>
</html>