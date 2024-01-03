package model.service;

import model.DAO.ProductDiscountDAO;
import model.DAO.ProductImageDAO;
import model.bean.Product;
import model.bean.ProductDiscount;

import java.util.List;
import java.util.Map;

public class ProductDiscountService {
    private static ProductDiscountService instance;

    public static ProductDiscountService getInstance() {
        return instance == null ? new ProductDiscountService() : instance;
    }

    public Map<Integer, Double> getPricePercentages(List<Product> products) {
        ProductDiscountDAO productDiscountDAO = ProductDiscountDAO.getInstance();
        return productDiscountDAO.getPricePercentages(products);
    }

    public Double getPricePercentage(int productId) {
        ProductDiscountDAO productDiscountDAO = ProductDiscountDAO.getInstance();
        return productDiscountDAO.getPricePercentage(productId);
    }

    public void insert(int id, List<ProductDiscount> productDiscounts) {
        System.out.println("running");
        for (ProductDiscount productDiscount : productDiscounts) {
            ProductDiscountDAO.getInstance().insert(id, productDiscount);
        }
    }
}
