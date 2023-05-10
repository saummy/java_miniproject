package com.app.jobspot.entity;

import com.app.jobspot.dto.JobPostingDto;
import com.app.jobspot.enums.JobCategoryEnum;
import com.app.jobspot.enums.JobExperienceLevelEnum;
import com.app.jobspot.enums.JobTenureEnum;
import com.app.jobspot.enums.JobTypeEnum;
import com.app.jobspot.util.IdGenerator;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "job_postings")
@EntityListeners(AuditingEntityListener.class)
@Data
public class JobPosting {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String referenceId;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false, length = 7000)
    private String description;

    @Column(nullable = false)
    private String location;

    @Column(nullable = false)
    private JobTypeEnum type;

    @Column(nullable = false)
    private JobCategoryEnum category;

    @Column(nullable = false)
    private JobExperienceLevelEnum experienceLevel;

    @Column(nullable = false)
    private JobTenureEnum tenure;

    @Column(nullable = false)
    private LocalDate openTill;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id", nullable = false)
    private User company;

    @OneToMany(mappedBy = "job", fetch = FetchType.EAGER)
    private Set<JobApplication> applications = new HashSet<>();

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private LocalDateTime createdAt;

    public JobPosting() {

    }

    public JobPosting(JobPostingDto jobPostingDto) {
        this.title = jobPostingDto.getTitle();
        this.description = jobPostingDto.getDescription();
        this.location = jobPostingDto.getLocation();
        this.type = JobTypeEnum.valueOf(jobPostingDto.getType());
        this.category = JobCategoryEnum.valueOf(jobPostingDto.getCategory());
        this.experienceLevel = JobExperienceLevelEnum.valueOf(jobPostingDto.getExperienceLevel());
        this.tenure = JobTenureEnum.valueOf(jobPostingDto.getTenure());
        this.referenceId = IdGenerator.generateJobId();
        this.openTill = jobPostingDto.getOpenTill();
    }

}
