class IndividualCost {

	InitialCapital initialCapital
	String arNumber

    static constraints = {
 		initialCapital nullable: false, blank: false	
 		arNumber nullable: false, blank: false
	}
}
