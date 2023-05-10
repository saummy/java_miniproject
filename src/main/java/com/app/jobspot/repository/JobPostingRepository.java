package com.app.jobspot.repository;

import com.app.jobspot.entity.JobPosting;
import com.app.jobspot.entity.User;
import com.app.jobspot.enums.JobCategoryEnum;
import com.app.jobspot.enums.JobTenureEnum;
import com.app.jobspot.enums.JobTypeEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface JobPostingRepository extends JpaRepository<JobPosting, Long> {

    interface JobPostingProjection {
        String getReferenceId();
        String getTitle();
        JobCategoryEnum getCategory();
        JobTenureEnum getTenure();
        LocalDateTime getCreatedAt();
        int getApplicantsSize();
        boolean getExpired();
    }

    interface JobPostingSearchProjection {
        String getReferenceId();
        String getTitle();
        JobCategoryEnum getCategory();
        JobTenureEnum getTenure();
        LocalDateTime getCreatedAt();
        String getLocation();
        String getCompanyName();
        String getLogo();
        JobTypeEnum getType();
    }
    @Query(
        "SELECT jp.referenceId AS referenceId, jp.title AS title, jp.category AS category, jp.tenure AS tenure, " +
        "jp.createdAt AS createdAt, SIZE(jp.applications) AS applicantsSize, (jp.openTill <= CURRENT_DATE) AS expired " +
        "FROM JobPosting jp LEFT JOIN jp.applications a WHERE jp.company = :company ORDER BY jp.createdAt DESC"
    )
    List<JobPostingProjection> findJobPostingByCompany(@Param("company") User company);

    @Query(
        "SELECT jp.referenceId AS referenceId, jp.title AS title, jp.category AS category, jp.tenure AS tenure, " +
        "jp.createdAt AS createdAt, jp.location as location, jp.type as type, jp.company.name AS companyName,  jp.company.companyProfile.logo AS logo " +
        "FROM JobPosting jp JOIN jp.company c WHERE jp.openTill >= CURRENT_DATE ORDER BY RANDOM()"
    )
    List<JobPostingSearchProjection> findJobsByQuery();

    JobPosting findJobPostingByReferenceId(String referenceId);
}