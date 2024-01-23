package filter;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter", value = "/dang_nhap.jsp")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("bannerLogoImages");
        BannerImage loginBanner = (BannerImage) request.getAttribute("bannerLoginImages");

        if(logo != null && loginBanner != null) {
            chain.doFilter(request, response);
        }
        logo = logo == null? BannerService.getInstance().getBannerByDescription("%banner%logo%") : logo;
        loginBanner = loginBanner == null? BannerService.getInstance().getBannerByDescription("%banner%login%") : loginBanner;
        request.setAttribute("logo", logo); // banner logo
        request.setAttribute("loginBanner", loginBanner); // banner logo

        request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
