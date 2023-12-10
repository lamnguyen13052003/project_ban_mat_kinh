package model.service;

import model.DAO.BannnerDAO;
import model.bean.BannerImage;
import model.bean.ReviewImage;

import java.util.List;
import java.util.Map;

public class BannerService {
    private static BannerService INSTANCE;
    private BannnerDAO bannnerDAO;

    public static BannerService getInstance() { return INSTANCE != null ? INSTANCE :  new BannerService(); }

    /*
        get slide show images
     */
    public List<BannerImage> getSlideShowImages() {

        return  BannnerDAO.getInstance().getSlideShowImages();
    }
    /*
       get banner signup images
    */
    public BannerImage getBannerSignupImages() {

        return  BannnerDAO.getInstance().getBannerSignupImages().get(0);
    }
    /*
       get banner login images
    */
    public BannerImage getBannerLoginImages() {

        return  BannnerDAO.getInstance().getBannerLoginImages().get(0);
    }
    /*
       get banner pr images
    */
    public BannerImage getBannerPRImages() {

        return  BannnerDAO.getInstance().getBannerPRImages().get(0);
    }
    /*
       get slide show images
    */
    public BannerImage getLogoImages() {

        return  BannnerDAO.getInstance().getLogoImages().get(0);
    }
    /*
    upload banner image
     */
    public void uploadBannerImage(String url, BannerImage bannerImage) {
        System.out.println("service run");
        BannnerDAO.getInstance().updateBannerImage(url, bannerImage);
    }
    public static void main(String[] args) {


    }
}
