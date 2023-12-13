package controller.cart;

import controller.Action;
import model.service.CartService;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddProductCart implements Action {
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CartService cart = (CartService) session.getAttribute("cart");
        if (cart == null) cart = new CartService();
        int productId = 0;
        int modelId = 0;
        int quantity = 0;
        try {
            productId = Integer.parseInt(request.getParameter("productId"));
            modelId = Integer.parseInt(request.getParameter("modelId"));
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }

        if (!cart.addProductCart(productId, modelId, quantity)) response.getWriter().write("error");
        else {
            session.setAttribute("cart", cart);
            JSONObject json = new JSONObject();
            json.put("amountProduct", cart.getTotalProduct());
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
        }
    }
}