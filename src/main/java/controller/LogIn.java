package controller;

import model.bean.User;
import model.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LogIn", value = "/LogIn")
public class LogIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserService userService = UserService.getInstance();

        if(userService.canLogin(email, password)){
            User user = userService.getUser();
            goToPage(user, request, response);
        }else{
            request.setAttribute("login_error", "Đăng nhập không thành công!");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
        }
    }

    private void goToPage(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int role = user.getRole();
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        switch (role){
            case 0 ->{
               response.sendRedirect("admin_pages/danh_sach_tai_khoan.jsp");
            }
            case 1 ->{
                response.sendRedirect("index.jsp");
            }
        }
    }
}