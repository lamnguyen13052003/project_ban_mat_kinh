package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "LoadBannerForVerifyFileFilter", value = "/xac_thuc.jsp")
public class LoadBannerForVerifyFileFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        BannerImage auth = (BannerImage) request.getAttribute("authBanner");
        if (logo != null && auth != null) {
            chain.doFilter(request, response);
            return;
        }else{
            request.getRequestDispatcher("load-banner-for-verify-file-controller").forward(request, response);
        }
    }
}
