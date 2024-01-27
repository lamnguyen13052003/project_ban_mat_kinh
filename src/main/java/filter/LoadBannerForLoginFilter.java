package filter;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "LoadBannerForLoginFilter", value = "/dang_nhap.jsp")
public class LoadBannerForLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage)  ((HttpServletRequest) request).getSession().getAttribute("logo");
        BannerImage loginBanner = (BannerImage)  ((HttpServletRequest) request).getSession().getAttribute("loginBanner");
        if (logo == null) {
            logo = BannerService.getInstance().getBannerByDescription("%banner%logo%");
            ((HttpServletRequest) request).getSession().setAttribute("logo", logo);
        }

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
