package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "LoadBannerForBillDetailFilter", value = "/admin_pages/chi_tiet_hoa_don.jsp")
public class LoadBannerForBillDetailFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        if (logo != null) {
            chain.doFilter(request, response);
            return;
        }else{
            request.getRequestDispatcher("bill_detail").forward(request, response);
        }
    }
}
