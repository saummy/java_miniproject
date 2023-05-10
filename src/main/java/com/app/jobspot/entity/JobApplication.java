package com.app.jobspot.entity;

import com.app.jobspot.entity.keys.JobApplicationKey;
import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Entity
@Table(name = "job_applications")
@EntityListeners(AuditingEntityListener.class)
@Data
public class JobApplication {

    @EmbeddedId
    JobApplicationKey id;

    @ManyToOne
    @MapsId("candidateId")
    @JoinColumn(name = "candidate_id")
    User candidate;

    @ManyToOne
    @MapsId("jobId")
    @JoinColumn(name = "job_id")
    JobPosting job;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private LocalDateTime createdAt;

}
