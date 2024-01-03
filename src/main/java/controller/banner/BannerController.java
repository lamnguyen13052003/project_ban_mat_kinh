package controller.banner;

import controller.Action;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
@MultipartConfig
@WebServlet(name = "BannerController", value = "/admin_pages/banner")
public class BannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Action action = null;
        String actionStr = request.getParameter("action");

        switch (actionStr) {
            case "banner" ->{
                action = new GetBanner();
            }
        }

        if(action == null){
            response.sendRedirect("error.jsp");
        }

        action.action(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Action action = new DeleteFileOnBannerManagement();
        action.action(req, resp);
    }
}