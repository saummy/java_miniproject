package com.app.jobspot.dto;

import com.app.jobspot.annotations.IsEnum;
import com.app.jobspot.enums.JobCategoryEnum;
import com.app.jobspot.enums.JobExperienceLevelEnum;
import com.app.jobspot.enums.JobTenureEnum;
import com.app.jobspot.enums.JobTypeEnum;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class JobPostingDto {

    @NotEmpty(message = "Job title is required")
    @Length(min = 10, message = "Title is too short, minimum 10 characters")
    @Length(max = 150, message = "Title must be no more than 150 characters")
    private String title;

    @NotEmpty(message = "Job Description is required")
    @Length(min = 50, message = "Description is too short, minimum 50 characters")
    @Length(max = 7000, message = "Description must be no more than 7000 characters")
    private String description;

    @NotEmpty(message = "Job location is required")
    @Length(min = 5, message = "Minimum 5 characters required for address")
    @Length(max = 150, message = "Address should not exceed 150 characters")
    private String location;

    @IsEnum(enumClass = JobTypeEnum.class, message = "Invalid job type")
    private String type;

    @IsEnum(enumClass = JobCategoryEnum.class, message = "Invalid job category")
    private String category;

    @IsEnum(enumClass = JobExperienceLevelEnum.class, message = "Invalid job experience level")
    private String experienceLevel;

    @IsEnum(enumClass = JobTenureEnum.class, message = "Invalid job tenure")
    private String tenure;

    @NotNull(message = "Open till is required")
    @DateTimeFormat(pattern = "dd-mm-yyyy")
    private LocalDate openTill;
}
