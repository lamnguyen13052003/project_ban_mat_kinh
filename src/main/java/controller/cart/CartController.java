package controller.cart;

import controller.Action;
import controller.BuyNowController;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Action actionCart = null;
        switch (action) {
            case "add" -> {
                actionCart = new AddProductCart();
            }
            case "checked" -> {
                actionCart = new CheckedProduct();
            }
        }

        if (action != null) {
            actionCart.action(request, response);
        } else throw new IOException("");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Action actionCart = null;
        switch (action) {
            case "remove" -> {
                actionCart = new RemoveProductCart();
            }
        }

        if (action != null) {
            actionCart.action(request, response);
        } else throw new IOException("");
    }

    @Override
    protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Action actionCart = null;
        switch (action) {
            case "increase" -> {
                actionCart = new IncreaseProductCart();
            }
            case "reduce" -> {
                actionCart = new ReduceProductCart();
            }
        }

        if (action != null) {
            actionCart.action(request, response);
        } else throw new IOException("");
    }
}