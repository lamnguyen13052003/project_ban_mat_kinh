package controller;

import model.bean.Product;
import model.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DisplayProductController", value = "/product")
public class DisplayProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = ProductService.getInstance();
        String formatQuery = productService.formatQueryRequest(request.getQueryString());
        Map<String, List<String>> mapFilter = productService.getMapFilter(formatQuery);
        Map<String, String> mapSort = productService.getMapSort(formatQuery);
        Map<String, Integer> mapInfRoot = productService.getMapInfRoot(formatQuery);
        List<Product> products = productService.getProducts(mapInfRoot, mapFilter, mapSort);
        int totalPages = productService.getTotalPages(mapInfRoot, mapFilter, mapSort);
        int idCategory = 0, page = 0, idCategoryGroup = 0;

        try {
            idCategory = Integer.parseInt(request.getParameter("id-category"));
            idCategoryGroup = Integer.parseInt(request.getParameter("id-category-group"));
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        String title = productService.getTitle(idCategoryGroup, idCategory);

        request.setAttribute("products", products);
        request.setAttribute("title", title);
        request.setAttribute("request", formatQuery);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("page", page);
        request.setAttribute("mapInfRoot", mapInfRoot);
        request.setAttribute("mapFilter", mapFilter);
        request.setAttribute("mapSort", mapSort);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}