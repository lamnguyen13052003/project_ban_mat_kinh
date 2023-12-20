package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "VerifyFilter", value = "/xac_thuc.jsp")
public class VerifyFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) request).getSession();
        String email = (String) session.getAttribute("email");
        if (email != null) chain.doFilter(request, response);
        else ((HttpServletResponse) response).sendRedirect("index.jsp");

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
