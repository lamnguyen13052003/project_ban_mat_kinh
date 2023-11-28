package controller;

import model.bean.Product;
import model.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

@WebServlet(name = "DisplayProductController", value = "/product")
public class DisplayProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = getTitle(request);
        String queryString = getQuery(request.getQueryString());
        List<Product> products = getProducts(request);

        request.setAttribute("products", products);
        request.setAttribute("title", title);
        request.setAttribute("request", queryString);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private List<Product> getProducts(HttpServletRequest request) {
        ProductService productService = ProductService.getInstance();
        int idCategory = 0, page = 0, idCategoryGroup = 0;
        List<Product> products = null;
        try {
            page = Integer.parseInt((String) request.getParameter("page"));
            idCategory = Integer.parseInt(request.getParameter("id-category"));
            idCategoryGroup = Integer.parseInt(request.getParameter("id-categoryGroup"));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        if (idCategoryGroup == 0 && idCategory == 0) {
            products = productService.getProductDiscountForPage(page);
        }
        if (idCategoryGroup != 0 && idCategory == 0) {
            products = productService.getProductByIdCategoryGroupForPage(idCategoryGroup, page);
        }
        if (idCategoryGroup != 0 && idCategory != 0) {
            products = productService.getProductByIdCategoryForPage(idCategory, page);
        }

        return products;
    }

    private String getTitle(HttpServletRequest request) {
        ProductService productService = ProductService.getInstance();
        int idCategory = 0, page = 0, idCategoryGroup = 0;

        try {
            page = Integer.parseInt((String) request.getParameter("page"));
            idCategory = Integer.parseInt(request.getParameter("id-category"));
            idCategoryGroup = Integer.parseInt(request.getParameter("id-categoryGroup"));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        if (idCategoryGroup == 0 && idCategory == 0) {
            return productService.getPageTitle(idCategory);
        }
        if (idCategoryGroup != 0 && idCategory == 0) {
            return productService.getPageTitle(16 + idCategoryGroup);
        }
        if (idCategoryGroup != 0 && idCategory != 0) {
            return productService.getPageTitle(idCategory);
        }
        return null;
    }

    private String getQuery(String query) {
        String oldQuery = query.substring(0, query.lastIndexOf("&"));
        String newQuery = query.substring(query.lastIndexOf("&") + 2, query.length());
        String name = newQuery.split("=")[0];
        if(name.equals("filter-none")){
//            return getQueryNoneFilter(oldQuery);
        }

        if(name.equals("sort-none")){
//            return getQueryNoneSort(oldQuery);
        }

        if(oldQuery.contains(newQuery)) {
            oldQuery = oldQuery.replace("&" + newQuery, "");
        }

        return null;
    }
}