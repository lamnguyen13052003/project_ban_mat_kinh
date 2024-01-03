package controller.edit_product;

import controller.Action;
import model.bean.Product;
import model.service.ProductService;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

public class AddProduct implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("submit-product") != null
                && request.getSession().getAttribute("submit-product").equals(request.getParameter("product-id"))) return;
        Product product = new Product();
        product.setName(request.getParameter("product-name"));
        try {
            product.setId(Integer.parseInt(request.getParameter("product-id")));
            request.getSession().setAttribute("submit-product", request.getParameter("product-id"));
            product.setCategoryId(Integer.parseInt(request.getParameter("product-category-id")));
            product.setPrice(Integer.parseInt(request.getParameter("product-price")));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        product.setDescribe(request.getParameter("product-describe"));
        product.setBrandName(request.getParameter("brand"));
        product.setMaterial(request.getParameter("material"));
        product.setType(request.getParameter("type"));
        product.setModels(request.getParameterValues("model"));
        product.setProductImages(request.getParameterValues("product-image"));
        product.setProductDiscount(request.getParameterValues("product-discount"));
        ProductService.getInstance().update(product);
        request.getSession().removeAttribute("product-id");
        request.getSession().removeAttribute("submit-product");
        request.getSession().setAttribute("message", "Thêm sản phẩm thành thông!");
        response.getWriter().println("Thêm thành công!");
    }
}
