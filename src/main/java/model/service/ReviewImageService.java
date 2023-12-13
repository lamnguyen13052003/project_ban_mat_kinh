package model.service;

import model.DAO.ReviewImageDAO;
import model.bean.Review;

import java.util.List;
import java.util.Map;

public class ReviewImageService {
    private static ReviewImageService instance;

    public static ReviewImageService getInstance() {
        return instance == null ? new ReviewImageService() : instance;
    }

    public Map<Integer, List<String>> mapReviewImage(List<Review> reviews) {
        return ReviewImageDAO.getInstance().mapReviewImage(reviews);
    }
}
