package model.service;

import model.DAO.ProductDAO;
import model.bean.Product;

import java.text.NumberFormat;
import java.util.*;

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

    public static ProductService getInstance() {
        return instance == null ? new ProductService() : instance;
    }

    /**
     * Lấy tiêu đề trang
     *
     * @param idCategoryGroup id nhóm danh mục
     * @param idCategory      id danh mục
     */
    public String getTitle(int idCategoryGroup, int idCategory) {
        ProductService productService = ProductService.getInstance();

        if (idCategoryGroup == 0 && idCategory == 0) {
            return MAP_PAGE.get(idCategory);
        }
        if (idCategoryGroup != 0 && idCategory == 0) {
            return MAP_PAGE.get(16 + idCategoryGroup);
        }
        if (idCategoryGroup != 0 && idCategory != 0) {
            return MAP_PAGE.get(idCategory);
        }
        return null;
    }

    /**
     * Lấy các sản phẩm theo câu query
     *
     * @param query câu query từ thanh URL
     */
    public List<Product> getProducts(String query) {
        ProductDAO productDAO = ProductDAO.getInstance();
        Map<String, Integer> mapInfRoot = new LinkedHashMap<>();
        Map<String, List<String>> mapFilter = new LinkedHashMap<>();
        Map<String, String> mapSort = new LinkedHashMap<>();

        initMapQueryRequest(query, mapInfRoot, mapFilter, mapSort);
        List<Product> products = productDAO.getProducts(mapInfRoot, mapFilter, mapSort);
        System.out.println("result: " + products.size());
        setOtherFieldsProduct(products);

        return products;
    }

    /**
     * Khởi tạo các map query
     *
     * @param query      cấu query lấy từ thanh URL
     * @param mapInfRoot chứa các dữ liệu liên quan đến id nhóm danh mục, id danh muc va trang đang đứng
     * @param mapFilter  chứa các giá trị bộ lọc
     * @param mapSort    chứa các giá trị liên quan đến sắp xếp
     */
    private void initMapQueryRequest(String query, Map<String, Integer> mapInfRoot, Map<String, List<String>> mapFilter, Map<String, String> mapSort) {
        List<String> values;
        String oldRequest = query.substring(0, query.lastIndexOf("&"));
        String newRequest = query.substring(query.lastIndexOf("&"), query.length());
        StringTokenizer tk;
        String name;
        String valueStr;
        int valueInt;

        if (oldRequest.contains(newRequest)) {
            query = oldRequest.replace(newRequest, "");
        }

        tk = new StringTokenizer(query, "&=");
        while (tk.hasMoreTokens()) {
            name = tk.nextToken();
            if (name.startsWith("filter")) {
                valueStr = tk.nextToken();

                if (!newRequest.contains("filter-none")) {
                    values = mapFilter.get(name) == null ? new ArrayList<>() : mapFilter.get(name);
                    values.add(valueStr);
                    mapFilter.put(name, values);
                }
            }

            if (name.startsWith("sort")) {
                valueStr = tk.nextToken();
                if (!query.contains("sort-none")) mapSort.put(name, valueStr);
            }

            if (!name.startsWith("filter") && !name.startsWith("sort")) {
                valueInt = Integer.parseInt(tk.nextToken());
                mapInfRoot.put(name, valueInt);
            }
        }
    }

    /*
     * Xữ lý lại địa chỉ thanh URL cho hợp lý
     * */
    public String getSQLQueryRequest(String query) {
        StringTokenizer tk = new StringTokenizer(query, "&=");
        String oldRequest = query.substring(0, query.lastIndexOf("&"));
        String newRequest = query.substring(query.lastIndexOf("&"), query.length());
        String name;
        StringBuilder sb = new StringBuilder();

        if (oldRequest.contains(newRequest)) {
            return oldRequest.replace(newRequest, "");
        }

        if (newRequest.contains("sort-none") || newRequest.contains("filter-none")) {
            while (tk.hasMoreTokens()) {
                name = tk.nextToken();
                if (name.startsWith("sort") || name.startsWith("filter")) {
                    tk.nextToken();
                } else {
                    if (!sb.isEmpty()) sb.append("&");
                    sb.append(name);
                    sb.append("=");
                    sb.append(tk.nextToken());
                }
            }

            return sb.toString();
        }

        return query;
    }

    /**/
    public void setOtherFieldsProduct(List<Product> products) {
        setImageDemo(products);
        setStarNumber(products);
        setReducedPrice(products);
        setTotalQuantitySold(products);
    }
    public void setOtherFieldsProductByStar(List<Product> products) {
        setImageDemo(products);
        setStarNumberDescending(products);
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
    private void setStarNumberDescending(List<Product> products) {
        ReviewService reviewService = new ReviewService();
        Map<Integer, InfReview> mapStarNumber = reviewService.getInfReviewDescendingByStart(products);
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
    public List<Product> getInfoProminentProductByStart(){
        return ProductDAO.getInstance().getInfoProminentProductByStart();
    }

}
