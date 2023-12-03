package controller;

import model.bean.Product;
import model.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DisplayProductController", value = "/product-booth")
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

        int idCategory = mapInfRoot.get("id-category"),
                idCategoryGroup = mapInfRoot.get("id-category-group"),
                page = mapInfRoot.get("page");

        String title = productService.getTitle(idCategoryGroup, idCategory);

        request.setAttribute("products", products);
        request.setAttribute("title", title);
        request.setAttribute("request", formatQuery);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("page", page);
        request.setAttribute("mapInfRoot", mapInfRoot);
        request.setAttribute("mapFilter", mapFilter);
        request.setAttribute("mapSort", mapSort);
        request.getRequestDispatcher("gian_hang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}