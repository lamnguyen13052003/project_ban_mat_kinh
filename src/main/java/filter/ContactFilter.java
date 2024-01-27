package filter;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "ContactFilter", value = "/lien_he.jsp")
public class ContactFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        BannerImage contact = (BannerImage) ((HttpServletRequest) request).getSession().getAttribute("contact");

        if (contact == null) {
            contact = BannerService.getInstance().getBannerByDescription("%banner%contact%");
            ((HttpServletRequest) request).getSession().setAttribute("contact", contact);
        }


        chain.doFilter(request, response);
    }
}
