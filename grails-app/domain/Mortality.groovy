class Mortality {

	Raiser raiser
	Date dateOfDeath
	int numberOfHeads
	String causeOfDeath

	static constraints = {
		raiser nullable: false, blank: false
		dateOfDeath nullable: false, blank: false
		numberOfHeads nullable: false, blank: false
		causeOfDeath nullable: true, blank: true
	}	

	static mapping = {
		raiser column: 'raiser_id'
		dateOfDeath column: 'date_of_death'
		numberOfHeads column: 'number_of_heads'
		causeOfDeath column: 'cause_of_death'
	}
}