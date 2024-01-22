package controller.admin;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import model.bean.User;
import model.dto.Page;
import model.dto.UserManage;
import model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

    @WebServlet(name = "AccountControllerAdmin", value = "/admin/account")
public class AccountController extends HttpServlet  {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    /*    System.out.println("running get");
        User user = (User) request.getSession().getAttribute("user");
        if(user == null || user.getRole() != 2) {
            response.setStatus(401);
            response.getWriter().println("Please login");
            return;
        }*/
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if(action == null || action.equals("get")){
            get(request,response);
        }


    }

    private int tryParseInt(String i, int defaultValue){
        int rs = defaultValue ;
        try {
            rs = Integer.parseInt(i);
        }catch (Exception e){
            rs = defaultValue;
        }
        return rs;
    }
    private void get(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int page = tryParseInt(request.getParameter("page"), 1);
        int role = tryParseInt(request.getParameter("role"), -1);
        int lock = tryParseInt(request.getParameter("lock"), -1);
        int id = tryParseInt(request.getParameter("id"), -1);
        String name = request.getParameter("name") == null ? "" : request.getParameter("name");
        Page<UserManage> pagi = UserService.getInstance().getPageUser(page,id,name,role,lock);
        response.getWriter().println(new Gson().toJson(pagi));
    }
}