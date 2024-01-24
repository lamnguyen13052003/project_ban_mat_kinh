package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter(filterName = "LoadBannerForProfileFilter", value = "/tai_khoan.jsp")
public class LoadBannerForProfileFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        if(logo != null) {
            chain.doFilter(request, response);
            return;
        }
        request.getRequestDispatcher("load-banner-for-profile-controller").forward(request, response);
    }
}
