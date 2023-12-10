package model.DAO;

import db.JDBIConnector;
import model.bean.BannerImage;
import model.bean.Review;
import model.bean.ReviewImage;
import org.jdbi.v3.core.Jdbi;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class BannnerDAO extends  DAO{
    private static Jdbi conn;
    private static BannnerDAO INSTANCE;

    public static BannnerDAO getInstance() {return INSTANCE != null ? INSTANCE : new BannnerDAO();}

    public List<BannerImage> getSlideShowImages() {
        String slide = "slide%";
        // lay data cot id va comment cua table Review
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                .mapToBean(BannerImage.class).list());
    }
    public List<BannerImage> getLogoImages() {
        String slide = "%banner%logo%";
        // lay data cot id va comment cua table Review
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                        .mapToBean(BannerImage.class).list());
    }
    public List<BannerImage> getBannerLoginImages() {
        String slide = "%banner%login%";
        // lay data cot id va comment cua table Review
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                        .mapToBean(BannerImage.class).list());
    }
    public List<BannerImage> getBannerSignupImages() {
        String slide = "%banner%signup%";
        // lay data cot id va comment cua table Review
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                        .mapToBean(BannerImage.class).list());
    }
    public List<BannerImage> getBannerPRImages() {
        String slide = "%banner%pr%";
        // lay data cot id va comment cua table Review
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                        .mapToBean(BannerImage.class).list());
    }

    /**
     * update image banner
     */
    public boolean updateBannerImage(String url, BannerImage bannerId) {
        System.out.println("dao run");
      return  connector.withHandle(handle ->
                handle.createQuery("update banner_images set urlImage = :urlImage where id = :id")
                        .bind("urlImage",url)
                        .bind("id", bannerId.getId())
                        .mapToBean(BannerImage.class).findFirst().isEmpty());
    }
}