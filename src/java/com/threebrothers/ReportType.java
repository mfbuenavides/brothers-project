package com.threebrothers;

public enum ReportType {

	SALES("Sales Report"),
	MORTALITY("Mortality Report"),
	FEEDS("Feeds Distribution Report"),
	MEDICINE("Medicine Report"),
	INDIVIDUAL_COST("Individual Cost Report"),
	POPULATION("Population Report"),
	CASH_FLOW("Cash Flow Report"),
	CHECK_END("Check End Report"),
	PETTY_CASH("Petty Cash Report"),
	BANKING("Banking Report"),
	PIGLET_COST("Piglet Cost Report"),
	FINANCIAL_STATEMENT("Monthly Financial Report"),
	WEIGHING_SCALE("Weighing Scale Report");

    String name;

    ReportType(String name) {
        this.name = name;
    }
}

