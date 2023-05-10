package com.app.jobspot.service;

import com.app.jobspot.dto.CompanyProfileDto;
import com.app.jobspot.dto.JobPostingDto;
import com.app.jobspot.entity.CompanyProfile;
import com.app.jobspot.entity.JobPosting;
import com.app.jobspot.repository.CompanyProfileRepository;
import com.app.jobspot.entity.User;
import com.app.jobspot.repository.JobPostingRepository;
import com.app.jobspot.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class CompanyService {

    private final UserRepository userRepository;
    private final CompanyProfileRepository companyProfileRepository;
    private final JobPostingRepository jobPostingRepository;

    private Logger logger = LoggerFactory.getLogger(CompanyService.class);

    public CompanyService(UserRepository userRepository,
                          CompanyProfileRepository companyProfileRepository,
                          JobPostingRepository jobPostingRepository) {
        this.userRepository = userRepository;
        this.companyProfileRepository = companyProfileRepository;
        this.jobPostingRepository = jobPostingRepository;
    }

    public void updateCompanyProfile(User company, CompanyProfileDto companyProfileDto) {
       CompanyProfile profile = company.getCompanyProfile();
       profile.update(companyProfileDto);
       companyProfileRepository.save(profile);
    }

    public String createJob(User company, JobPostingDto jobPostingDto) {
        JobPosting jobPosting = new JobPosting(jobPostingDto);
        jobPosting.setCompany(company);
        jobPostingRepository.save(jobPosting);
        return jobPosting.getReferenceId();
    }

    public List<JobPostingRepository.JobPostingProjection> fetchCompanyJobApplication(User company) {
        return jobPostingRepository.findJobPostingByCompany(company);
    }

    public JobPosting getJob(String jobId) {
        return jobPostingRepository.findJobPostingByReferenceId(jobId);
    }

    public List<JobPostingRepository.JobPostingSearchProjection> getJobsMatchingQuery(String query) {
        return jobPostingRepository.findJobsByQuery();
    }

    public void addJobApplicant(String jobId, User candidate) {
        JobPosting job = jobPostingRepository.findJobPostingByReferenceId(jobId);
//       candidate.getApplications().add(job);
        userRepository.save(candidate);
    }

    public boolean checkIfCandidateHasApplied(String jobId, User candidate) {
//        JobPosting jobApp = jobPostingRepository.findJobPostingByReferenceId(jobId);
//        logger.info("Job is {}", jobApp);
//        logger.info("User is {}", candidate);
//
//        Set<JobPosting> applications = candidate.getApplications();
//        logger.info("Apps are {}", applications);
//        boolean hasApplied = applications.stream().anyMatch(job -> job.getId().equals(jobApp.getId()));
//        logger.info("Has Applied {} ", hasApplied);
        return false;
    }
}
