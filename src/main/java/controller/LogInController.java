package controller;

import model.bean.User;
import model.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LogInController", value = "/login")
public class LogInController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getMethod().toLowerCase().equals("get")){
            response.sendRedirect("dang_nhap.jsp");
            return;
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserService userService = UserService.getInstance();
        User user = userService.login(email, password);
        if(user != null){
            request.getSession().setAttribute("user", user);
            response.sendRedirect( "admin_pages/danh_sach_tai_khoan.jsp");
        }else{
            request.setAttribute("login_error", "Đăng nhập không thành công!");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
        }
    }
}