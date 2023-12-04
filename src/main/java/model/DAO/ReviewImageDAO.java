package model.DAO;

import model.bean.Review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewImageDAO extends DAO{
    private static ReviewImageDAO instance;

    public static ReviewImageDAO getInstance() {
        return instance == null ? new ReviewImageDAO() : instance;
    }


    public Map<Integer, List<String>> mapReviewImage(List<Review> reviews){
        Map<Integer, List<String>> result = new HashMap<>();
        List<String> images = null;
        for(Review review : reviews){
            int reviewId = review.getId();
            images  = getConnector().withHandle(handle ->
                    handle.createQuery("SELECT rimg.urlImage " +
                            "FROM review_images AS rimg " +
                            "WHERE rimg.reviewId = ?;")
                            .bind(0, reviewId)
                            .mapTo(String.class)
                            .list()
                    );

            result.put(reviewId, images);
        }
        return result;
    }
}
