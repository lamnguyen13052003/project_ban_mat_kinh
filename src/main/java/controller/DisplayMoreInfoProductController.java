package controller;

import model.bean.Product;
import model.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DisplayMoreInfoProductController", value = "/more-info-product")
public class DisplayMoreInfoProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = ProductService.getInstance();
        String id = request.getParameter("id");
        Product product = productService.getProduct(id);
        System.out.println(product);

        request.setAttribute("product", product);
        request.getRequestDispatcher("thong_tin_san_pham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}