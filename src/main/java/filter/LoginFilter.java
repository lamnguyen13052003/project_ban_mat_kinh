package filter;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter", value = "/dang_nhap.jsp")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage loginBanner = (BannerImage)  ((HttpServletRequest) request).getSession().getAttribute("loginBanner");
        if (loginBanner == null) {
            loginBanner = BannerService.getInstance().getBannerByDescription("%banner%login%");
            ((HttpServletRequest) request).getSession().setAttribute("loginBanner", loginBanner);
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
