class InventoryService {

	static transactional = true

	def updateIndividualFeeds(IndividualCost individual, FeedsInventory feeds, Double quantity) {
		def individualFeeds = IndividualFeeds.findWhere(feedsInventory: feeds, individualCost: individual)

		if (individualFeeds) {
			if (quantity < individualFeeds.quantity) {
				feeds.quantity += (individualFeeds.quantity - quantity)
				feeds.save(flush: true) 
			} else 
				individualFeeds.quantity = quantity
				individualFeeds.save(flush: true)
		} else {
			IndividualFeeds.create(individual, feeds, quantity, true)
		}
	}

	def updateIndividualMedicine(IndividualCost individual, MedicineInventory medicine, Double quantity) {
		def individualMedicine = IndividualMedicine.findWhere(medicineInventory: medicine, individualCost: individual)

		if (individualMedicine) {
			if (quantity < individualMedicine.quantity) {
				medicine.quantity += (medicineInventory.quantity - quantity) 
				medicine.save(flush: true)
			} else
				medicineInventory.quantity = quantity
				medicineInventory.save(flush: true)
		} else {
			IndividualMedicine.create(individual, medicine, quantity, true)
		}
	}
}
