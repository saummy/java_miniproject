package com.app.jobspot.repository;

import com.app.jobspot.entity.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JobApplicationRepository extends JpaRepository<JobApplication, Long> {

    List<JobApplication> findAll();
}
