package model.service;

import model.DAO.ProductDiscountDAO;
import model.bean.Product;

import java.util.List;
import java.util.Map;

public class ProductDiscountService {
    public Map<Integer, Double> getPricePercentages(List<Product> products) {
        ProductDiscountDAO productDiscountDAO = ProductDiscountDAO.getInstance();
        return productDiscountDAO.getPricePercentages(products);
    };
}
