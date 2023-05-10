package com.app.jobspot.controller;

import com.app.jobspot.service.AdminService;
import com.app.jobspot.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {


    private Logger logger = LoggerFactory.getLogger(AdminController.class);

    private AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("ActivePage", "HOME");
        return "admin-dashboard";
    }

    @GetMapping("/dashboard/companies")
    public String companies(Model model) {
        model.addAttribute("ActivePage", "COMPANIES");
        model.addAllAttributes(adminService.getCompaniesPageData());
        return "admin-dashboard";
    }

    @GetMapping("/dashboard/candidates")
    public String candidates(Model model) {
        model.addAttribute("ActivePage", "CANDIDATES");
        model.addAllAttributes(adminService.getCandidatesPageData());
        return "admin-dashboard";
    }

}
