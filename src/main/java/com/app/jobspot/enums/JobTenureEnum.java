package com.app.jobspot.enums;

public enum JobTenureEnum {
    FULL_TIME("Full Time"),
    PART_TIME("Part Time"),
    INTERNSHIP("Internship"),
    CONTRACT("Contract");

    private final String displayValue;

    JobTenureEnum(String tenure) {
        this.displayValue = tenure;
    }

    public String getDisplayValue() {
        return displayValue;
    }
}