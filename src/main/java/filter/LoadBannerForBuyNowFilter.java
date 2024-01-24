package filter;

import model.bean.BannerImage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
@WebFilter(filterName = "LoadBannerForBuyNowFilter", value = "/mua_ngay.jsp")
public class LoadBannerForBuyNowFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("filter buy now");
        BannerImage logo = (BannerImage) request.getAttribute("logo");
        if (logo != null) {
            chain.doFilter(request, response);
            return;
        }else{
            request.getRequestDispatcher("buy_now").forward(request, response);
        }
    }
}
