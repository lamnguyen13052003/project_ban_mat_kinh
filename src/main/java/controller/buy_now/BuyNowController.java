package controller.buy_now;

import controller.Action;
import controller.cart.*;
import model.bean.Cart;
import model.bean.Model;
import model.bean.ProductCart;
import model.service.BillService;
import model.service.ModelService;
import model.service.ProductDiscountService;
import model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.Locale;

@WebServlet(name = "BuyNowController", value = "/buy_now")
public class BuyNowController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionStr = request.getParameter("action");
        Action action = null;
        switch (actionStr) {
            case "buy-now" -> {
                action = new ChangePageBuyNow();
            }
            case "increase" -> {
                action = new IncreaseProductBuyNow();
            }
            case "reduce" -> {
                action = new ReduceProductBuyNow();
            }
        }

        if (action != null) {
            action.action(request, response);
        } else throw new IOException("");
    }
}
