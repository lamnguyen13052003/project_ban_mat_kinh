package controller.product_manager;

import controller.Action;
import model.bean.Product;
import model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetProduct implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] brandNames = request.getParameterValues("brand-name"),
                categoryIds = request.getParameterValues("category-id"),
                categoryGroupIds = request.getParameterValues("category-group-id"),
                arrayAvailable = request.getParameterValues("available"),
                pages = request.getParameterValues("page"),
                names = request.getParameterValues("name");
        List<Product> products;
        List<String> listBrandName = null;
        String brandName, requestStr = "", name = null;
        ProductService productService;
        int available = 0, page = 1, offset, totalProduct, categoryId = 0, categoryGroupId = -1;
        brandName = brandNames == null ? "" : brandNames[brandNames.length - 1];
        name = names == null ? "" : names[names.length - 1];
        try {
            available = Integer.parseInt(arrayAvailable == null ? "0" : arrayAvailable[arrayAvailable.length - 1]);
            page = Integer.parseInt(pages == null ? "1" : pages[pages.length - 1]);
            categoryId = Integer.parseInt(categoryIds == null ? "-1" : categoryIds[categoryIds.length - 1]);
            categoryGroupId = Integer.parseInt(categoryGroupIds == null ? "-1" : categoryGroupIds[categoryGroupIds.length - 1]);
        } catch (NumberFormatException e) {
        }
        offset = (page - 1) * 7;
        productService = ProductService.getInstance();
        products = productService.getProductForAdmin(name, categoryGroupId, categoryId, brandName, available, 7, offset);
        totalProduct = productService.totalProduct(name, categoryGroupId, categoryId, brandName, available);
        listBrandName = ProductService.getInstance().getBrands();

        requestStr = "product_manager?categoryGroupId=" + categoryGroupId + "&categoryId=" + categoryId + "&brand-name=" + brandName + "&available=" + available + "&page=" + page;
        request.setAttribute("products", products);
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("page", page);
        request.setAttribute("request", requestStr);
        request.setAttribute("list-brand-name", listBrandName);
        request.setAttribute("brand-name", getBrandName(brandName));
        request.setAttribute("category", getCategory(categoryGroupId, categoryId));
        request.setAttribute("availableString", getAvailableString(available));
        request.setAttribute("page", page);
        request.setAttribute("available", available);
        request.setAttribute("category-id", categoryId);
        request.setAttribute("category-group-id", categoryGroupId);
        request.getRequestDispatcher("quan_ly_san_pham.jsp").forward(request, response);
    }

    private String getAvailableString(int available) {
        switch (available) {
            case 0 -> {
                return "Tất cả";
            }
            case 1 -> {
                return "Còn hàng";
            }
            case -1 -> {
                return "Hết hàng";
            }
        }

        return "---------------Trạng thái---------------";
    }

    private String getBrandName(String brandName) {
        if (brandName == null || brandName.equals(""))
            return "Tất cả";

        return brandName;
    }

    private String getCategory(int categoryGroupId, int categoryId) {
        if (categoryGroupId != -1 && categoryId == -1) {
            return ProductService.MAP_PAGE.get(16 + categoryGroupId);
        }
        if (categoryGroupId == -1 && categoryId != -1) {
            return ProductService.MAP_PAGE.get(categoryId);
        }

        if (categoryGroupId == -1 && categoryId == -1) {
            return "Tất cả";
        }

        return "---------------Danh mục---------------";
    }
}
