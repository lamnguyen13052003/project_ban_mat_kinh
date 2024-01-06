package controller.product_manager;

import controller.Action;
import model.DAO.ProductDAO;
import model.bean.Product;
import model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class GetProduct implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String[] brandNames = request.getParameterValues("brand-name");
        System.out.println(Arrays.toString(brandNames));
        String[] categoryIds = request.getParameterValues("category-id");
        String[] categoryGroupIds = request.getParameterValues("category-group-id");
        String[] arrayAvailable = request.getParameterValues("available");
        String[] pages = request.getParameterValues("page");
        List<Product> products;
        List<String> listBrandName = null;
        String brandName, requestStr = "";
        ProductService productService;
        int available = 0, page = 1, offset, totalProduct, categoryId = 0, categoryGroupId = -1;
        brandName = brandNames == null ? "" : brandNames[brandNames.length - 1];
        try {
            available = Integer.parseInt(arrayAvailable == null ? "0" : arrayAvailable[arrayAvailable.length - 1]);
            page = Integer.parseInt(pages == null ? "1" : pages[pages.length - 1]);
            categoryId = Integer.parseInt(categoryIds == null ? "-1" : categoryIds[categoryIds.length - 1]);
            categoryGroupId = Integer.parseInt(categoryGroupIds == null ? "-1" : categoryGroupIds[categoryGroupIds.length - 1]);
        } catch (NumberFormatException e) {
        }
        offset = (page - 1) * 7;
        productService = ProductService.getInstance();
        products = productService.getProductForAdmin(categoryGroupId, categoryId, brandName, available, 7, offset);
        totalProduct = productService.totalProduct(categoryGroupId, categoryId, brandName, available);
        listBrandName = ProductService.getInstance().getBrands();
        requestStr = "product_manager?categoryGroupId=" + categoryGroupId + "&categoryId=" + categoryId + "&brand-name=" + brandName + "&available=" + available + "&page=" + page;
        request.setAttribute("products", products);
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("page", page);
        request.setAttribute("request", requestStr);
        request.setAttribute("brand-name", listBrandName);
        request.getRequestDispatcher("quan_ly_san_pham.jsp").forward(request, response);
    }
}
