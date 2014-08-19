class IndividualCost {

	InitialCapital initialCapital
	MedicineInventory medicineInventory
	FeedsInventory feedsInventory
	String arNumber

    static constraints = {
 		initialCapital nullable: false, blank: false	
 		medicineInventory nullable: true, blank: true
 		feedsInventory nullable: false, blank: false
 		arNumber nullable: false, blank: false
	}
}
