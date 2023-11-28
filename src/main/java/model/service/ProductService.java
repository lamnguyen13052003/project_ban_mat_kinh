package model.service;

import model.DAO.ProductDAO;
import model.bean.Product;

import java.text.NumberFormat;
import java.util.*;
import java.util.Map.Entry;

public class ProductService {
    public static ProductService instance;
    private ProductDAO productDAO = ProductDAO.getInstance();
    private static final Map<Integer, String> MAP_PAGE = new HashMap<Integer, String>();

    static {
        MAP_PAGE.put(0, "Khuyến mãi");
        MAP_PAGE.put(1, "Kính mát nam");
        MAP_PAGE.put(2, "Kính mát nữ");
        MAP_PAGE.put(3, "Kính đi ngày và đêm");
        MAP_PAGE.put(4, "Kính đổi màu");
        MAP_PAGE.put(5, "Kính lọc ánh sáng xanh");
        MAP_PAGE.put(6, "Kính mắt clip on 2 lớp");
        MAP_PAGE.put(7, "Gọng kính trẻ en");
        MAP_PAGE.put(8, "Kính mát trẻ em");
        MAP_PAGE.put(9, "Gọng kính nữa khung");
        MAP_PAGE.put(10, "Gọng kính khoan");
        MAP_PAGE.put(11, "Gọng kính tròn");
        MAP_PAGE.put(12, "Gọng kính titan");
        MAP_PAGE.put(13, "Tròng kính chống ánh sáng xanh");
        MAP_PAGE.put(14, "Tròng kính đổi màu");
        MAP_PAGE.put(15, "Tròng kính màu");
        MAP_PAGE.put(16, "Tròng kính cho gọng khoan");

        MAP_PAGE.put(17, "Kính mát");
        MAP_PAGE.put(18, "Mắt kính trẻ em");
        MAP_PAGE.put(19, "Gọng kính");
        MAP_PAGE.put(20, "Tròng kính");
    }

    public String getPageTitle(int page) {
        return MAP_PAGE.get(page);
    }

    public static ProductService getInstance() {
        return instance == null ? new ProductService() : instance;
    }

    public List<Product> getProductByIdCategoryForPage(int idCategory, int page) {
        List<Product> products = productDAO.getProductByIdCategoryForPage(idCategory, page);
        setUpProduct(products);
        return products;
    }

    public List<Product> getProductDiscountForPage(int page) {
        List<Product> products = productDAO.getProductDiscountForPage(page);
        setUpProduct(products);
        return products;
    }

    public List<Product> getProductByIdCategoryGroupForPage(int idCategoryGroup, int page) {
        List<Product> products = productDAO.getProductByIdCategoryGroupForPage(idCategoryGroup, page);
        setUpProduct(products);
        return products;
    }

    public void setUpProduct(List<Product> products) {
        setImageDemo(products);
        setStarNumber(products);
        setReducedPrice(products);
        setTotalQuantitySold(products);
    }

    private void setImageDemo(List<Product> products) {
        ProductImageService productImageService = new ProductImageService();
        Map<Integer, List<String>> mapProductImages = productImageService.getImageDemoProduct(products);
        int id;
        for (Product product : products) {
            id = product.getId();
            product.setImages((ArrayList<String>) mapProductImages.get(id));
        }
    }

    private void setStarNumber(List<Product> products) {
        ReviewService reviewService = new ReviewService();
        Map<Integer, InfReview> mapStarNumber = reviewService.getInfReview(products);
        int id;
        for (Product product : products) {
            id = product.getId();
            InfReview infReview = mapStarNumber.get(id);
            product.setStarNumber(infReview.getStarNumber());
            product.setTotalReview(infReview.getTotalReview());
        }
    }

    private void setReducedPrice(List<Product> products) {
        ProductDiscountService productDiscountService = new ProductDiscountService();
        Map<Integer, Double> mapProductPricePercentage = productDiscountService.getPricePercentages(products);
        int id;
        double pricePercentage, discount;

        NumberFormat nf = NumberFormat.getCompactNumberInstance();
        nf.setMaximumFractionDigits(2);
        for (Product product : products) {
            id = product.getId();
            pricePercentage = mapProductPricePercentage.get(id);
            discount = product.getPrice() * (1.0 - pricePercentage);
            if (Double.compare(pricePercentage, 0) == 0) {
                discount = 0;
            }

            product.setDiscount(discount);
        }
    }


    private void setTotalQuantitySold(List<Product> products) {
        BillDetailService billDetailService = new BillDetailService();
        Map<Integer, Integer> mapTotalQuantitySold = billDetailService.getTotalQuantitySold(products);
        int id = 0;
        for (Product product : products) {
            id = product.getId();
            product.setTotalQuantitySold(mapTotalQuantitySold.get(id));
        }
    }
}
