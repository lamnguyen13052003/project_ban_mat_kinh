package model.service;

import model.DAO.ProductDAO;
import model.bean.Product;

import java.text.NumberFormat;
import java.util.*;

public class ProductService {
    public static ProductService instance;
    private ProductDAO productDAO = ProductDAO.getInstance();
    private static final Map<Integer, String> MAP_PAGE = new HashMap<Integer, String>();
    private final String[] REPlAY = {"&page", "&sort-name", "&sort-price"};

    static {
        MAP_PAGE.put(-1, "Tất cả");
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

    public Product getProduct(int id) {
        ProductDAO productDAO = ProductDAO.getInstance();

        List<Product> products = productDAO.getProduct(id);
        setOtherFieldsProduct(products, 0);

        return products.get(0);
    }

    public String getNameProduct(int productId) {
        ProductDAO productDAO = ProductDAO.getInstance();
        return productDAO.getNameProduct(productId);
    }

    public Product getProductCart(int id, int modelId) {
        ProductDAO productDAO = ProductDAO.getInstance();

        List<Product> products = productDAO.getProductCart(id);
        Product product = products.get(0);
        product.setModel(ModelService.getInstance().getModel(modelId));
        setReducedPrice(products);
        return product;
    }

    /**
     * Lấy các sản phẩm theo câu query
     */
    public List<Product> getProducts(Map<String, Integer> mapInfRoot, Map<String, List<String>> mapFilter, Map<String, String> mapSort, int limit) {
        ProductDAO productDAO = ProductDAO.getInstance();

        List<Product> products = productDAO.getProducts(mapInfRoot, mapFilter, mapSort, limit);
        setOtherFieldsProduct(products, 2);

        return products;
    }

    public Map<String, List<String>> getMapFilter(String query) {
        Map<String, List<String>> mapFilter = new LinkedHashMap<>();
        List<String> values;
        StringTokenizer tk;
        String name;
        String valueStr;

        tk = new StringTokenizer(query, "&=");
        while (tk.hasMoreTokens()) {
            name = tk.nextToken();
            if (name.startsWith("filter")) {
                valueStr = tk.nextToken();
                values = mapFilter.get(name);
                values = values == null ? new ArrayList<>() : values;
                values.add(valueStr);
                mapFilter.put(name, values);
            }
        }

        return mapFilter;
    }

    public Map<String, String> getMapSort(String query) {
        Map<String, String> mapSort = new LinkedHashMap<>();
        StringTokenizer tk;
        String name;
        String valueStr;

        tk = new StringTokenizer(query, "&=");
        while (tk.hasMoreTokens()) {
            name = tk.nextToken();
            if (name.startsWith("sort")) {
                valueStr = tk.nextToken();
                if (!query.contains("sort-none")) mapSort.put(name, valueStr);
            }
        }

        return mapSort;
    }

    public Map<String, Integer> getMapInfRoot(String query) {
        Map<String, Integer> mapInfRoot = new LinkedHashMap<>();
        StringTokenizer tk;
        String name;
        int valueInt;

        tk = new StringTokenizer(query, "&=");
        while (tk.hasMoreTokens()) {
            name = tk.nextToken();

            if (name.startsWith("id") || name.startsWith("page")) {
                valueInt = Integer.parseInt(tk.nextToken());
                mapInfRoot.put(name, valueInt);
            }
        }

        return mapInfRoot;
    }

    public int getTotalPages(Map<String, Integer> mapInfRoot, Map<String, List<String>> mapFilter, Map<String, String> mapSort) {
        ProductDAO productDAO = ProductDAO.getInstance();

        return productDAO.totalPages(mapInfRoot, mapFilter, mapSort);
    }

    /*
     * Xữ lý lại địa chỉ thanh URL cho hợp lý
     * */
    public String formatQueryRequest(String query) {
        String oldRequest = query.substring(0, query.lastIndexOf("&"));
        String newRequest = query.substring(query.lastIndexOf("&"), query.length());
        String name;

        if (oldRequest.contains(newRequest)) {
            return oldRequest.replace(newRequest, "");
        }

        for (String key : REPlAY) {
            if (oldRequest.contains(key) && newRequest.startsWith(key)) {
                int indexFirstFound = oldRequest.indexOf(key), indexBright = query.indexOf("&", indexFirstFound + 1), length = oldRequest.length();
                if (key.startsWith("&page"))
                    return oldRequest.substring(0, indexFirstFound)
                            + newRequest
                            + oldRequest.substring(indexBright, length);
                return oldRequest.substring(0, indexFirstFound)
                        + newRequest;
            }
        }

        StringTokenizer tk = new StringTokenizer(query, "&=");
        StringBuilder sb = new StringBuilder();
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

    private void setOtherFieldsProduct(List<Product> products, int limit) {
        if (limit == 0) {
            setModel(products);
            setProductImage(products, "describe", limit);
            setReview(products);
        }
        setProductImage(products, "product", limit);
        setStarNumber(products);
        setReducedPrice(products);
        setTotalQuantitySold(products);
    }

    private void setReview(List<Product> products) {
        ReviewService reviewService = ReviewService.getInstance();
        int id;
        for (Product product : products) {
            id = product.getId();
            product.setReviews(reviewService.getReviews(id));
        }
    }

    private void setModel(List<Product> products) {
        ModelService modelService = new ModelService();
        int id;
        for (Product product : products) {
            id = product.getId();
            product.setModels(modelService.getModels(id));
        }
    }

    private void setProductImage(List<Product> products, String type, int limit) {
        ProductImageService productImageService = new ProductImageService();
        Map<Integer, List<String>> mapProductImages = productImageService.getProductImage(products, type, limit);
        int id;
        for (Product product : products) {
            id = product.getId();
            product.setProductImages((ArrayList<String>) mapProductImages.get(id));
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

    public List<String> getBrandNames() {
        ProductDAO productDAO = ProductDAO.getInstance();
        return productDAO.getBrandNames();
    }
}
