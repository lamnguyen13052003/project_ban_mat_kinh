package model.service;

import model.DAO.ProductImageDAO;
import model.bean.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductImageService {
    public Map<Integer, List<String>> getImageDemoProduct(List<Product> products){
        ProductImageDAO productImageDAO = ProductImageDAO.getInstance();
        Map<Integer, List<String>> result = new HashMap<Integer, List<String>>();
        for(Product product : products){
            int id = product.getId();
            List<String> images = productImageDAO.getProductImagesLimit(id, "product", 2);
            result.put(id, images);
        }

        return result;
    }
}
