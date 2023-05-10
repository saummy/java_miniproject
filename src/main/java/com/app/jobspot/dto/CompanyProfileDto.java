package com.app.jobspot.dto;

import com.app.jobspot.annotations.IsEnum;
import com.app.jobspot.enums.CompanySizeEnum;
import com.app.jobspot.enums.JobCategoryEnum;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.URL;


@Data
public class CompanyProfileDto {

    private Long id;

    @NotEmpty(message = "Headline is required")
    @Length(min = 10, message = "Headline is too short, minimum 10 characters")
    @Length(max = 150, message = "Headline must be no more than 150 characters")
    private String headline;

    @IsEnum(enumClass = JobCategoryEnum.class, message = "Invalid Category")
    private String category;

    @NotNull(message = "Founded In year is required")
    @Min(value = 1800, message = "Must be greater than 1800")
    @Max(value = 2023, message = "Must not be greater than 2023")
    private int founded;

    @NotEmpty(message = "Logo URL is required")
    @URL(message = "Not a valid URL")
    private String logo;

    @NotEmpty(message = "Website is required")
    @URL(message = "Not a valid URL")
    private String website;

    @NotEmpty(message = "Headquarters address is required")
    @Length(min = 10, message = "Minimum 10 characters required for address")
    @Length(max = 150, message = "Address should not exceed 150 characters")
    private String headquarters;

    @IsEnum(enumClass = CompanySizeEnum.class, message = "Invalid Size")
    private String companySize;

    @NotEmpty(message = "Overview is required")
    @Length(min = 50, message = "Overview is too short, minimum 50 characters")
    @Length(max = 3000, message = "Overview must be no more than 3000 characters")
    private String description;


}
