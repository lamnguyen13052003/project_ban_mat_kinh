package filter;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "SignupFilter", value = "/dang_ky.jsp")
public class SignupFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("bannerLogoImages");
        BannerImage signupBanner = (BannerImage) request.getAttribute("bannerSignupImages");

        if(logo != null && signupBanner != null) {
            chain.doFilter(request, response);
        }
        logo = logo == null? BannerService.getInstance().getBannerByDescription("%banner%logo%") : logo;
        signupBanner = signupBanner == null? BannerService.getInstance().getBannerByDescription("%banner%signup%") : signupBanner;
        request.setAttribute("logo", logo);
        request.setAttribute("signupBanner", signupBanner);

        request.getRequestDispatcher("dang_ky.jsp").forward(request, response);
    }
}
