package controller;

import model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterVerifyController", value = "/verify")
public class RegisterVerifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String codeVerify = req.getParameter("code");
        UserService userService = UserService.getInstance();
        if (!userService.containsEmail(email) || email == null || email.equals("") || codeVerify == null || codeVerify.equals("")) {
            resp.sendRedirect("error.jsp");
            return;
        }
        int result = userService.verifyAccount(email, codeVerify);
        switch (result) {
            case -1 ->{
                resp.sendRedirect("error.jsp");
            }
            case 0 -> {
                resp.sendRedirect("dang_ky.jsp");
            }
            case 1 -> {
                resp.sendRedirect("dang_nhap.jsp");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
