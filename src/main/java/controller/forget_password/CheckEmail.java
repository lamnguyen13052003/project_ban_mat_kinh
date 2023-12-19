package controller.forget_password;

import controller.Action;
import helper.SendMail;
import model.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.UUID;

public class CheckEmail implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("error-not-found-email-forget-password", null);
        String email = request.getParameter("email");
        if (email == null) {
            response.sendRedirect("dang_nhap.jsp");
        }

        UserService userService = UserService.getInstance();
        if (userService.containsEmail(email)) {
            String url = request.getRequestURL().toString() + "?action=verify";
            String codeVerify = UUID.randomUUID().toString();
            userService.updateCodeVerify(email, codeVerify);
            boolean sendMail = SendMail.Send(email, "Xác Nhận Đăng Ký", SendMail.getFormForgetPassword(url, email, BCrypt.hashpw(codeVerify, BCrypt.gensalt(12))));
            if (sendMail) {
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("action", "forget-password");
                response.sendRedirect("xac_thuc.jsp");
            }
        } else {
            request.setAttribute("error-not-found-email-forget-password", "Email không tồn tại trên hệ thống!");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
        }
    }
}