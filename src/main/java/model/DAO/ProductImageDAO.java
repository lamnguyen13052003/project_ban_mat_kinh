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

    public List<String> getProductImagesNonLimit(int productId, String type) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT pimg.urlImage " +
                                "FROM product_images AS pimg " +
                                "WHERE " +
                                "pimg.productId = ? AND " +
                                "pimg.`type` = ?;")
                        .bind(0, productId)
                        .bind(1, type)
                        .mapTo(String.class)
                        .list()
        );
    }

    public List<String> getProductImagesLimit(int productId, String type, int limit) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT pimg.urlImage " +
                                       "FROM product_images AS pimg " +
                                       "WHERE " +
                                        "pimg.productId = ? AND " +
                                        "pimg.`type` = ? " +
                                        "LIMIT ?;")
                        .bind(0, productId)
                        .bind(1, type)
                        .bind(2, limit)
                        .mapTo(String.class)
                        .list()
        );
    }
}
