class Population {

	Raiser raiser
	int numberOfPiglets
	Date deliveryDate
	String pigletSource

	static hasMany = [mortalities: Mortality, sales: Sales]

	static constraints = {
		raiser nullable: false, blank: false
		numberOfPiglets nullable: false, blank: false
		deliveryDate nullable: false, blank: false
		pigletSource nullable: false, blank: false
		mortalities nullable: true
		sales nullable: true
	}

	static mapping = {
		raiser column: 'raiser_id'
		numberOfPiglets column: 'no_of_piglets'
		deliveryDate column: 'delivery_date'
		pigletSource column: 'piglet_source'
	}
}