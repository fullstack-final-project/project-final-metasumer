package com.spring_boot_final.metasumer;

import org.springframework.web.filter.OncePerRequestFilter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class CustomAccessFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        
        String memType = (String) request.getSession().getAttribute("memType");

        if (request.getRequestURI().startsWith("/admin") && !"admin".equals(memType)) {
            response.sendRedirect("/");
            return;
        }

        chain.doFilter(request, response);
    }
}
