package controller;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoadBannerForProfileController", value = "/load-banner-for-profile-controller")
public class LoadBannerForProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        BannerImage logo = BannerService.getInstance().getBannerByDescription("%banner%logo%");
        session.setAttribute("logo", logo);
        request.getRequestDispatcher("tai_khoan.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}