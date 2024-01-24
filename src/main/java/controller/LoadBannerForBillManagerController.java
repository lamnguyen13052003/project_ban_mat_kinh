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

@WebServlet(name = "LoadBannerForBillManagerController", value = "/admin_pages/load-banner-for-bill-manager-controller")
public class LoadBannerForBillManagerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BannerImage logo = BannerService.getInstance().getBannerByDescription("%banner%logo%");
        request.setAttribute("logo", logo);
        request.getRequestDispatcher("quan_ly_hoa_don.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}