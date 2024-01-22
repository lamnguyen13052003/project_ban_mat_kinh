package controller.banner_manager;

import controller.Action;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
@MultipartConfig(maxFileSize = 5 * 1024 * 1024, maxRequestSize = 50 *1024*1024)
@WebServlet(name = "BannerManagerController", value = "/admin_pages/banner")
public class BannerManagerController extends HttpServlet {
    public static final int MAX_FILE_SIZE = 5 * 1024 * 1024;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Action action = null;
        String actionStr = request.getParameter("action");

        switch (actionStr) {
            case "banner" ->{
                action = new GetBannerManager();
            }
        }

        if(action == null){
            response.sendRedirect("error.jsp");
        }

        action.action(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Action action = null;
        String actionStr = request.getParameter("action");

        switch (actionStr) {
            case "add-file" ->{
                action = new AddFileOnBannerManagement();
            }
            case "upload-file" ->{
                action = new UploadFileOnBannerManagement();
            }
        }

        if(action == null){
            response.sendRedirect("error.jsp");
        }

        action.action(request, response);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Action action = new DeleteFileOnBannerManagement();
        action.action(req, resp);
    }
}