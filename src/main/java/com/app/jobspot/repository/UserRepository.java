package com.app.jobspot.repository;

import com.app.jobspot.entity.CompanyProfile;
import com.app.jobspot.entity.Role;
import com.app.jobspot.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    interface UserProjection {
        Long getId();
        String getName();
        String getEmail();
        CompanyProfile getCompanyProfile();
        Boolean getAccountVerified();
        Boolean getProfileCompleted();
        LocalDateTime getCreatedAt();
    }

    User findByEmail(String email);

    List<UserProjection> findByRole(Role role);

    List<UserProjection> findByRoleAndProfileCompleted(Role role, boolean profileCompleted);

    List<UserProjection> findByRoleAndProfileCompletedOrderByCreatedAtDesc(Role role, boolean profileCompleted);

    Long countByRoleIdAndProfileCompleted(Long roleId, boolean profileCompleted);
}
