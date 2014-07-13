package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum PaymentMode {

    CASH("Cash"),
    CHECK("Check");

    String name;

    PaymentMode(String name) {
        this.name = name;
    }
}

