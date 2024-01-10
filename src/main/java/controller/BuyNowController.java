package controller;

import model.bean.Model;
import model.bean.ProductCart;
import model.service.ModelService;
import model.service.ProductDiscountService;
import model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BuyNowController", value = "/buy_now")
public class BuyNowController extends HttpServlet implements Action {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = 0;
        int modelId = 0;
        int quantity = 0;
        try {
            productId = Integer.parseInt(request.getParameter("productId"));
            modelId = Integer.parseInt(request.getParameter("modelId"));
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException e) {}

        ProductService service = ProductService.getInstance();
        ModelService modelService = ModelService.getInstance();
        ProductDiscountService productDiscountService = ProductDiscountService.getInstance();

        ProductCart productCart = service.getProductCart(productId);
        if (productCart == null) return;
        Model model = modelService.getModel(modelId);
        if (model == null) return;
        Double productDiscount = productDiscountService.getPricePercentage(productId);
        productDiscount = Double.compare(productDiscount, 0.0) != 0 ? (1.0 - productDiscount) * productCart.getPrice() : 0.0;
        productCart.setDiscount(productDiscount);
        productCart.setQuantity(quantity);
        productCart.setModel(model);
        request.setAttribute("product-cart", productCart);
        request.getRequestDispatcher("mua_ngay.jsp").forward(request, response);
    }
}
