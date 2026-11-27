package com.test;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String code = (String)session.getAttribute("seccode");
        String seccode = request.getParameter("seccode");
        if(code.equals(seccode)){
            response.sendRedirect("index.jsp");
        }else{
            request.setAttribute("msg","请输入正确的验证码");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }
}
