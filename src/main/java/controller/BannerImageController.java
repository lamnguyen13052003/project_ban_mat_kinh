package controller;

import model.bean.BannerImage;
import model.service.BannerService;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BannerImageController", value = "/admin_pages/banner_manager")
//@MultipartConfig
public class BannerImageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<BannerImage> urlBannerImages = BannerService.getInstance().getSlideShowImages(); // slide
        BannerImage urlBannerPRImages = BannerService.getInstance().getBannerPRImages(); // banner pr
        BannerImage urlBannerLoginImages = BannerService.getInstance().getBannerLoginImages(); // banner login
        BannerImage urlBannerSignupImages = BannerService.getInstance().getBannerSignupImages(); // banner Signup
        BannerImage urlBannerLogoImages = BannerService.getInstance().getLogoImages(); // banner logo
        BannerImage urlBannerContactImages = BannerService.getInstance().getBannerContact();

        urlBannerImages = urlBannerImages == null? new ArrayList<>() : urlBannerImages;
        urlBannerPRImages = urlBannerPRImages == null? new BannerImage() : urlBannerPRImages;
        urlBannerLoginImages = urlBannerLoginImages == null? new BannerImage() : urlBannerLoginImages;
        urlBannerSignupImages = urlBannerSignupImages == null? new BannerImage() : urlBannerSignupImages;
        urlBannerLogoImages = urlBannerLogoImages == null? new BannerImage() : urlBannerLogoImages;
        urlBannerContactImages = urlBannerContactImages == null? new BannerImage() : urlBannerContactImages;

        request.setAttribute("bannerImages", urlBannerImages); // slide
        request.setAttribute("bannerPRImages", urlBannerPRImages); // banner pr
        request.setAttribute("bannerLoginImages", urlBannerLoginImages); // banner login
        request.setAttribute("bannerSignupImages", urlBannerSignupImages); // banner Signup
        request.setAttribute("bannerLogoImages", urlBannerLogoImages); // banner logo
        request.setAttribute("bannerContactImages", urlBannerContactImages);

        request.getRequestDispatcher("quan_ly_banner.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}