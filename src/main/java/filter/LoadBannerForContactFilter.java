package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "LoadBannerForContactFilter", value = "/lien_he.jsp")
public class LoadBannerForContactFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        BannerImage contact = (BannerImage) request.getAttribute("contact");
        if (logo != null && contact != null) {
            chain.doFilter(request, response);
            return;
        }else{
            request.getRequestDispatcher("contact").forward(request, response);
        }
    }
}
