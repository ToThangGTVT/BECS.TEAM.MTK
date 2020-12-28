package fa.tranning.becs.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CharacterEncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        request.setCharacterEncoding("UTF8");
        response.setCharacterEncoding("UTF8");

        chain.doFilter(request, response);

        request.setCharacterEncoding("UTF8");
        response.setCharacterEncoding("UTF8");
    }

    @Override
    public void destroy() {

    }
}
