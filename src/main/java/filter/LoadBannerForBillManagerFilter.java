package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "LoadBannerForBillManagerFilter", value = "/admin_pages/quan_ly_hoa_don.jsp")
public class LoadBannerForBillManagerFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        if (logo != null) {
            chain.doFilter(request, response);
            return;
        }else{
            request.getRequestDispatcher("load-banner-for-bill-manager-controller").forward(request, response);
        }
    }
}
