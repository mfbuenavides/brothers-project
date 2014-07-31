class Raiser {

	String firstName
	String lastName
	int batchNumber
    Date dateStarted

    static constraints = {
    	firstName nullable: false, blank: false
    	lastName nullable: false, blank: false
    	batchNumber nullable: false
        dateStarted nullable: false
    }

    static mapping = {
        table 'raiser'
    	firstName column: 'first_name'
    	lastName column: 'last_name'
    	batchNumber column: 'batch_no'
        dateStarted column: 'date_started'
    }
    
    public String getFullName(){
    	return "${firstName} ${lastName}"
    }
}
