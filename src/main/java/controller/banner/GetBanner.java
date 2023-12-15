package controller.banner;

import controller.Action;
import model.bean.BannerImage;
import model.service.BannerService;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetBanner implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BannerImage> banners = (List<BannerImage>) request.getSession().getAttribute("banners");
        if(banners == null){
            banners = BannerService.getInstance().getSlideShowImages(); // slide
            request.getSession().setAttribute("banners", banners);
        }

        JSONObject json = new JSONObject();
        json.put("banners", banners);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json.toString());
    }
}
