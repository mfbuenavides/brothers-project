import com.threebrothers.*

class CashFlow {
	
	Date transactionDate
	double amount
	OperatingExpenses paidFor
	String remarks
	PaymentSource source
	PaymentMode mode
	String otherExpenses

	static constraints = {
		transactionDate nullable: false, blank: false
		amount nullable: false, blank: false
		paidFor nullable: false, blank: false
		remarks nullable: true, blank: true
		source nullable: false, blank: false
		mode nullable: false, blank: false
		otherExpenses nullable: true, blank: true
	}

	static mapping = {
		table 'cash_flow'
		transactionDate column: 'transaction_date'
		amount column: 'amount'
		paidFor column: 'paid_for'
		remarks column: 'remarks'
		source column: 'source'
		mode column: 'payment_mode'
		otherExpenses column: 'other_expenses'
	}

}