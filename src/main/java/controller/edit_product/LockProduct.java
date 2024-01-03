package controller.edit_product;

import controller.Action;
import model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LockProduct implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = 0;
        try {
            productId = Integer.parseInt(request.getParameter("product-id"));
        } catch (NumberFormatException e) {
        }

        ProductService.getInstance().lock(productId);
    }
}
