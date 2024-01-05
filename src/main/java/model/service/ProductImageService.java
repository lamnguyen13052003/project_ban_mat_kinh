package model.service;

import model.DAO.ProductImageDAO;
import model.bean.Product;
import model.bean.ProductImage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductImageService {
    private static ProductImageService instance;

    public static ProductImageService getInstance() {
        return instance == null ? new ProductImageService() : instance;
    }

    public Map<Integer, List<String>> getProductImage(List<Product> products, int limit) {
        ProductImageDAO productImageDAO = ProductImageDAO.getInstance();
        Map<Integer, List<String>> result = new HashMap<Integer, List<String>>();
        List<String> images;
        for (Product product : products) {
            int id = product.getId();
            images = productImageDAO.getProductImagesLimit(id, limit);
            if (limit == 0) {
                images = productImageDAO.getProductImagesNonLimit(id);
            }

            result.put(id, images);
        }

        return result;
    }

    public boolean insert(int productId, List<String> productImages) {
        for(String url : productImages){
            ProductImage productImage = new ProductImage(productId, url);
            ProductImageDAO.getInstance().insert(productImage);
        }

        return true;
    }
}
