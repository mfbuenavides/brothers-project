import groovy.time.TimeCategory

class InitialCapital {

	Raiser raiser
	PriceSetting priceSetting
	String pigSource
	int numberOfHeads
	double totalWeight
	double truckingExpenses
	double grossAmount
	double averageWeight
	double netAmount
	double averagePrice
	Date dateStarted
	Date expectedHaulDate
	
	static hasMany = [mortalities: Mortality, sales: Sales]

	static constraints = {
		raiser nullable: false
		priceSetting nullable: true
		pigSource nullable: true, blank: true, maxSize: 200
		numberOfHeads nullable: false, blank: false
		totalWeight nullable: false, blank: false
		truckingExpenses nullable: true
		dateStarted nullable: false, blank: true
		grossAmount nullable: true
		averageWeight nullable: true
		netAmount nullable: false, blank: false
		averagePrice nullable: false, blank: false
		expectedHaulDate nullable: false, blank: false
		mortalities nullable: true
		sales nullable: true
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
		netAmount column: 'net_amount'
		averagePrice column: 'average_price'
		expectedHaulDate column: 'expected_haul_date'
	}

	def beforeInsert() {
		priceSetting = new PriceSetting().getLatestSettings()

		use (TimeCategory) {
			expectedHaulDate = dateStarted + 105.days
		}
	}

	def getAging() {
		use (TimeCategory) {
			(new Date() - dateStarted).getDays() 
		}
	}

	def getRemainingHogs() {
		if (this?.sales)
			numberOfHeads - this.sales.sum { it.quantity }
	}
}