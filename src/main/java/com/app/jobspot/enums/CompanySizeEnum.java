package com.app.jobspot.enums;

public enum CompanySizeEnum {
    ONE_TO_TEN("1 -10"),
    TEN_TO_FIFTY("10 - 100"),
    HUNDRED_TO_FIVE_HUNDRED("100 - 500"),
    FIVE_HUNDRED_TO_THOUSAND("500 - 1000"),
    THOUSAND_TO_TEN_THOUSAND("1000 - 10000"),
    GREATER_THAN_TEN_THOUSAND("10001+");
    private final String displayValue;

    CompanySizeEnum(String displayValue) {
        this.displayValue = displayValue;
    }

    public String getDisplayValue() {
        return displayValue;
    }
}