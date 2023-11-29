package model.service;

import model.DAO.BannnerDAO;
import model.bean.ReviewImage;

import java.util.List;
import java.util.Map;

public class BannerService {
    private static BannerService INSTANCE;
    private BannnerDAO bannnerDAO;

    public static BannerService getInstance() { return INSTANCE != null ? INSTANCE :  new BannerService(); }

    public List<ReviewImage> getSlideShowImages() {

        return  BannnerDAO.getInstance().getSlideShowImages();
    }

    public static void main(String[] args) {
        System.out.println(BannerService.getInstance().getSlideShowImages());
        ;
    }
}
