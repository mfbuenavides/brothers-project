class IndividualMedicine {

	IndividualCost individualCost
	MedicineInventory medicineInventory
	double quantity

    static constraints = {
    	quantity nullable: false
    	medicineInventory nullable: false
    	individualCost nullable: false, validator: { val, obj -> IndividualMedicine.findWhere(individualCost: val, medicineInventory: obj.medicineInventory) }
    }

    static create(IndividualCost individual, MedicineInventory medicine, Double quantity, boolean flush = true) {
    	new IndividualMedicine(individualCost: individual, medicineInventory: medicine, quantity: quantity).save(flush: flush)
    }
}
