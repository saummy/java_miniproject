package com.app.jobspot.enums;

public enum JobCategoryEnum {
    SOFTWARE_AND_IT("Software And IT"),
    DESIGN("Design"),
    SALES_AND_MARKETING("Sales And Marketing"),
    FINANCE_AND_ACCOUNTING("Finance And Accounting"),
    LEGAL("Legal"),
    HR("Human Resource"),
    MANUFACTURING("Manufacturing"),
    AUTOMOTIVE("Automotive"),
    AVIATION("Aviation"),
    FASHION("Fashion"),
    BANKING("Banking"),
    LOGISTICS("Logistics"),
    EDUCATION("Education"),
    RESEARCH("Research"),
    SPORTS("Sports"),
    MANAGEMENT("Management");
    private final String displayValue;

    JobCategoryEnum(String displayValue) {
        this.displayValue = displayValue;
    }

    public String getDisplayValue() {
        return displayValue;
    }
}