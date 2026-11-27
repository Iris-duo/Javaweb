package com.test;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
//        if(method == null)
//        {
//            response.sendRedirect("index.jsp");
//            return;
//        }
        switch(method){
            case "login":
                login(request,response);
                break;
            case "logout":
                logout(request,response);
                break;
        }
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        if("admin".equals(username) && "123".equals(password)) {
            session.setAttribute("username",username);

            int age = Integer.parseInt(request.getParameter("age"));
            Cookie cookie1 = new Cookie("username",username);
            cookie1.setMaxAge(age*24*60*60);
            response.addCookie(cookie1);

            Cookie cookie2 = new Cookie("password",password);
            cookie2.setMaxAge(age*24*60*60);
            response.addCookie(cookie2);

        }else{
            session.setAttribute("msg","请输入正确的用户名或密码");
        }
        response.sendRedirect("index.jsp");
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        Cookie cookie1 = new Cookie("username","");
        cookie1.setMaxAge(0);
        response.addCookie(cookie1);

        Cookie cookie2 = new Cookie("password","");
        cookie2.setMaxAge(0);
        response.addCookie(cookie2);

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
