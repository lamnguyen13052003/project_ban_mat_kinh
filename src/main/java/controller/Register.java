package controller;

import helper.SendMail;
import model.bean.User;
import model.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Random;
import java.util.UUID;

@WebServlet(name = "Register", value = "/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        UserService userService = UserService.getInstance();
        String email = request.getParameter("customer[email]");
        String password = request.getParameter("customer[password]");
        String repassword = request.getParameter("customer[repassword]");
        String gender= request.getParameter("customer[gender]");
        String fullname = request.getParameter("customer[fullName]");
        if(!password.equals(repassword)){
            request.setAttribute("signup_error_pass", "Pass ko trùng!");
            request.getRequestDispatcher("dang_ky.jsp").forward(request, response);
            return;
        }

        if(userService.findUserByMail(email)){
            request.setAttribute("signup_error_email", "Emai đã tồn tại trên hệ thống!");
            request.getRequestDispatcher("dang_ky.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setAvatar(null);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(0);
        user.setSex(gender);
//        user.setBirthDay(request.getParameter("birthday"));
//        user.setBirthDay(request.getParameter("birthday"));
        user.setFullName(fullname);
        boolean rs = userService.signup(user);
        if(rs == true){
            String generatedString = UUID.randomUUID().toString();
            request.getSession().setAttribute("token_verify", generatedString);
            request.getSession().setMaxInactiveInterval(60*10);
            request.getSession().setAttribute("email_verify", email);
            request.getSession().setAttribute("tom_verify", email);


            SendMail.Send(email,"Xác Nhận Đăng Ký", "Vui lòng nhấn vào đường dẫn để hoàn tất đăng ký \n" +
                    "Đường dẫn chỉ có thời gian là 10p \n"+
                    "http://" + request.getHeader("host") + "/verify_account?token=" + generatedString);
        }
        request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
    }

    private void verify(){

    }
}