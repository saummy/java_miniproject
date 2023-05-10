package com.app.jobspot.service;

import com.app.jobspot.enums.RoleEnum;
import com.app.jobspot.repository.RoleRepository;
import com.app.jobspot.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminService {

    private UserRepository userRepository;

    private RoleRepository roleRepository;

    private Logger log = LoggerFactory.getLogger(UserService.class);


    public AdminService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public Map<String, Object> getCompaniesPageData() {
        List<UserRepository.UserProjection> companies = userRepository.findByRoleAndProfileCompleted(
            roleRepository.findByName(RoleEnum.COMPANY.name()), true
        );

        List<UserRepository.UserProjection> unListedCompanies =
            userRepository.findByRoleAndProfileCompletedOrderByCreatedAtDesc(
                roleRepository.findByName(RoleEnum.COMPANY.name()), false
            );

        Map<String, Object> response = new HashMap();
        response.put("PROFILE_COMPLETED_COMPANIES", companies);
        response.put("PROFILE_COMPLETED_COUNT", companies.size());
        response.put("UNLISTED_COMPANIES", unListedCompanies);

        return response;
    }

    /**
     * Returns all the data for /admin/dashboard/candidates
     */
    public Map<String, Object> getCandidatesPageData() {
        List<UserRepository.UserProjection> candidates = userRepository.findByRole(
            roleRepository.findByName(RoleEnum.CANDIDATE.name())
        );

        Map<String, Object> response = new HashMap();
        response.put("candidates", candidates);
        response.put("count", candidates.size());

        return response;
    }
}
