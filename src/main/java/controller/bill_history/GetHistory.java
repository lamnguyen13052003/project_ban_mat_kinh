package controller.bill_history;

import controller.Action;
import model.bean.Bill;
import model.service.BillService;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetHistory implements Action {

    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BillService billService = BillService.getInstance();
        String menuItem = request.getParameter("menu-item");
        String userIdString = request.getParameter("user-id");
        int userId = 0;
        try {
            userId = Integer.parseInt(userIdString);
        } catch (NumberFormatException e) {
            response.sendError(404);
        }
        List<Bill> bills = billService.getBillsByUserId(userId, menuItem);
        JSONObject json = new JSONObject();
        json.put("bills", bills);
        json.put("userId", userIdString);
        response.getWriter().println(json.toString());
    }
}
