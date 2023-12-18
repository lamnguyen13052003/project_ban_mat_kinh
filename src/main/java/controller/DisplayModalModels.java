package controller;

import model.bean.Model;
import model.service.ModelService;
import model.service.ProductService;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DisplayModalModels", value = "/show-models")
public class DisplayModalModels extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        int productId = 0;
        try{
            productId = Integer.parseInt(request.getParameter("id"));
        }catch (NumberFormatException e){
            response.sendRedirect("error.jsp");
        }

        ModelService mService = ModelService.getInstance();
        ProductService pService = ProductService.getInstance();
        String productName  = pService.getNameProduct(productId);
        ArrayList<Model> models = mService.getModels(productId);
        // Đảm bảo đưa các thuộc tính vào đối tượng JSON
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("productName", productName);
        jsonObject.put("models", models);

        // Gửi dữ liệu JSON về phía client
        response.getWriter().write(jsonObject.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}