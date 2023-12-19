package controller.register;

import controller.Action;
import model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterVerify implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String codeVerify = request.getParameter("code");
        UserService userService = UserService.getInstance();
        if (!userService.containsEmail(email) || email == null || email.equals("") || codeVerify == null || codeVerify.equals("")) {
            response.sendRedirect("error.jsp");
            return;
        }
        int result = userService.registerVerify(email, codeVerify);
        switch (result) {
            case -1 -> {
                Action.error(request, response);
            }
            case 0 -> {
                response.sendRedirect("dang_ky.jsp");
            }
            case 1 -> {
                response.sendRedirect("dang_nhap.jsp");
            }
        }
    }
}
