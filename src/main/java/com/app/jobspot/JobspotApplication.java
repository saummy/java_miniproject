package com.app.jobspot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class JobspotApplication {

    public static void main(String[] args) {
        SpringApplication.run(JobspotApplication.class, args);
    }

}
