package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum PaymentSource {

    BDO("Banco De Oro"),
    AUB("Asia United Bank"),
    VAULT("Vault");

    String name;

    PaymentSource(String name) {
        this.name = name;
    }
}

