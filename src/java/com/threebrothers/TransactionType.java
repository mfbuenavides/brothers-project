package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum TransactionType {

    DEPOSIT("Deposit"),
    WITHDRAWAL("Withdrawal");

    String name;

    TransactionType(String name) {
        this.name = name;
    }
}

