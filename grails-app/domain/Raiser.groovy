class Raiser {

	String firstName
	String lastName
	int batchNumber

    static constraints = {
    	firstName nullable: false, blank: false
    	lastName nullable: false, blank: false
    	batchNumber nullable: false
    }

    static mapping = {
        table 'raiser'
    	firstName column: 'first_name'
    	lastName column: 'last_name'
    	batchNumber column: 'batch_no'
    }
}
