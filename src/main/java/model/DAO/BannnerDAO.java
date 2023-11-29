package model.DAO;

import db.JDBIConnector;
import model.bean.BannerImage;
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

    public List<BannerImage> getSlideShowImages() {
        conn = JDBIConnector.get();
        // lay data cot id va comment cua table Review
        return  conn.withHandle(handle ->
                handle.createQuery("SELECT bi.urlImage FROM banner_images bi WHERE r.description LIKE 'slideShow%'")
                .mapToBean(BannerImage.class).list());
    }
}
