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
@RequestMapping("/candidate")
public class CandidateController {

    private UserService userService;

    private Logger logger = LoggerFactory.getLogger(CandidateController.class);


    public CandidateController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        return "candidate-dashboard";
    }

}
