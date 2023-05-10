package com.app.jobspot.enums;

public enum JobTypeEnum {
    ONSITE("On Site"),
    HYBRID("Hybrid"),
    REMOTE("Remote");

    private final String displayValue;

    JobTypeEnum(String type) {
        this.displayValue = type;
    }

    public String getDisplayValue() {
        return displayValue;
    }

}