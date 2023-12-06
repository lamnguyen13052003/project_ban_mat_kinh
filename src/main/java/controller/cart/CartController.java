package controller.cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        ActionCart actionCart = null;
        switch (action) {
            case "add" -> {
                actionCart = new AddProductCart();
            }
            case "remove" -> {
                actionCart = new RemoveProductCart();
            }
            case "increase" -> {
                actionCart = new IncreaseProductCart();
            }
            case "reduce" -> {
                actionCart = new ReduceProductCart();
            }
        }

        if (action != null) actionCart.action(request, response);
        else response.sendRedirect("error.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}