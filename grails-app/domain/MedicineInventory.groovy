import com.threebrothers.MedicineType

class MedicineInventory {

	String name
	String unit
	double cost
	double quantity
	MedicineType medicineType

    static constraints = {
    	name nullable: false, blank: false, maxSize: 100
    	unit nullable: true, blank: false
    	cost nullable: false, blank: false
    	quantity nullable: false, blank: false
    	medicineType nullable: false, balnk: false
    }

    static mapping = {
        table 'medicine_inventory'
    	name column: 'name'
    	unit column: 'unit'
    	cost column: 'cost'
    	quantity column: 'qty'
    	medicineType column: 'medicine_type'
    }

    def getRemainingAmount() {
        def consumedAmount = IndividualMedicine.findAllWhere(medicineInventory: this)?.sum { it.quantity }
        quantity - consumedAmount
    }
}
