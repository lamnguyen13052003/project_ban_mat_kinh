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
        BannerImage urlBannerPRImages = (BannerImage) request.getAttribute("bannerPRImages"),
                urlBannerLogoImages = (BannerImage) request.getAttribute("bannerLogoImages");
        List<Product> productDiscount = (List<Product>) request.getAttribute("list-product-discount"),
                productProminent = (List<Product>) request.getAttribute("list-product-prominent");
        if (urlBannerImages != null && urlBannerPRImages != null && urlBannerLogoImages != null &&
                productDiscount != null && productProminent != null) {
            chain.doFilter(request, response);
            return;
        }

        urlBannerImages = urlBannerPRImages == null ? BannerService.getInstance().getSlideShowImages() : urlBannerImages; // slide
        urlBannerPRImages = urlBannerPRImages == null ? BannerService.getInstance().getBannerByDescription("%banner%pr%") : urlBannerPRImages;
        urlBannerLogoImages = urlBannerLogoImages == null ? BannerService.getInstance().getBannerByDescription("%banner%logo%") : urlBannerLogoImages;
        productDiscount = productDiscount == null ? ProductService.getInstance().getProductDiscount(12) : productDiscount;
        productProminent = productProminent == null ? ProductService.getInstance().getInfoProminentProductByStart(12) : productProminent;

        request.setAttribute("bannerImages", urlBannerImages); // slide
        request.setAttribute("bannerPRImages", urlBannerPRImages); // banner pr
        request.setAttribute("bannerLogoImages", urlBannerLogoImages);
        request.setAttribute("list-product-prominent", productProminent);
        request.setAttribute("list-product-discount", productDiscount);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
