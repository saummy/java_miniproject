package com.app.jobspot.controller;

import com.app.jobspot.entity.JobPosting;
import com.app.jobspot.entity.User;
import com.app.jobspot.enums.RoleEnum;
import com.app.jobspot.repository.JobApplicationRepository;
import com.app.jobspot.service.CompanyService;
import com.app.jobspot.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HomeController {

    private final UserService userService;
    private final CompanyService companyService;

    private Logger logger = LoggerFactory.getLogger(HomeController.class);
    private final JobApplicationRepository jobApplicationRepository;

    public HomeController(UserService userService, CompanyService companyService,
                          JobApplicationRepository jobApplicationRepository) {
        this.userService = userService;
        this.companyService = companyService;
        this.jobApplicationRepository = jobApplicationRepository;
    }

    @GetMapping("/")
    public String home(Model model) {
        return "home";
    }

    @GetMapping("/search")
    public String search(@RequestParam("q") String query, Model model) {
        model.addAttribute("Jobs", companyService.getJobsMatchingQuery(query));
        return "search";
    }

    @GetMapping("/job/{jobId}")
    public String job(@PathVariable("jobId") String jobId, Model model) {
        logger.info("Job is {}", companyService.getJob(jobId));

        logger.info("Job {}", jobApplicationRepository.findAll());

        model.addAttribute("Job", companyService.getJob(jobId));
        return "job";
    }

    @PostMapping("/job/{jobId}")
    public String _job(
        @ModelAttribute("User") User candidate,
        @PathVariable("jobId") String jobId,
        RedirectAttributes redirectAttributes,
        Model model
    )
    {

        JobPosting job = companyService.getJob(jobId);
        logger.info("Null check");

        if (candidate == null) {
            redirectAttributes.addFlashAttribute("HasAlertDanger", true);
            redirectAttributes.addFlashAttribute("AlertValue", "Please LogIn to apply for jobs");
            return "redirect:/job/" + jobId;
        }
        logger.info("Role check");

        if (!candidate.getRole().getName().equalsIgnoreCase(RoleEnum.CANDIDATE.name())) {
            redirectAttributes.addFlashAttribute("HasAlertDanger", true);
            redirectAttributes.addFlashAttribute("AlertValue", "Only candidate can apply for jobs");
            return "redirect:/job/" + jobId;
        }

        logger.info("Apply check");

        if (companyService.checkIfCandidateHasApplied(jobId, candidate)) {
            redirectAttributes.addFlashAttribute("HasAlertDanger", true);
            redirectAttributes.addFlashAttribute("AlertValue", "You have already applied for the job");
            return "redirect:/job/" + jobId;
        }

        logger.info("Applying for job");
        companyService.addJobApplicant(jobId, candidate);

        return "redirect:/job/" + jobId;
    }

}

