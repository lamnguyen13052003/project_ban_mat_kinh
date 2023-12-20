package controller.forget_password;

import controller.Action;
import model.bean.User;
import model.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ForgetPasswordVerify implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String hashCode = request.getParameter("code");
        UserService userService = UserService.getInstance();
        if (!userService.containsEmail(email)
                || email == null
                || email.equals("")
                || hashCode == null
                || hashCode.equals("")) {
            Action.error(request, response);
            return;
        }

        int result = userService.forgetPasswordVerify(email, hashCode);
        response.getWriter().println(result);
        switch (result) {
            case -1 -> {
                Action.error(request, response);
            }
            case 1 -> {
                request.getSession().setAttribute("email", email);
                response.sendRedirect("quen_mat_khau.jsp");
            }
        }
    }
}