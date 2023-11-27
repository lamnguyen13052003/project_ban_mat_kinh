package model.service;

import model.DAO.ReviewDAO;
import model.bean.Product;
import model.bean.Review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ReviewService {
    public Map<Integer, Integer> getStarNumber(List<Product> products){
        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        Map<Integer, List<Integer>> reviews = reviewDAO.getStarNumber(products);
        Map<Integer, Integer> result = new HashMap<Integer, Integer>();
        for(Entry<Integer, List<Integer>> entry : reviews.entrySet()){
            int averageStarNumber = averageStarNumber(entry.getValue());
            result.put(entry.getKey(), averageStarNumber);
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
