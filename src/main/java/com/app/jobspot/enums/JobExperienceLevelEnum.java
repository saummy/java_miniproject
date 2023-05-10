package com.app.jobspot.enums;

public enum JobExperienceLevelEnum {
    INTERNSHIP("Internship"),
    ENTRY_LEVEL("Entry Level"),
    ASSOCIATE("Associate"),
    MID_SENIOR_LEVEL("Mid Senior Level"),
    DIRECTOR("Director"),
    EXECUTIVE("Executive");

    private final String displayValue;

    JobExperienceLevelEnum(String experience) {
        this.displayValue = experience;
    }

    public String getDisplayValue() {
        return displayValue;
    }

}