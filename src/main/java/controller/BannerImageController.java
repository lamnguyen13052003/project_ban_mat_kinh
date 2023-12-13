package controller;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BannerImageController", value = "/banner-manager")
//@MultipartConfig
public class BannerImageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xác định phần tử input có type="file" bằng cách sử dụng tên của nó
//        Part filePart = request.getPart("banner-login");
//        // Lấy thông tin về tệp tin
//        String fileName = filePart.getSubmittedFileName();
//        uploadImage(fileName);

        List<BannerImage> urlBannerImages = BannerService.getInstance().getSlideShowImages(); // slide
        BannerImage urlBannerPRImages = BannerService.getInstance().getBannerPRImages(); // banner pr
        BannerImage urlBannerLoginImages = BannerService.getInstance().getBannerLoginImages(); // banner login
        BannerImage urlBannerSignupImages = BannerService.getInstance().getBannerSignupImages(); // banner Signup
        BannerImage urlBannerLogoImages = BannerService.getInstance().getLogoImages(); // banner logo

        urlBannerImages = urlBannerImages == null? new ArrayList<>() : urlBannerImages;
        urlBannerPRImages = urlBannerPRImages == null? new BannerImage() : urlBannerPRImages;
        urlBannerLoginImages = urlBannerLoginImages == null? new BannerImage() : urlBannerLoginImages;
        urlBannerSignupImages = urlBannerSignupImages == null? new BannerImage() : urlBannerSignupImages;
        urlBannerLogoImages = urlBannerLogoImages == null? new BannerImage() : urlBannerLogoImages;

        request.setAttribute("bannerImages", urlBannerImages); // slide
        request.setAttribute("bannerPRImages", urlBannerPRImages); // banner pr
        request.setAttribute("bannerLoginImages", urlBannerLoginImages); // banner login
        request.setAttribute("bannerSignupImages", urlBannerSignupImages); // banner Signup
        request.setAttribute("bannerLogoImages", urlBannerLogoImages); // banner logo

//        response.setContentType("text/plain;charset=UTF-8");
        request.getRequestDispatcher("admin_pages/danh_sach_slider.jsp").forward(request, response);
    }

    private void uploadImage(String uploadPRBanner) {
        System.out.println(uploadPRBanner);
//        BannerService.getInstance().uploadBannerImage(uploadPRBanner, bannerImage);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}