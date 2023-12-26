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

        return  BannnerDAO.getInstance().getBannerSignupImages();
    }
    /*
       get banner login images
    */
    public BannerImage getBannerLoginImages() {

        return  BannnerDAO.getInstance().getBannerLoginImages();
    }
    /*
       get banner pr images
    */
    public BannerImage getBannerPRImages() {

        return  BannnerDAO.getInstance().getBannerPRImages();
    }
    /*
       get slide show images
    */
    public BannerImage getLogoImages() {

        return  BannnerDAO.getInstance().getLogoImages();
    }
    /*
    upload banner image
     */
    public void uploadBannerImage(BannerImage bannerImage) {
        BannnerDAO.getInstance().updateBannerImage(bannerImage);
    }
    /*
    insert slide image
     */
    public void insertSlideShowImages(BannerImage bannerImage){
        BannnerDAO.getInstance().insertSlideImage(bannerImage);
    }
    public int nextIdOfSlide() {return BannnerDAO.getInstance().nextId();}
}
