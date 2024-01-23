package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter", value = "login_filter")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        BannerImage logo = (BannerImage) request.getAttribute("bannerLogoImages");
//
//        if(logo != null) {
//            chain.doFilter(request, response);
//        }
//        logo = logo == null? new BannerImage() : logo;
//        request.setAttribute("logo", logo); // banner logo
//
//        request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
