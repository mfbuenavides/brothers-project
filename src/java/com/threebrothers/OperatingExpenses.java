package com.threebrothers;

public enum OperatingExpenses {

	BUSINESS_PERMIT("Business Permit"),
	SALARIES_AND_WAGES("Salaries and Wages"),
	SSS("Employee's SSS Contribution"),
	PHILHEALTH("Philhealth"),
	PROFESSIONAL_FEE("Professional Fee"),
	LIGHT_AND_POWER("Light and Power"),
	FUEL_OIL_LUBRICANT("Fuel, Oil and Lubricant"),
	MAHARLIKA_CABLE("Maharlika Cable"),
	TELEPHONE_EXPENSE("Telephone Expense"),
	OFFICE_EXPENSE("Office Expense"),
	TRUCK_EXPENSE("Trucking Expenses"),
	TRANSPORATION_EXPENSE("Transportaion Expenses"),
	FREIGHT_TRUCKING_CHARGE_OF_FEEDS("Freight/Trucking Charge of Feeds"),
	OTHERS("Others");

	String name;

    OperatingExpenses(String name) {
        this.name = name;
    }
}