package controller.banner_and_icon_controller;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoadBannerForVerifyFileController", value = "/load-banner-for-verify-file-controller")
public class LoadBannerForVerifyFileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BannerImage logo = BannerService.getInstance().getBannerByDescription("%banner%logo%");
        BannerImage auth = BannerService.getInstance().getBannerByDescription("%banner%auth%");
        request.setAttribute("logo", logo);
        request.setAttribute("authBanner", auth);
        request.getRequestDispatcher("xac_thuc.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}