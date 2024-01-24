package controller;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoadBannerForFinishedPayingController", value = "/load-banner-for-finished-paying-controller")
public class LoadBannerForFinishedPayingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        BannerImage logo = BannerService.getInstance().getBannerByDescription("%banner%logo%");
        session.setAttribute("logo", logo);
        request.getRequestDispatcher("thanh_toan_thanh_cong.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}