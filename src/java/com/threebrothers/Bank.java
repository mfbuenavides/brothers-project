package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum Bank implements org.springframework.context.MessageSourceResolvable {

    BDO("Banco de Oro"),
    AUB("Asia United Bank");

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

