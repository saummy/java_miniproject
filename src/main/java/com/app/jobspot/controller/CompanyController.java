package com.app.jobspot.controller;

import com.app.jobspot.dto.CompanyProfileDto;
import com.app.jobspot.dto.JobPostingDto;
import com.app.jobspot.dto.UserDto;
import com.app.jobspot.entity.JobPosting;
import com.app.jobspot.entity.User;
import com.app.jobspot.enums.JobCategoryEnum;
import com.app.jobspot.repository.JobPostingRepository;
import com.app.jobspot.repository.UserRepository;
import com.app.jobspot.service.CompanyService;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/company")
public class CompanyController {

    private CompanyService companyService;

    private final UserRepository userRepository;

    private Logger logger = LoggerFactory.getLogger(CompanyController.class);

    public CompanyController(CompanyService companyService, UserRepository userRepository) {
        this.companyService = companyService;
        this.userRepository = userRepository;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("ActivePage", "HOME");
        return "company-dashboard";
    }

    @GetMapping("/dashboard/profile")
    public String profile(Model model, @ModelAttribute("User") User company) {

        CompanyProfileDto companyProfile;

        if (company.getProfileCompleted()) {
            companyProfile = company.getCompanyProfile().asDto();
        }
        else {
            companyProfile = new CompanyProfileDto();
        }

        model.addAttribute("ActivePage", "PROFILE");
        model.addAttribute("CompanyProfile", companyProfile);
        return "company-dashboard";
    }

    @PostMapping("/dashboard/profile")
    public String _profile(
        @Valid @ModelAttribute("CompanyProfile") CompanyProfileDto companyProfile,
        @ModelAttribute("User") User company,
        BindingResult result,
        RedirectAttributes redirectAttributes,
        Model model)
    {
        model.addAttribute("ActivePage", "PROFILE");

        if (result.hasErrors()) {
            model.addAttribute("CompanyProfile", companyProfile);
            return "company-dashboard";
        }

        companyService.updateCompanyProfile(company, companyProfile);

        redirectAttributes.addFlashAttribute("HasAlertSuccess", true);
        redirectAttributes.addFlashAttribute("AlertValue", "Profile updated successfully");
        return "redirect:/company/dashboard/profile";
    }

    @GetMapping("/dashboard/jobs")
    public String jobs(Model model) {
        JobPostingDto jobPostingDto = new JobPostingDto();

        model.addAttribute("ActivePage", "JOBS");
        model.addAttribute("JobPosting", jobPostingDto);

        return "company-dashboard";
    }

    @PostMapping("/dashboard/jobs")
    public String _jobs(
        @Valid @ModelAttribute("JobPosting") JobPostingDto jobPostingDto,
        @ModelAttribute("User") User company,
        BindingResult result,
        RedirectAttributes redirectAttributes,
        Model model
    ) {
        model.addAttribute("ActivePage", "JOBS");

        if (result.hasErrors()) {
            model.addAttribute("JobPosting", jobPostingDto);
            return "company-dashboard";
        }

        String jobId = companyService.createJob(company, jobPostingDto);
        redirectAttributes.addFlashAttribute("HasAlertSuccess", true);
        redirectAttributes.addFlashAttribute("AlertValue", jobId);
        return "redirect:/company/dashboard/jobs";
    }

    @GetMapping("/dashboard/applications")
    public String applications(@ModelAttribute("User") User company, Model model) {

       List<JobPostingRepository.JobPostingProjection> jobs =
           companyService.fetchCompanyJobApplication(company);

       model.addAttribute("ActivePage", "APPLICATIONS");
       model.addAttribute("ActivePageLevel1", "APPLICATIONS_ALL");
       model.addAttribute("Jobs", jobs);
       return "company-dashboard";
    }

    @GetMapping("/dashboard/applications/{jobId}")
    public String applications(@ModelAttribute("User") User company, Model model, @PathVariable String jobId) {
        model.addAttribute("ActivePage", "APPLICATIONS");
        model.addAttribute("ActivePageLevel1", "APPLICATIONS_SINGLE");

        JobPosting job = companyService.getJob(jobId);

        if (job == null || !job.getCompany().getId().equals(company.getId())) {
            model.addAttribute("HasAlertDanger", true);
            model.addAttribute("AlertValue", "Job Id is either invalid or not associated with your company");
            return "company-dashboard";
        }

        model.addAttribute("Job", job);
        return "company-dashboard";
    }

}
