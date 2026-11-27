<%-- 【多余】这三个 import 现在都用不到了（全部走 DBUtil），注释掉保留 --%>
<%-- <%@ page import="java.sql.Connection" %> --%>
<%-- <%@ page import="java.sql.DriverManager" %> --%>
<%-- <%@ page import="java.sql.Statement" %> --%>
<%@ page import="com.jdbc.util.DBUtil" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>批量插入测试</title>
</head>
<body>
<%
  //1、导入数据库jar包
  // 2、加载驱动（DBUtil 的静态块里已经加载过，这里不用再写）
  //Class.forName("com.mysql.jdbc.Driver"); //Driver
  //3、获得链接 Connection
  //String url = "jdbc:mysql://localhost:3306/shop";
  //String user = "root";
  //String password = "123456";
  //Connection connection = DriverManager.getConnection(url,user,password);
  //4、获得句子对象，Statement
  //Statement statement = connection.createStatement();
  /*
   * statement有3个执行sql语句的方法
   * 1.execute(sql) - 几乎不用
   * 2.executeQuery(sql) - 用于执行select语句 返回值ResultSet
   * 3.executeUpdate(sql) - 用于执行处理select之外的SQL语句，
   *                             返回一个整数，表示sql语句执行后影响的记录条数
   * */

  // 下面这段是单条插入的测试，留着注释，需要时打开
//  String sql = "insert into t_user(username,password,age,description)values('admin','123456',20,'admin')";
//  int count = DBUtil.executeUpdate(sql);
//  if(count == 1){
//    out.print("数据输入成功");
//  }else{
//    out.print("数据插入失败");
//  }

  // 【补充】原来每刷新一次页面就插 505 条，刷新两次表里就是 1010 条。
  // 加个判断：库里不足 505 条才插，重复访问不会重复插入
  int oldCount = DBUtil.getRecordCount("t_user");
  if (oldCount < 505) {
    for(int i =1;i<=505;i++){
      // 原写法 value(?,?,?,?) —— MySQL 里 VALUE 是 VALUES 的别名，不算错，但标准写法用 values
      //String sql = "insert into t_user(username,password,age,description)value(?,?,?,?)";
      String sql = "insert into t_user(username,password,age,description)values(?,?,?,?)";
      Object[] params = new Object[]{"user" + i,"password" + i,i,"description" + i};
      DBUtil.executeUpdate(sql,params);
    }
    out.print("插入完成，t_user 现在共 " + DBUtil.getRecordCount("t_user") + " 条");
  } else {
    out.print("t_user 已有 " + oldCount + " 条，跳过插入（想重插先 truncate table t_user）");
  }
%>
</body>
</html>