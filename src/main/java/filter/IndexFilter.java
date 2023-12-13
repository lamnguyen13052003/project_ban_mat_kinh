package filter;

import model.bean.BannerImage;
import model.bean.Product;
import model.service.BannerService;
import model.service.ProductService;

import javax.servlet.*;
import java.io.IOException;
import java.util.List;

public class IndexFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        List<BannerImage> urlBannerImages = (List<BannerImage>) request.getAttribute("bannerImages");
        BannerImage urlBannerPRImages = (BannerImage) request.getAttribute("bannerPRImages");
        List<Product> productDiscount = (List<Product>) request.getAttribute("list-product-discount"),
                productProminent = (List<Product>) request.getAttribute("list-product-prominent");
        if (urlBannerPRImages != null && urlBannerPRImages != null &&
                productDiscount != null && productProminent != null) {
            chain.doFilter(request, response);
            return;
        }

        urlBannerImages = urlBannerPRImages == null ? BannerService.getInstance().getSlideShowImages() : urlBannerImages; // slide
        urlBannerPRImages = urlBannerPRImages == null ? BannerService.getInstance().getBannerPRImages() : urlBannerPRImages; // banner pr
        productDiscount = productDiscount == null ? ProductService.getInstance().getProductDiscount() : productDiscount;
        productProminent = productProminent == null ? ProductService.getInstance().getInfoProminentProductByStart() : productProminent;

        request.setAttribute("bannerImages", urlBannerImages); // slide
        request.setAttribute("bannerPRImages", urlBannerPRImages); // banner pr
        request.setAttribute("list-product-discount", productDiscount);
        request.setAttribute("list-product-prominent", productProminent);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
