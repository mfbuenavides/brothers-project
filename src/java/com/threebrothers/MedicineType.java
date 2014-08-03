package com.threebrothers;

/** Enum to represent the fingers used during data capturing and examinee authentication. */
public enum MedicineType {

    BIOLOGICAL_VACCINE("Biological Vaccine"),
    WATER_MEDICATION("Water Medication"),
    FEED_MEDICATION("Feed Medication"),
    INJECTABLE("Injectable"),
    MISCELLANEOUS("Miscellaneous");

    String name;

    MedicineType(String name) {
        this.name = name;
    }
}

