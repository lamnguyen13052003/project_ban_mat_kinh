package controller;

import helper.SendMail;
import model.bean.Bill;
import model.service.BillService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "sendBillToUserController", value = "/sendBillToUserController")
public class sendBillToUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       BillService billService = new BillService();
        Bill bill = billService.getBill();
        String url = "http://localhost/marven_war";
        String mess = SendMail.sendBillForUser(bill, url);
        SendMail.Send(bill.getEmail(), "HÓA ĐƠN ĐÃ THANH TOÁN", mess);
    }
}