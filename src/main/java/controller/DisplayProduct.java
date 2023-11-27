package controller;

import model.bean.Product;
import model.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisplayProduct", value = "/DisplayProduct")
public class DisplayProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = ProductService.getInstance();
        int idCategory = 0, page = 0, idCategoryGroup = 0;
        List<Product> products = null;
        String title = null;
        String idCategoryGroupStr  = request.getParameter("idCategoryGroup");
        String idCategoryStr  = request.getParameter("idCategory");
        try {
            page = Integer.parseInt((String)request.getParameter("page"));
            if(idCategoryGroupStr == null){
                idCategory = Integer.parseInt(idCategoryStr);
                products = productService.getProductByIdCategoryForPage(idCategory, page);
                if(idCategory == 0) products = productService.getProductDiscountForPage(page);

                title = productService.getPageTitle(idCategory);
            }else{
                idCategoryGroup = Integer.parseInt(idCategoryGroupStr);
                products = productService.getProductByIdCategoryGroupForPage(idCategoryGroup, page);

                title = productService.getPageTitle(16 + idCategoryGroup);
            }
        }catch (NumberFormatException e){
            System.out.println(e);
        }

        request.setAttribute("products", products);
        request.setAttribute("title", title);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}