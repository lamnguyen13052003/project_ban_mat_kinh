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
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        BannerImage loginBanner = (BannerImage) request.getAttribute("loginBanner");

        if(logo != null && loginBanner != null) {
            chain.doFilter(request, response);
        }

        request.getRequestDispatcher("login").forward(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
