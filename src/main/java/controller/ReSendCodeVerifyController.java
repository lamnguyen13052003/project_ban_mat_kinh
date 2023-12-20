package controller;

import helper.SendMail;
import model.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;


@WebServlet(name = "ReSendCodeVerifyController", value = "/re_send_code_verify")
public class ReSendCodeVerifyController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String action = request.getParameter("action");
        UserService userService = UserService.getInstance();
        if (userService.containsEmail(email)) {
            String url = request.getRequestURL().toString().replace("check_email", "forget_password");
            String codeVerify = UUID.randomUUID().toString();
            userService.updateCodeVerify(email, codeVerify);
            boolean sendMail = false;
            switch (action) {
                case "forget-password" -> {
                    sendMail = SendMail.Send(email, "Xác Nhận Đăng Ký", SendMail.getFormRegister(url, fullName, email, BCrypt.hashpw(codeVerify, BCrypt.gensalt(12))));
                }
                case "register" -> {
                    sendMail = SendMail.Send(email, "Xác Nhận Đăng Ký", SendMail.getFormForgetPassword(url, email, BCrypt.hashpw(codeVerify, BCrypt.gensalt(12))));
                }
            }
            if (sendMail) {
                request.getSession().setAttribute("email", email);
                response.sendRedirect("xac_thuc.jsp");
            }
        } else {
            request.setAttribute("error", "Email không tồn tại trên hệ thống!");
            request.getRequestDispatcher("xac_thuc.jsp").forward(request, response);
        }
    }
}
