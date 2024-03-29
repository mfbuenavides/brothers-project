import com.threebrothers.FeedsType

class FeedsInventory {

	FeedsType feedsType
	String invoiceNumber
	Date date
	double quantity
	double truckingPerBag
	double amount
	double truckingCost
	double price
	String unit
	String description

	static constraints = {
		feedsType nullable: false, blank: false
		invoiceNumber nullable: false, blank: false, maxSize: 50
		date nullable: false, blank: false
		quantity nullable: false, blank: false
		truckingPerBag nullable: false, blank: false
		price nullable: false, blank: false
		amount nullable: true
		unit nullable: false, blank: false, maxSize: 100
		description nullable: false, blank: false, maxSize: 100
	}

	static mapping = {
		table 'feeds_inventory'
		feedsType column: 'feeds_type'
		invoiceNumber column: 'invoice_no'
		date column: 'date'
		quantity column: 'qty'
		truckingPerBag column: 'trucking_per_bag'
		amount column: 'amount'
		truckingCost column: 'trucking_cost'
		price column: 'price'
		unit column: 'unit'
		description column: 'description'
	}

	def beforeInsert() {
		truckingCost = truckingPerBag * quantity
		amount = truckingCost + (quantity * price)
	}

	def getRemainingAmount() {
		def consumedAmount = IndividualFeeds.findAllWhere(feedsInventory: this)?.sum { it.quantity }
		quantity - consumedAmount
	}
}