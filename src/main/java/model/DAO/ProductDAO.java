package model.DAO;

import model.bean.Product;

import java.util.List;

public class ProductDAO extends DAO{
    private static ProductDAO instance;
    public static ProductDAO getInstance() {
        return instance == null ? new ProductDAO() : instance;
    }
    public List<Product> getProductByIdCategoryForPage(int idCategory, int page) {
        int offset = (page-1)*20;
        List<Product> products = connector.withHandle(handle ->
                handle.createQuery("SELECT p.id, p.name, p.brandName, p.price, p.material, p.`type` " +
                                       "FROM products AS p " +
                                       "WHERE p.categoryId = ? LIMIT 20 OFFSET ?")
                        .bind(0, idCategory)
                        .bind(1, offset)
                        .mapToBean(Product.class)
                        .list()
        );

        return products;
    }

    public List<Product> getProductDiscountForPage(int page) {
        int offset = (page-1)*20;
        List<Product> products = connector.withHandle(handle ->
                handle.createQuery("SELECT p.id, p.name, p.brandName, p.price, p.material, p.`type` " +
                                "FROM products AS p " +
                                "JOIN product_discounts AS pd ON pd.productId = p.id "+
                                "WHERE CURRENT_TIMESTAMP() BETWEEN pd.dateStart AND pd.dateEnd " +
                                "LIMIT 20 OFFSET ?")
                        .bind(0, offset)
                        .mapToBean(Product.class)
                        .list()
        );

        return products;
    }

    public List<Product> getProductByIdCategoryGroupForPage(int idCategoryGroup, int page) {
        int offset = (page-1)*20;
        List<Product> products = connector.withHandle(handle ->
                handle.createQuery("SELECT p.id, p.name, p.brandName, p.price, p.material, p.`type` " +
                                "FROM products AS p " +
                                "JOIN categories AS c ON c.id = p.categoryId " +
                                "WHERE c.categoryGroupId = ? " +
                                "LIMIT 20 OFFSET ?")
                        .bind(0, idCategoryGroup)
                        .bind(1, offset)
                        .mapToBean(Product.class)
                        .list()
        );

        return products;
    }
}
