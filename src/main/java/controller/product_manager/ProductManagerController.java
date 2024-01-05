package controller.product_manager;

import controller.Action;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductManagerController", value = "/admin_pages/product_manager")
public class ProductManagerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Action action = null;
        String actionName = request.getParameter("action");
        if(actionName == null) actionName = "";
        switch (actionName) {
            case "band-name" ->{
                action = new GetBrandProduct();
            }
            case "add" ->{
                action = new ChangePageAddProduct();
            }
            default ->{
                action = new GetProduct();
            }
        }

        action.action(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Action action = null;
        String actionName = request.getParameter("action");
        if(actionName == null) actionName = "";
        switch (actionName) {
            case "edit-product" ->{
                action = new ChangePageEditProduct();
            }
            default ->{
            }
        }
        action.action(request, response);
    }
}