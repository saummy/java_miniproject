package com.app.jobspot.entity;

import com.app.jobspot.dto.CompanyProfileDto;
import com.app.jobspot.enums.CompanySizeEnum;
import com.app.jobspot.enums.JobCategoryEnum;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Entity
@Table(name = "company_profiles")
@EntityListeners(AuditingEntityListener.class)
@Data
public class CompanyProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String headLine;

    @Column(nullable = false)
    private String headquarters;

    @Column(nullable = false, columnDefinition = "TEXT", length = 3000)
//   @Lob
    private String description;

    @Column(nullable = false)
    private String website;

    @Column(nullable = false)
    private int founded;

    @Column(nullable = false)
    private String logo;

    @Column(nullable = false)
    private CompanySizeEnum companySize;

    @Column(nullable = false)
    private JobCategoryEnum category;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private LocalDateTime createdAt;

    @LastModifiedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private LocalDateTime updatedAt;

    public CompanyProfile() {
    }

    public CompanyProfile(CompanyProfileDto companyProfileDto) {
        this.update(companyProfileDto);
    }

    public void update(CompanyProfileDto companyProfileDto) {
        this.headLine = companyProfileDto.getHeadline();
        this.headquarters = companyProfileDto.getHeadquarters();
        this.description = companyProfileDto.getDescription();
        this.website = companyProfileDto.getWebsite();
        this.founded = companyProfileDto.getFounded();
        this.logo = companyProfileDto.getLogo();
        this.companySize = CompanySizeEnum.valueOf(companyProfileDto.getCompanySize());
        this.category = JobCategoryEnum.valueOf(companyProfileDto.getCategory());
    }

    public CompanyProfileDto asDto() {
        CompanyProfileDto dto = new CompanyProfileDto();
        dto.setHeadline(this.headLine);
        dto.setCategory(this.category.name());
        dto.setFounded(this.founded);
        dto.setLogo(this.logo);
        dto.setWebsite(this.website);
        dto.setHeadquarters(this.headquarters);
        dto.setCompanySize(this.companySize.name());
        dto.setDescription(this.description);
        return dto;
    }
}
