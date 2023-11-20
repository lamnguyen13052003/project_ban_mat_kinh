package servlet;

import bean.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserService userService = UserService.getInstance();

        if(userService.checkLogin(email, password)){
            User user = userService.getUser();
            goToPage(user, request, response);
        }
    }

    private void goToPage(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int role = user.getRole();
        switch (role){
            case 0 ->{
                request.getRequestDispatcher("page_admin/danh_sach_tai_khoan.jsp").forward(request, response);
            }
            case 1 ->{
                request.getRequestDispatcher("index.jsp").forward(request, response);;
            }
        }
    }
}