package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "LoadBannerForForgetPasswordFilter", value = "/quen_mat_khau.jsp")
public class LoadBannerForForgetPasswordFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        if(logo != null) {
            chain.doFilter(request, response);
            return;
        }
        request.getRequestDispatcher("load-banner-for-forget-password-controller").forward(request, response);
    }
}
