package model.service;

import model.DAO.ProductDAO;
import model.bean.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ProductService {
    public static ProductService instance;
    private List<Product> products;
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

    public String getPageTitle(int page){
        return MAP_PAGE.get(page);
    }

    public static ProductService getInstance() {
        return instance == null ? new ProductService() : instance;
    }

    public List<Product> getProductByIdCategoryForPage(int idCategory, int page){
        products = productDAO.getProductByIdCategoryForPage(idCategory, page);
        setImageDemo();
        setStarNumber();
        setReducedPrice();
        return products;
    }

    public List<Product> getProductDiscountForPage(int page){
        products = productDAO.getProductDiscountForPage(page);
        setImageDemo();
        setStarNumber();
        setReducedPrice();
        return products;
    }

    public List<Product> getProductByIdCategoryGroupForPage(int idCategoryGroup, int page){
        products = productDAO.getProductByIdCategoryGroupForPage(idCategoryGroup, page);
        setImageDemo();
        setStarNumber();
        setReducedPrice();
        return products;
    }

    private void setImageDemo(){
        ProductImageService productImageService = new ProductImageService();
        Map<Integer, List<String>> mapProductImages =  productImageService.getImageDemoProduct(products);
        for(Entry<Integer, List<String>> entry : mapProductImages.entrySet()){
            for(Product product : products){
                if(product.equalsId(entry.getKey())){
                    product.setImages((ArrayList<String>) entry.getValue());
                    break;
                }
            }
        }
    }

    private void setStarNumber(){
        ReviewService reviewService = new ReviewService();
        Map<Integer, Integer> mapStarNumber = reviewService.getStarNumber(products);
        for(Entry<Integer, Integer> entry : mapStarNumber.entrySet()){
            for(Product product : products){
                if(product.equalsId(entry.getKey())){
                    product.setStarNumber(entry.getValue());
                    break;
                }
            }
        }
    }

    private void setReducedPrice(){
        ProductDiscountService productDiscountService = new ProductDiscountService();
        Map<Integer, Double> mapProductPricePercentage = productDiscountService.getPricePercentages(products);
        int discount;
        for(Entry<Integer, Double> entry : mapProductPricePercentage.entrySet()){
            for(Product product : products){
                if(product.equalsId(entry.getKey())){
                    discount = 0;
                    if(Double.compare(entry.getValue(), 0) != 0) {
                        discount = (int) (product.getPrice()*(1 - entry.getValue()));
                    }

                    product.setDiscount(discount);
                    break;
                }
            }
        }
    }
}
