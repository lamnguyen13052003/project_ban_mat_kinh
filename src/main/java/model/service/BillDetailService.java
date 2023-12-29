package model.service;

import model.DAO.BillDetailDAO;
import model.bean.Bill;
import model.bean.BillDetail;
import model.bean.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BillDetailService {
    public Map<Integer, Integer> getTotalQuantitySold(List<Product> products) {
        BillDetailDAO billDetailDAO = BillDetailDAO.getInstance();
        return billDetailDAO.getTotalQuantitySold(products);
    }

    public void insert(int id, List<BillDetail> details) {
        BillDetailDAO billDetailDAO = BillDetailDAO.getInstance();
        billDetailDAO.insert(id, details);
    }

//    public boolean checkQuantity(Bill bill) {
//        BillDetailDAO billDetailDAO = BillDetailDAO.getInstance();
//        return billDetailDAO.checkQuantity(bill.getDetails());
//    }

    public int getTotalSale(Integer billId) {
        BillDetailDAO billDetailDAO = BillDetailDAO.getInstance();
        return billDetailDAO.getTotalSale(billId);
    }
}
