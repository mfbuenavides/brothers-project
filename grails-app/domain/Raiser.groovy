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
    	firstName column: 'first_name'
    	lastName column: 'last_name'
    	batchNumber column: 'batch_number'
    }
}
