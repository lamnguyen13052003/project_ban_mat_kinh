package controller;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoadBannerForEditProductController", value = "/admin_pages/load-banner-for-edit-product-controller")
public class LoadBannerForEditProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BannerImage logo = BannerService.getInstance().getBannerByDescription("%banner%logo%");
        request.setAttribute("logo", logo);
        request.getRequestDispatcher("chinh_sua_san_pham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}