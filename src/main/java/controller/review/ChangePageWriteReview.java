package controller.review;

import controller.Action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ChangePageWriteReview implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String billIdString = request.getParameter("bill-id"),
                productIdString = request.getParameter("product-id");
        int billId, productId;
        try {

        }catch (NumberFormatException e) {
            Action.error(request, response);
        }
    }
}
