package com.app.jobspot.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
public class UserDto {

    private Long id;

    @NotEmpty(message = "Name is required")
    @Length(min = 3, message = "Name is too short")
    @Length(max = 64, message = "Name must be no more than 64 characters")
    private String name;

    @NotEmpty(message = "Email is required")
    @Email(message = "Provide a valid email")
    private String email;

    @NotEmpty(message = "Password is required")
    @Length(min = 6, message = "Password must be at least 6 characters")
    @Length(max = 64, message = "Password must be no more than 64 characters")
    private String password;

}
