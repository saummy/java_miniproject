package com.app.jobspot.controller;

import com.app.jobspot.entity.User;
import com.app.jobspot.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class UserAdvice {

    private final UserService userService;

    public UserAdvice(UserService userService) {
        this.userService = userService;
    }

    @ModelAttribute("User")
    public User getCurrentUser(Authentication authentication) {
        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                String username = ((UserDetails) principal).getUsername();
                User user = userService.findByEmail(username);
                return user;
            }
        }
        return null;
    }
}