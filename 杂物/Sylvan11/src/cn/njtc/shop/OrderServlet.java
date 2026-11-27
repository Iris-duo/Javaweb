package cn.njtc.shop;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取全局上下文对象（整个 Web 应用共享）
        ServletContext context = getServletContext();
        // 读取 web.xml 中 <context-param> 配置的全局初始化参数
        String username = context.getInitParameter("username");

        PrintWriter out = response.getWriter();
        out.write("Order Servlet, username = " + username);
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}