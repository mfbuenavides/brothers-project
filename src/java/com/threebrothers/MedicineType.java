package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum MedicineType implements org.springframework.context.MessageSourceResolvable {

    BIOLOGICAL_VACCINE,
    WATER_MEDICATION,
    FEED_MEDICATION,
    INJECTABLE,
    MISCELLANEOUS;

    public Object[] getArguments() {
        return new Object[]{};
    }

    public String[] getCodes() {
        return new String[]{ getClass().getName()+"."+name() };
    }

    public String getDefaultMessage() {
        return name();
    }
}

