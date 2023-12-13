package controller.product_manager;

import controller.Action;
import model.DAO.ProductDAO;
import model.bean.Product;
import model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class GetProduct implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getQueryString();
        if (query == null) query = "";
        if (!query.contains("page")) query = query + "&page=1";
        if (!query.contains("id-category-group")) query = "id-category-group=-1" + query;
        int index = query.indexOf("&");
        if (query.indexOf("id-category", index) == -1)
            query = query.substring(0, index) + "&id-category=0" + query.substring(index, query.length());

        ProductService productService = ProductService.getInstance();
        String formatQuery = productService.formatQueryRequest(query);
        Map<String, Integer> mapInfRoot = productService.getMapInfRoot(formatQuery);
        Map<String, List<String>> mapFilter = productService.getMapFilter(formatQuery);
        Map<String, String> mapSort = productService.getMapSort(formatQuery);
        List<Product> products = productService.getProducts(mapInfRoot, mapFilter, mapSort, 7);
        int totalPages = productService.getTotalPages(mapInfRoot, mapFilter, mapSort);
        int page = mapInfRoot.get("page");

        request.setAttribute("products", products);
        request.setAttribute("request", formatQuery);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("page", page);
        request.setAttribute("mapInfRoot", mapInfRoot);
        request.setAttribute("mapFilter", mapFilter);
        request.setAttribute("mapSort", mapSort);
        request.getRequestDispatcher("danh_sach_san_pham.jsp").forward(request, response);
    }

}
