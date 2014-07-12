class Sales {

	Raiser raiser
	Date dateSold
	String haulerName
	String remarks
	int quantity
	double totalWeight
	double amount
	double price
	double averageWeight
	int hogScale

	static constraints = {
		raiser nullable: false, blank: false
		dateStarted nullable: false, blank: false
		haulerName nullable: false, blank: false, maxSize: 100
		quantity nullable: false, blank: false
		amount nullable: false, blank: false
		remarks nullable: true, blank: true, maxSize: 250
		hogScale nullable: true, blank: true
		price nullable: false, blank: false
		averageWeight nullable: true, blank: true
	}

	static mapping = {
		table 'sales'
		raiser column: 'raiser_id'
		dateStarted column: 'date_sold'
		haulerName column: 'hauler_name'
		quantity column: 'qty'
		amount column: 'amount'
		price column: 'price'
		averageWeight column: 'average_weight'
		hogScale column: 'hog_scale'
	}

	def beforeInsert() {
		averageWeight = totalWeight / quantity
		amount = price * quantity
	}
}