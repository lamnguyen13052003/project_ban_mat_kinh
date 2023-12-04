package model.service;

import model.DAO.ReviewDAO;
import model.DAO.ReviewImageDAO;
import model.bean.Product;
import model.bean.Review;
import model.bean.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ReviewService {
    private static ReviewService instance;
    public static ReviewService getInstance() {
        return instance == null ? new ReviewService() : instance;
    }

    public Map<Integer, InfReview> getInfReview(List<Product> products){
        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        Map<Integer, List<Integer>> reviews = reviewDAO.getInfReview(products);
        Map<Integer, InfReview> result = new HashMap<Integer, InfReview>();
        for(Entry<Integer, List<Integer>> entry : reviews.entrySet()){
            int averageStarNumber = averageStarNumber(entry.getValue());
            result.put(entry.getKey(), new InfReview(averageStarNumber, entry.getValue().size()));
        }

        return result;
    }
    public Map<Integer, InfReview> getInfReviewDescendingByStart(List<Product> products){
        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        Map<Integer, List<Integer>> reviews = reviewDAO.getInfReview(products);
        Map<Integer, InfReview> result = new HashMap<Integer, InfReview>();
        // Chuyển đổi HashMap thành một danh sách Map.Entry
        List<Map.Entry<Integer, InfReview>> entryList = new ArrayList<>(result.entrySet());
        // Sắp xếp danh sách sử dụng Comparator cho giá trị giam dan
        Collections.sort(entryList, Collections.reverseOrder(Comparator.comparingInt(entry -> entry.getValue().getStarNumber())));

        for(Entry<Integer, List<Integer>> entry : reviews.entrySet()){
            int averageStarNumber = averageStarNumber(entry.getValue());
            result.put(entry.getKey(), new InfReview(averageStarNumber, entry.getValue().size()));
        }
        return result;
    }

    public int averageStarNumber(List<Integer> stars){
        int sum = 0, size = stars.size();
        if(size == 0) return 5;
        double residual;
        for(Integer star : stars){
            sum += star;
        }

        residual = sum/(double)size - sum/size;
        return residual >= 0.5 ? sum/size + 1 : sum/size;
    }

    public List<Review> getReviews(int productId){
        List<Review> reviews = ReviewDAO.getInstance().getReviews(productId);
        setUser(reviews);
        setImage(reviews);
        return reviews;
    }

    private void setUser(List<Review> reviews){
        UserService userService = UserService.getInstance();
        Map<Integer, User> mapUsers = userService.getUserForReviewProduct(reviews);
        for(Review review : reviews){
            review.setUser(mapUsers.get(review.getId()));
        }
    }

    private void setImage(List<Review> reviews){
        ReviewImageService reviewImageService = ReviewImageService.getInstance();
        Map<Integer, List<String>> mapReviewImage = reviewImageService.mapReviewImage(reviews);
        for(Review review : reviews){
            review.setImages(mapReviewImage.get(review.getId()));
        }
    }
}

class InfReview{
    private int starNumber, totalReview;

    public InfReview(int starNumber, int totalReview) {
        this.starNumber = starNumber;
        this.totalReview = totalReview;
    }

    public InfReview() {
    }

    public int getStarNumber() {
        return starNumber;
    }

    public void setStarNumber(int starNumber) {
        this.starNumber = starNumber;
    }

    public int getTotalReview() {
        return totalReview;
    }

    public void setTotalReview(int totalReview) {
        this.totalReview = totalReview;
    }



}
