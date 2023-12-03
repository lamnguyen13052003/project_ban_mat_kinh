package model.service;

import model.DAO.ReviewDAO;
import model.bean.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ReviewService {
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