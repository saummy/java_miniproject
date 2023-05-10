//package com.app.jobspot.components;
//
//import com.app.jobspot.controller.CandidateController;
//import com.app.jobspot.enums.RoleEnum;
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.http.HttpServletResponse;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.security.authentication.AnonymousAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.authority.AuthorityUtils;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Component;
//
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.Set;
//
//@Component
//public class AuthFilter implements Filter {
//
//    private final Logger logger = LoggerFactory.getLogger(AuthFilter.class);
//    Map<String, String> roleToUrl = new HashMap<>();
//
//    public AuthFilter() {
//        this.roleToUrl.put(RoleEnum.ADMIN.name(), "/admin/dashboard");
//        this.roleToUrl.put(RoleEnum.CANDIDATE.name(), "/candidate/dashboard");
//        this.roleToUrl.put(RoleEnum.COMPANY.name(), "/company/dashboard");
//    }
//
//    @Override
//    public void doFilter(
//        ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain
//    ) throws IOException, ServletException {
//
//        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//
//        if (
//            authentication != null &&
//            authentication.isAuthenticated() &&
//            !(authentication instanceof AnonymousAuthenticationToken)
//        ) {
//
//            Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
//            logger.info("Roles are {}", roles);
//            logger.info("Auth is {}", authentication.getName());
//
//            String url = roleToUrl.get(roles.stream().findFirst().get());
//            logger.info(url);
//            httpResponse.sendRedirect(url);
//        }
//        else {
//            filterChain.doFilter(servletRequest, servletResponse);
//        }
//    }
//}
