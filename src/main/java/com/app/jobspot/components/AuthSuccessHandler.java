package com.app.jobspot.components;

import com.app.jobspot.enums.RoleEnum;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Component
public class AuthSuccessHandler implements AuthenticationSuccessHandler {

    Map<String, String> roleToUrl = new HashMap<>();

    public AuthSuccessHandler() {
        this.roleToUrl.put(RoleEnum.ADMIN.name(), "/admin/dashboard");
        this.roleToUrl.put(RoleEnum.CANDIDATE.name(), "/candidate/dashboard");
        this.roleToUrl.put(RoleEnum.COMPANY.name(), "/company/dashboard");
    }

    @Override
    public void onAuthenticationSuccess(
        HttpServletRequest request, HttpServletResponse response, Authentication authentication
    ) throws IOException {
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        String url = roles.stream()
                .map(role -> roleToUrl.getOrDefault(role, "/"))
                .findFirst()
                .orElse("/");
        response.sendRedirect(url);
    }
}
