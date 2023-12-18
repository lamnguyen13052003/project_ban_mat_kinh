package filter;


import model.bean.Bill;
import model.service.BillService;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FinishedPayingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        Bill bill = (Bill) ((HttpServletRequest)request).getSession().getAttribute("billPayed");
        if (bill != null) {
            chain.doFilter(request, response);
        }else{
            ((HttpServletResponse) response).sendRedirect("gio_hang.jsp");
        }
    }

    @Override
    public void destroy() {
    }
}