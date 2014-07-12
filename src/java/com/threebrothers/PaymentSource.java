package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum PaymentSource implements org.springframework.context.MessageSourceResolvable {

    BDO("Banco De Oro"),
    AUB("Asia United Bank"),
    VAULT("Vault");

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

