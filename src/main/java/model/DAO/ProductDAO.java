package model.DAO;

import model.bean.Product;

import java.util.List;
import java.util.StringTokenizer;

public class ProductDAO extends DAO {
    private final int LIMIT = 20;
    private static ProductDAO instance;

    public static ProductDAO getInstance() {
        return instance == null ? new ProductDAO() : instance;
    }

    public List<Product> getProductByIdCategoryForPage(int idCategory, int page) {
        int offset = (page - 1) * 20;
        List<Product> products = connector.withHandle(handle ->
                handle.createQuery("SELECT p.id, p.name, p.brandName, p.price, p.material, p.`type`, p.quantity " +
                                "FROM products AS p " +
                                "WHERE p.categoryId = ? LIMIT ? OFFSET ?")
                        .bind(0, idCategory)
                        .bind(1, LIMIT)
                        .bind(2, offset)
                        .mapToBean(Product.class)
                        .list()
        );

        return products;
    }

    public List<Product> getProductDiscountForPage(int page) {
        int offset = (page - 1) * 20;
        List<Product> products = connector.withHandle(handle ->
                handle.createQuery("SELECT p.id, p.name, p.brandName, p.price, p.material, p.`type`, p.quantity " +
                                "FROM products AS p " +
                                "JOIN product_discounts AS pd ON pd.productId = p.id " +
                                "WHERE CURRENT_TIMESTAMP() BETWEEN pd.dateStart AND pd.dateEnd " +
                                "LIMIT ? OFFSET ?")
                        .bind(0, LIMIT)
                        .bind(1, offset)
                        .mapToBean(Product.class)
                        .list()
        );

        return products;
    }

    public List<Product> getProductByIdCategoryGroupForPage(int idCategoryGroup, int page) {
        int offset = (page - 1) * 20;
        List<Product> products = connector.withHandle(handle ->
                handle.createQuery("SELECT p.id, p.name, p.brandName, p.price, p.material, p.`type`, p.quantity " +
                                "FROM products AS p " +
                                "JOIN categories AS c ON c.id = p.categoryId " +
                                "WHERE c.categoryGroupId = ? " +
                                "LIMIT ? OFFSET ?")
                        .bind(0, idCategoryGroup)
                        .bind(1, LIMIT)
                        .bind(2, offset)
                        .mapToBean(Product.class)
                        .list()
        );

        return products;
    }

    public void hasNextPage(String request, int page){

    }

    public void hasPrevPage(String request, int page){
        StringTokenizer tokenizer = new StringTokenizer(request, "&");
    }
}
