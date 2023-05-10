package com.app.jobspot.controller;

import com.app.jobspot.dto.UserDto;
import com.app.jobspot.entity.User;
import com.app.jobspot.enums.RoleEnum;
import com.app.jobspot.service.UserService;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping("/auth")
public class AuthController {

    private UserService userService;

    private Logger logger = LoggerFactory.getLogger(AuthController.class);

    Set<String> personas = new HashSet<>(Arrays.asList("candidate", "company"));

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String login(Model model) {
        return "login";
    }

    @GetMapping("/signup/{persona}")
    public String signup(Model model, @PathVariable String persona) {
        if (!this.personas.contains(persona)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }

        UserDto user = new UserDto();
        model.addAttribute("js_persona", persona);
        model.addAttribute("user", user);
        return "signup";
    }

    @PostMapping("/signup/{persona}")
    public String _signup(
        @Valid @ModelAttribute("user") UserDto userDto,
        BindingResult result,
        Model model,
        RedirectAttributes redirectAttributes,
        @PathVariable String persona)
    {
        User user = userService.findByEmail(userDto.getEmail());

        if (user != null && user.getAccountVerified()) {
            result.rejectValue("email", null, "Email already registered");
        }

        if (result.hasErrors()) {
            model.addAttribute("js_persona", persona);
            model.addAttribute("js_user", userDto);
            return "signup";
        }

        userService.saveUser(userDto, RoleEnum.valueOf(persona.toUpperCase()));
        redirectAttributes.addFlashAttribute("m_hasAlertSuccess", true);
        redirectAttributes.addFlashAttribute("m_alertValue", "Registration Complete. Proceed to login");
        return "redirect:/auth/login";
    }

}
