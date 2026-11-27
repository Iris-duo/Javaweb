package com.jdbc;

import com.jdbc.util.DBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

// 【错误】静态导入后，方法里的 out 指向控制台 System.out，不是 response.getWriter()，浏览器看不到任何输出；
//        而且 PrintWriter out 是在后面才声明的，前面那句 out.println 早就解析成 System.out 了，编译还能过，所以很难发现
//import static java.lang.System.out;

@WebServlet(name = "UserServlet", value = "/reg")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /*
     * 【多余代码】Servlet 容器只认 doGet/doPost/doPut/doDelete 这些约定方法，
     * doPost1 永远不会被调用；里面还是“字符串拼 SQL”的老版本，整段注释掉留着对照
     *
    protected void doPost1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");
        int age = Integer.parseInt(request.getParameter("age"));
        String description = request.getParameter("description");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/shop";
            String user = "root";
            String password = "123456";
            Connection connection = DriverManager.getConnection(url,user,password);
            Statement statement = connection.createStatement();
            String sql = "insert into t_user(username,password,age,description)values('"
                    + username +"','"+ pwd +"','"+ age +"','"+ description+"')";
            int i = statement.executeUpdate(sql);
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();
            if(i ==1){
                out.println("注册成功");
            }else{
                out.println("注册失败");
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 【补充】输出流和响应类型必须在使用 out 之前设置好，后面就不用在 try 里重复声明了
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String pwd = request.getParameter("password");

        // 【错误】年龄留空、填中文，parseInt 直接 NumberFormatException，页面 500
        //int age = Integer.parseInt(request.getParameter("age"));
        String ageStr = request.getParameter("age");
        int age = 0;
        if (ageStr != null && !ageStr.trim().isEmpty()) {
            try {
                age = Integer.parseInt(ageStr.trim());
            } catch (NumberFormatException e) {
                age = 0;   // 填了非数字就当 0，不让它把页面弄崩
            }
        }

        String description = request.getParameter("description");
        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            String url = "jdbc:mysql://localhost:3306/shop";
//            String user = "root";
//            String password = "123456";
//            Connection connection = DriverManager.getConnection(url,user,password);
            /*
            * Statement <- PreparedStatement <- CallableStatement(执行存储过程)
            * PreparedStatement 执行带参数的SQL语句，增加了三个方法
            * execute()
            * executeQuery()
            * executeUpdate()
            * */
            String s = "select * from t_user where username=?";
            //PreparedStatement p = connection.prepareStatement(s);
            //p.setString(1,username);
            ResultSet rs = DBUtil.executeQuery(s,new String[]{username});

            // 【补充】DBUtil 内部把异常吞掉后返回 null，不判空就直接 rs.next() 又是空指针
            if (rs == null) {
                out.println("查询失败，请查看 IDEA 控制台的异常堆栈");
                return;
            }

            if(rs.next()){
                out.println("用户名存在");
                rs.close();   // 【补充】提前 return 也要关游标
                return;
            }
            rs.close();

            String sql = "insert into t_user(username,password,age,description)values(?,?,?,?)";
//            PreparedStatement pst = connection.prepareStatement(sql);
//            pst.setString(1,username);
//            pst.setString(2,pwd);
//            pst.setInt(3,age);
//            pst.setString(4,description);
            Object[] params = new Object[]{username,pwd,age,description};
            int i = DBUtil.executeUpdate(sql,params);

//            response.setContentType("text/html;charset=UTF-8");   // 【多余】已经在方法开头设过了
//            PrintWriter out=response.getWriter();                 // 【多余】同上，重复声明还会把前面那个 out 遮蔽掉

            if(i ==1){
                out.println("注册成功");
            }else{
                // 返回 0 一般是 SQL 出错（字段超长、唯一索引冲突等），去控制台看 e.printStackTrace()
                out.println("注册失败");
            }
        }  catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}