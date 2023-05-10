package com.app.jobspot.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
@EntityListeners(AuditingEntityListener.class)
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    /**
     * Email is not set unique here because same email
     * can be used by a company also.
     */
    @Column(unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    private Boolean accountVerified = true;

    /**
     *  Companies can't post until they complete
     *  their profile.
     */
    private Boolean profileCompleted = false;

    /**
     *  This column stores the profile of Company role
     *  users. It's not applicable to other roles.
     */
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_profile_id")
    private  CompanyProfile companyProfile;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id", nullable = false)
    private Role role;

    @OneToMany(mappedBy = "candidate", fetch = FetchType.EAGER)
    private Set<JobApplication> applications = new HashSet<>();

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private LocalDateTime createdAt;

}
