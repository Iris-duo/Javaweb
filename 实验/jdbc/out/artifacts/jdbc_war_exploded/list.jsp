<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jdbc.util.DBUtil" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>用户列表</title>
</head>
<body>
<%
  //1、导入数据库jar包
  // 2、加载驱动
  Class.forName("com.mysql.jdbc.Driver"); //Driver
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

  int pageNo = 1;
  int pageSize = 10;

  String pageNoStr = request.getParameter("pageNo");
  String pageSizeStr = request.getParameter("pageSize");

  // 【错误】原来只判 null：?pageNo= 空串、?pageNo=abc 都会 NumberFormatException，页面直接 500
  //if(pageNoStr != null){
  //  pageNo = Integer.parseInt(pageNoStr);
  //}
  //if(pageSizeStr != null){
  //  pageSize = Integer.parseInt(pageSizeStr);
  //}
  try {
    if (pageNoStr != null && !pageNoStr.trim().isEmpty()) {
      pageNo = Integer.parseInt(pageNoStr.trim());
    }
    if (pageSizeStr != null && !pageSizeStr.trim().isEmpty()) {
      pageSize = Integer.parseInt(pageSizeStr.trim());
    }
  } catch (NumberFormatException e) {
    // 参数乱填就回退到默认值，不让页面崩
  }
  if (pageSize <= 0) {
    // 【补充】pageSize=0 时下面的除法会 ArithmeticException
    pageSize = 10;
  }

  int totalCount = DBUtil.getRecordCount("t_user");
  int totalPage = (totalCount + pageSize-1)/pageSize;

  // 【补充】表里一条数据都没有时 totalPage 会算成 0，页码全乱
  if (totalPage <= 0) {
    totalPage = 1;
  }
  // 【补充】页码钳位：第 1 页点“上一页”会得到 0，最后一页点“下一页”会超出总页数
  if (pageNo < 1) {
    pageNo = 1;
  }
  if (pageNo > totalPage) {
    pageNo = totalPage;
  }

  // 【错误】表名后面直接跟 ?,? 不是 SQL；executeQuery 也没传参数 → 返回 null → rs.next() 空指针
  //String sql = "select * from t_user ?,?";
  //Integer[] params = new Integer[]{(pageNo - 1)*pageSize,pageSize};
  //ResultSet rs = DBUtil.executeQuery(sql);
  String sql = "select * from t_user limit ?,?";                 // 分页要写 limit 偏移量,条数
  Object[] params = new Object[]{(pageNo - 1)*pageSize,pageSize};
  ResultSet rs = DBUtil.executeQuery(sql,params);                 // 参数一定要传进去

  /*
   * ResultSet对象的方法
   * 1.next() -
   *     a - 往后移动记录指针
   *     b - 返回一个逻辑值，如果有记录，返回true，否则返回false
   *       特别注意：执行executeQuery方法后，记录指针指向第一条记录之前
   * 2.getXXX(int)     -字段的索引  XXX是字段的类型
   *   getXXX(String)  -字段的名称
   * */

  // 【补充】DBUtil.executeQuery 出错会返回 null，直接调 rs.next() 就是空指针
  if (rs == null) {
    out.print("<p>查询失败，请看 IDEA 控制台的异常堆栈</p>");
  } else {
    while(rs.next()){
      int id= rs.getInt("id");
      String username = rs.getString("username");
      String pwd = rs.getString("password");
      int age = rs.getInt("age");
      String description = rs.getString("description");
      // 原样只输出三个字段；age、description 需要就打开下面这行、注释掉你原来那行
      //out.print(id + "-" + username + "-" + pwd + "<br>");
      out.print(id + "-" + username + "-" + pwd + "-" + age + "-" + description + "<br>");
    }
    rs.close();   // 【补充】不关游标会一直占着连接
  }
%>

<p>共 <%= totalCount %> 条记录，每页 <%= pageSize %> 条，共 <%= totalPage %> 页，当前第 <%= pageNo %> 页</p>

<a href="list.jsp?pageNo=1&pageSize=<%=pageSize%>">第一页</a>&nbsp;

<%-- 【错误】第 1 页点“上一页”会得到 pageNo=0，偏移量 -10，limit 负数 MySQL 直接报错 --%>
<%-- <a href="list.jsp?pageNo=<%=pageNo-1%>&pageSize=<%=pageSize%>">上一页</a>&nbsp; --%>
<%
  int prev = pageNo > 1 ? pageNo - 1 : 1;
  int next = pageNo < totalPage ? pageNo + 1 : totalPage;
%>
<a href="list.jsp?pageNo=<%=prev%>&pageSize=<%=pageSize%>">上一页</a>&nbsp;

<%-- ===== 【优化】页码栏：原来是全量输出，101 页就铺 101 个链接（你截图那样），
            现在只显示当前页左右各 5 页，两端用 … 省略，页码再多也不会把页面撑满。
            原写法留档：
<%
  for(int i =1;i<=totalPage;i++){
%>
<a href="list.jsp?pageNo=<%=i%>&pageSize=<%=pageSize%>">第<%=i%>页</a>
<%
  }
%>
===== --%>
<%
  int window = 5;                                      // 当前页左右各显示 5 个页码
  int startPage = Math.max(1, pageNo - window);
  int endPage = Math.min(totalPage, pageNo + window);
%>

<% if (startPage > 1) { %>
<a href="list.jsp?pageNo=1&pageSize=<%=pageSize%>">1</a>&nbsp;
<% if (startPage > 2) { %>...&nbsp;<% } %>
<% } %>

<%
  for (int i = startPage; i <= endPage; i++) {
    if (i == pageNo) {
%>
<b><%= i %></b>&nbsp;
<%
    } else {
%>
<a href="list.jsp?pageNo=<%=i%>&pageSize=<%=pageSize%>"><%=i%></a>&nbsp;
<%
    }
  }
%>

<% if (endPage < totalPage) { %>
<% if (endPage < totalPage - 1) { %>...&nbsp;<% } %>
<a href="list.jsp?pageNo=<%=totalPage%>&pageSize=<%=pageSize%>"><%=totalPage%></a>&nbsp;
<% } %>

<a href="list.jsp?pageNo=<%=next%>&pageSize=<%=pageSize%>">下一页</a>&nbsp;

<a href="list.jsp?pageNo=<%=totalPage%>&pageSize=<%=pageSize%>">最后一页</a>

<div style="margin-top:10px">
  每页
  <select onchange="location.href='list.jsp?pageNo=1&pageSize=' + this.value">
    <%
      int[] sizes = {5, 10, 20, 50};
      for (int s : sizes) {
    %>
    <option value="<%=s%>" <%= (s == pageSize) ? "selected" : "" %>><%=s%></option>
    <%
      }
    %>
  </select>
  条

  <form action="list.jsp" method="get" style="display:inline">
    跳到第
    <input type="text" name="pageNo" size="3" value="<%=pageNo%>">
    页
    <input type="hidden" name="pageSize" value="<%=pageSize%>">
    <input type="submit" value="跳转">
  </form>
</div>

</body>
</html>