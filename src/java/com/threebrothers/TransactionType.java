package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum TransactionType implements org.springframework.context.MessageSourceResolvable {

    DEPOSIT("Deposit"),
    WITHDRAWAL("Withdrawal");

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

