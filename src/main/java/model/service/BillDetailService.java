package model.service;

import model.DAO.BillDetailDAO;
import model.bean.Product;

import java.util.List;
import java.util.Map;

public class BillDetailService {
    public Map<Integer, Integer> getTotalQuantitySold(List<Product> products) {
        BillDetailDAO billDetailDAO = BillDetailDAO.getInstance();
        return billDetailDAO.getTotalQuantitySold(products);
    }
}
