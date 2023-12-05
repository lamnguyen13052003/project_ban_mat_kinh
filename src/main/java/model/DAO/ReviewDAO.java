package model.DAO;

import model.bean.Product;
import model.bean.Review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewDAO extends DAO {

    private static ReviewDAO instance;

    public static ReviewDAO getInstance() {
        return instance == null ? new ReviewDAO() : instance;
    }

    /*
       get Map<productId, listOfStars> from class InfReview
       @param List<Product> products
       @return Map<Integer, List<Integer>>
     */
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
    /*
        get information from Review by product id
        @param product id
        @return List<Review>
     */
    public List<Review> getReviews(int productId) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT r.id, r.userId, r.`comment`, r.numberStar, r.date " +
                                "FROM reviews AS r " +
                                "WHERE r.productId = ?;")
                        .bind(0, productId)
                        .mapToBean(Review.class)
                        .list()
        );
    }
}
