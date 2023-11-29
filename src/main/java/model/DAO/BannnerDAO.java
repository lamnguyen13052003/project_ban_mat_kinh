package model.DAO;

import db.JDBIConnector;
import model.bean.Review;
import model.bean.ReviewImage;
import org.jdbi.v3.core.Jdbi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class BannnerDAO {
    private static Jdbi conn;
    private static BannnerDAO INSTANCE;

    public static BannnerDAO getInstance() {return INSTANCE != null ? INSTANCE : new BannnerDAO();}

    public List<ReviewImage> getSlideShowImages() {
        conn = JDBIConnector.get();
        List<ReviewImage> list = new ArrayList<>();
        // lay data cot id va comment cua table Review
        List<Review> comments = conn.withHandle(handle ->
                handle.createQuery("SELECT r.id, r.comment FROM reviews r WHERE r.comment LIKE 'slide%'")
                .mapToBean(Review.class).list());
        if(comments.isEmpty()) return null;

        for (int i = 0; i < comments.size(); i++) {
           ReviewImage reviewImage = getUrlImageById(comments.get(i).getId());
            list.add(reviewImage);
        }
        return  list;
    }

    private ReviewImage getUrlImageById(Integer reviewId) {
       List<ReviewImage> image = conn.withHandle(handle ->
                handle.createQuery("SELECT ri.urlImage FROM review_images ri WHERE ri.reviewId = :id")
                        .bind("id", reviewId)
                        .mapToBean(ReviewImage.class).list());
       return !image.isEmpty() && image.size() == 1? image.get(0) : null;
    }

    public static void main(String[] args) {
//        System.out.println(BannnerDAO.getInstance().getSlideShowImages());

    }
}
