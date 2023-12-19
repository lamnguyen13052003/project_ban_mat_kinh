package controller;

import helper.SendMail;
import model.bean.User;
import model.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {
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
        String gender = request.getParameter("customer[gender]");
        String fullname = request.getParameter("customer[fullName]");
        String day = request.getParameter("day");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        if (!password.equals(repassword)) {
            request.setAttribute("signup_error_pass", "Password không trùng khớp!");
            request.getRequestDispatcher("dang_ky.jsp").forward(request, response);
            return;
        }

        if (userService.containsEmail(email)) {
            request.setAttribute("signup_error_email", "Emai đã tồn tại trên hệ thống!");
            request.getRequestDispatcher("dang_ky.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setAvatar("images/avatar/default_avatar.png");
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(1);
        user.setSex(gender);
        try {
            user.setBirthDay(LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day)));
        } catch (Exception e) {
            request.setAttribute("signup_error_birthday", "Lỗi ngày tháng năm sinh!");
            request.getRequestDispatcher("dang_ky.jsp").forward(request, response);
            return;
        }
        user.setFullName(fullname);
        String codeVerify = UUID.randomUUID().toString();
        userService.signup(user, codeVerify);
        String url = request.getRequestURL().toString().replace("register", "verify");
        boolean sendMail = SendMail.Send(user.getEmail(), "Xác Nhận Đăng Ký", SendMail.getMessage(url, user.getFullName(), user.getEmail(), BCrypt.hashpw(codeVerify, BCrypt.gensalt(12))));
        if (sendMail) response.sendRedirect("xac_thuc.jsp");
        else {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}