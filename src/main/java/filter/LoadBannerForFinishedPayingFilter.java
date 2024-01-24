package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
@WebFilter(filterName = "LoadBannerForFinishedPayingFilter", value = "/thanh_toan_thanh_cong.jsp")
public class LoadBannerForFinishedPayingFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        if (logo != null) {
            chain.doFilter(request, response);
            return;
        }else{
            request.getRequestDispatcher("load-banner-for-finished-paying-controller").forward(request, response);
        }
    }
}
