package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "LoadBannerForMoreInforProductFilter", value = "/thong_tin_san_pham.jsp")
public class LoadBannerForMoreInforProductFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        if(logo != null) {
            chain.doFilter(request, response);
            return;
        }
        request.getRequestDispatcher("more_info_product").forward(request, response);
    }
}
