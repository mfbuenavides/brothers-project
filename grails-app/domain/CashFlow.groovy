import com.threebrothers.PaymentMode
import com.threebrothers.PaymentSource

class CashFlow {
	
	Date transactionDate
	double amount
	String paidTo
	String remarks
	PaymentSource source
	PaymentMode mode

	static constraints = {
		date nullable: false, blank: false
		amount nullable: false, blank: false
		paidTo nullable: false, blank: false
		remarks nullable: true, blank: true
		source nullable: false, blank: false
		mode nullable: false, blank: false
	}

	static mapping = {
		table 'cash_flow'
		transactionDate column: 'transaction_date'
		amount column: 'amount'
		paidTo column: 'paid_to'
		remarks column: 'remarks'
		source column: 'source'
		mode column: 'payment_mode'
	}

}