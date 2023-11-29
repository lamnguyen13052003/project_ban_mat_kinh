package servlet;

import model.bean.ReviewImage;
import model.service.BannerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BannerController", value = "/banner")
public class BannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ReviewImage> slideShowImages = BannerService.getInstance().getSlideShowImages(); // lay danh sach hinh anh
        request.setAttribute("slideShowImages", slideShowImages); // dat thuoc tinh cho request
        System.out.println(slideShowImages);
        //chuyen huong den trang danh_sach_slider.jsp
        RequestDispatcher reqDis = request.getServletContext().getRequestDispatcher("/admin_pages/danh_sach_slider.jsp");
       reqDis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}