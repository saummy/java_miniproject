package com.app.jobspot.entity.keys;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

import java.io.Serializable;

@Embeddable
@Data
public class JobApplicationKey implements Serializable {

    @Column(name = "candidate_id")
    Long candidateId;

    @Column(name = "job_id")
    Long jobId;
}
