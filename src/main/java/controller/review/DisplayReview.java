package controller.review;

import controller.Action;
import model.bean.Model;
import model.bean.Product;
import model.bean.User;
import model.service.BillService;
import model.service.ModelService;
import model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DisplayReview implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdStr = request.getParameter("productId"),
                modelIdStr = request.getParameter("modelId");
        User user = (User) request.getSession().getAttribute("user");
        int productId, modelId;
        if (productIdStr == null || modelIdStr == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        try {
            productId = Integer.parseInt(productIdStr);
            modelId = Integer.parseInt(modelIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
            return;
        }

        BillService billService = new BillService();
        if (!billService.bought(user.getId(), productId, modelId)) {
            response.sendRedirect("error.jsp");
            return;
        }

        ProductService productService = ProductService.getInstance();
        Product product = productService.getProductForReview(productId);
        ModelService modelService = ModelService.getInstance();
        Model model = modelService.getModel(modelId);

        if(product == null || model == null){
            response.sendRedirect("error.jsp");
            return;
        }

        product.setModel(model);
        request.setAttribute("product", product);
    }
}
