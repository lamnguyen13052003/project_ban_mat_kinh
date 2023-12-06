package controller.cart;

import model.bean.Cart;
import model.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddProductCart implements ActionCart {
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

        if (!cart.addProductCart(productId, modelId, quantity)) response.sendRedirect("error.jsp");
        else {
            session.setAttribute("cart", cart);
            response.getWriter().write(String.valueOf(cart.getTotalProduct()));
        }
    }
}