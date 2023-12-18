package filter;


import model.bean.Bill;

import javax.servlet.*;
import java.io.IOException;

public class FinishedPayingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        Bill bill = (Bill) request.getAttribute("bill");
        if (bill != null) {
            chain.doFilter(request, response);
            return;
        }else{
            request.getRequestDispatcher("bill").forward(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}
