package com.app.jobspot.enums;

public enum RoleEnum {
    ADMIN("ADMIN"),
    CANDIDATE("CANDIDATE"),
    COMPANY("COMPANY");


    private final String roleName;

    RoleEnum(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleName() {
        return roleName;
    }
}