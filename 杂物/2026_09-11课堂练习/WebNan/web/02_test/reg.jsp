<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <style>
        .info {
            width: 100%;
            margin: 30px auto;
            font-size:30px;
            font-weight: bold;
            background-color: #c0eca6;
            text-align: center;
        }
        table {
            width: 40%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        td {
            padding: 5px;
        }
        input {
            height: 30px;
            width: 300px;
        }
        input[type="radio"],
        input[type="checkbox"] {
            height: 16px;
            width: 16px;      /* 修复复选框/单选框被撑大的问题 */
            vertical-align: middle;
        }
        table, tr, td {
            border: 2px solid #0c0c0c;
        }
        .title {
            text-align: right;
        }
        .sub {
            text-align: center;
        }
        .btn {
            width: 120px;      /* 按钮样式单独控制 */
        }
    </style>
</head>
<body>
<div class="info">用户注册</div>
<form action="zhu.jsp" method="post" enctype="multipart/form-data">
    <table>
        <tr><td class="title">用户名</td><td><input type="text" name="username"></td></tr>
        <tr><td class="title">密码</td><td><input type="password" name="password"></td></tr>
        <tr><td class="title">确认密码</td><td><input type="password" name="confirmpassword"></td></tr>
        <tr><td class="title">性别</td>
            <td>
                <input type="radio" name="sex" value="0" checked>男
                <input type="radio" name="sex" value="1">女
                <input type="radio" name="sex" value="2">未知
            </td>
        </tr>
        <tr><td class="title">爱好</td>
            <td>
                <input type="checkbox" name="hobby" value="0">吃饭
                <input type="checkbox" name="hobby" value="1">睡觉
                <input type="checkbox" name="hobby" value="2">画画
                <input type="checkbox" name="hobby" value="3">旅游
            </td>
        </tr>
        <tr><td class="title">头像</td><td><input type="file" name="photo"></td></tr>
        <tr><td class="title">学历</td>
            <td>
                <select name="rank">
                    <option value="专科">专科</option>
                    <option value="本科" selected>本科</option>
                    <option value="硕士">硕士</option>
                    <option value="博士">博士</option>
                </select>
            </td>
        </tr>
        <tr><td class="title">简介</td><td><textarea name="description" cols="30" rows="10"></textarea></td></tr>
        <tr>
            <td class="sub" colspan="2">
                <input class="btn" type="submit" value="注册">
                <input class="btn" type="reset" value="重置">
            </td>
        </tr>
    </table>
</form>
</body>
</html>