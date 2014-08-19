package com.threebrothers;

public enum FeedsType {
	GROWER("Hog Grower"),
	STARTER("Hog Starter");

	String name;

    FeedsType(String name) {
        this.name = name;
    }
}