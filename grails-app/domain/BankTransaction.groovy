import com.threebrothers.Bank
import com.threebrothers.TransactionType
import com.threebrothers.PaymentMode

class BankTransaction {
	
	Date date
	double balance
	String checkNumber
	String description
	String transactionWith
	Bank bank
	TransactionType transactionType
	PaymentMode mode

	static constraints = {
		date nullable: false, blank: false
		bank nullable: false, blank: false
		transactionType nullable: false, blank: false
		balance nullable: false, blank: false, maxSize: 15
		checkNumber nullable: true, blank: true, maxSize: 50
		description nullable: false, blank: false, maxSize: 100
		transactionWith nullable: true, blank: true
	}

	static mapping = {
		table 'banks_transaction'
		date column: 'date'
		transactionType column: 'transaction_type'
		balance column: 'balance'
		checkNumber column: 'check_no'
		description column: 'description'
		transactionWith column: 'transaction_with'
	}
}