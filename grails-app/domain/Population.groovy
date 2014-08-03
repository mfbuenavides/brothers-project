class Population {

	Date deliveryDate
	InitialCapital initialCapital

	static constraints = {
		initialCapital nullable: false
		deliveryDate nullable: false, blank: false
	}

	static mapping = {
		table 'population'
		initialCapital column: 'initial_capital_id'
		deliveryDate column: 'delivery_date'
	}

	def getActualNumberOfPiglet() {
		initialCapital.numberOfHeads - initialCapital.mortalities.size() - getNumberOfSales()
	}

	def getNumberOfSales() {
		initialCapital.sales.quantity.sum()
	}

	//number of days as of today
	//initialCapital.getAging()

	//expecting haul date
	//initialCapital.expectedHaulDate
}