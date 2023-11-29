package controller;

import model.bean.Product;
import model.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

@WebServlet(name = "DisplayProductController", value = "/product")
public class DisplayProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCategory = 0, page = 0, idCategoryGroup = 0;
        try {
            idCategory = Integer.parseInt(request.getParameter("id-category"));
            idCategoryGroup = Integer.parseInt(request.getParameter("id-category-group"));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        ProductService productService = ProductService.getInstance();
        List<Product> products = productService.getProducts(request.getQueryString());
        String queryString = productService.getSQLQueryRequest(request.getQueryString());
        String title = productService.getTitle(idCategoryGroup, idCategory);

        request.setAttribute("products", products);
        request.setAttribute("title", title);
        request.setAttribute("request", queryString);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}