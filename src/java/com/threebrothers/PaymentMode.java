package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum PaymentMode implements org.springframework.context.MessageSourceResolvable {

    CASH("Cash"),
    CHECK("Check");

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

