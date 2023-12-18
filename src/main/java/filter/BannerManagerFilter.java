package filter;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.*;
import java.io.IOException;
import java.util.List;

public class BannerManagerFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        List<BannerImage> urlBannerImages = (List<BannerImage>) request.getAttribute("bannerImages"); // slide
        BannerImage urlBannerPRImages = (BannerImage) request.getAttribute("bannerPRImages"); // banner pr
        BannerImage urlBannerLoginImages = (BannerImage) request.getAttribute("bannerLoginImages"); // banner login
        BannerImage urlBannerSignupImages = (BannerImage) request.getAttribute("bannerSignupImages"); // banner Signup
        BannerImage urlBannerLogoImages = (BannerImage) request.getAttribute("bannerLogoImages"); // banner logo

        if (urlBannerImages != null
                && urlBannerPRImages != null
                && urlBannerLoginImages != null
                && urlBannerSignupImages != null
                && urlBannerLogoImages != null) {
            chain.doFilter(request, response);
        }else{
            request.getRequestDispatcher("banner_manager").forward(request, response);
        }
    }
}
