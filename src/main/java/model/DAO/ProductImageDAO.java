package model.DAO;

import model.bean.Product;
import model.bean.ProductImage;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductImageDAO extends DAO {
    private static ProductImageDAO instance;

    public static ProductImageDAO getInstance() {
        return instance == null ? new ProductImageDAO() : instance;
    }

    public List<String> getProductImagesNonLimit(int productId) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT pimg.urlImage " +
                                "FROM product_images AS pimg " +
                                "WHERE " +
                                "pimg.productId = ?;")
                        .bind(0, productId)
                        .mapTo(String.class)
                        .list()
        );
    }

    public List<String> getProductImagesLimit(int productId, int limit) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT pimg.urlImage " +
                                       "FROM product_images AS pimg " +
                                       "WHERE " +
                                        "pimg.productId = ? " +
                                        "LIMIT ?;")
                        .bind(0, productId)
                        .bind(1, limit)
                        .mapTo(String.class)
                        .list()
        );
    }
}
