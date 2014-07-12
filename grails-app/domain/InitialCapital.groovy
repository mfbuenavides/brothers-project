class InitialCapital {

	Raiser raiser
	PriceSetting priceSetting
	String pigSource
	int numberOfHeads
	double totalWeight
	double truckingExpenses
	Date dateStarted
	double grossAmount
	double averageWeight

	static constraints = {
		raiser nullable: false
		priceSetting nullable: false
		pigSource nullable: true, blank: true, maxSize: 200
		numberOfHeads nullable: false, blank: false
		totalWeight nullable: false, blank: false
		truckingExpenses nullable: true
		dateStarted nullable: false, blank: true
		grossAmount nullable: true
		averageWeight nullable: true
	}

	static mapping = {
		table 'initial_capital'
		raiser column: 'raiser_id'
		priceSetting column: 'price_setting_id'
		pigSource column: 'pig_source'
		numberOfHeads column: 'no_of_heads'
		totalWeight column: 'total_weight'
		truckingExpenses column: 'trucking_expenses'
		dateStarted column: 'date_started'
		grossAmount column: 'gross_amount'
		averageWeight column: 'average_weight'
	}

	def beforeInsert() {
		priceSetting = PriceSetting.getLatestSettings()
		
		if (totalWeight > 10) {
			def remainingKg = totalWeight - 10
			grossAmount = ((10 * priceSetting.pricePerInitialTenKg) + (remainingKg * priceSetting.priceSucceedingKg))
		} else {
			grossAmount = totalWeight * priceSetting.pricePerInitialTenKg
		}
	}
}