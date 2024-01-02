package controller.cart;

import controller.Action;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Locale;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Action actionCart = null;
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
            case "checked" -> {
                actionCart = new CheckedProduct();
            }
        }

        if (action != null) {
            actionCart.action(request, response);
        } else throw new IOException("");
    }
}