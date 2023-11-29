package model.DAO;

import model.bean.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewDAO extends DAO {

    private static ReviewDAO instance;

    public static ReviewDAO getInstance() {
        return instance == null ? new ReviewDAO() : instance;
    }

    public Map<Integer, List<Integer>> getInfReview(List<Product> products) {
        Map<Integer, List<Integer>> result = new HashMap<>();
        for (Product product : products) {
            int id = product.getId();
            List<Integer> stars = connector.withHandle(handle ->
                    handle.createQuery("SELECT r.numberStar " +
                                    "FROM reviews AS r " +
                                    "WHERE r.productId = ?;")
                            .bind(0, id)
                            .mapTo(Integer.class)
                            .list()
            );

            result.put(id, stars);
        }

        return result;
    }
}
