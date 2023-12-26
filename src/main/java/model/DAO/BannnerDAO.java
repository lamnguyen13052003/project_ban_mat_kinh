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
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                .mapToBean(BannerImage.class).list());
    }
    public BannerImage getLogoImages() {
        String slide = "%banner%logo%";
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                        .mapToBean(BannerImage.class).findFirst().orElse(null));
    }
    public BannerImage getBannerLoginImages() {
        String slide = "%banner%login%";
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                        .mapToBean(BannerImage.class).findFirst().orElse(null));
    }
    public BannerImage getBannerSignupImages() {
        String slide = "%banner%signup%";
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                        .mapToBean(BannerImage.class).findFirst().orElse(null));
    }
    public BannerImage getBannerPRImages() {
        String slide = "%banner%pr%";
        // lay data cot id va comment cua table Review
        return  connector.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage, bi.id FROM banner_images bi WHERE bi.description LIKE ?")
                        .bind(0,slide)
                        .mapToBean(BannerImage.class).findFirst().orElse(null));
    }

    /**
     * update image banner
     */
    public int updateBannerImage(BannerImage banner) {
      return  connector.withHandle(handle ->
                handle.createUpdate("update banner_images set urlImage = ? where description LIKE ?")
                        .bind(0,banner.getUrlImage())
                        .bind(1, banner.getDescription())
                        .execute()
      );
    }
    /**
     * insert image slide
     */
    public int insertSlideImage(BannerImage slide) {
        return  connector.withHandle(handle ->
                handle.createUpdate("insert into banner_images values (?, ?, ?)")
                        .bind(0,slide.getId())
                        .bind(1, slide.getUrlImage())
                        .bind(2, slide.getDescription())
                        .execute()
        );
    }

    public int nextId(){
        return  connector.withHandle(handle ->
                handle.createUpdate("SELECT MAX(id) FROM banner_images").execute());
    }
}
