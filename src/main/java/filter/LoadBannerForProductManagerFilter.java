package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "LoadBannerForProductManagerFilter", value = "/admin_pages/quan_ly_san_pham.jsp")
public class LoadBannerForProductManagerFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        if (logo != null) {
            chain.doFilter(request, response);
            return;
        }else{
            request.getRequestDispatcher("product_manager").forward(request, response);
        }
    }
}
