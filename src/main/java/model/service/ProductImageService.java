package model.service;

import model.DAO.ProductImageDAO;
import model.bean.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductImageService {
    public Map<Integer, List<String>> getProductImage(List<Product> products, boolean limit){
        ProductImageDAO productImageDAO = ProductImageDAO.getInstance();
        Map<Integer, List<String>> result = new HashMap<Integer, List<String>>();
        List<String> images;
        for(Product product : products){
            int id = product.getId();
            images = productImageDAO.getProductImagesLimit(id);
            if(!limit){
                images = productImageDAO.getProductImagesNonLimit(id);
            }

            result.put(id, images);
        }

        return result;
    }

    public Map<Integer, List<String>> getDescribeImage(List<Product> products){
        ProductImageDAO productImageDAO = ProductImageDAO.getInstance();
        Map<Integer, List<String>> result = new HashMap<Integer, List<String>>();
        List<String> images;
        for(Product product : products){
            int id = product.getId();
            images = productImageDAO.getProductImagesDescribe(id);
            result.put(id, images);
        }

        return result;
    }
}
