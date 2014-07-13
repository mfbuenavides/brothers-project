package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum Bank {

    BDO("Banco de Oro"),
    AUB("Asia United Bank");

    String name;

    Bank(String name) {
        this.name = name;
    }
}

