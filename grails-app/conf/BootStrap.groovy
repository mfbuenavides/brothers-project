import groovy.time.TimeCategory
import com.threebrothers.MedicineType
import com.threebrothers.Bank
import com.threebrothers.TransactionType
import com.threebrothers.PaymentMode
import com.threebrothers.PaymentSource

class BootStrap {

    def init = { servletContext ->

    	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)

    	String password = 'admin'

    	if (grails.util.GrailsUtil.environment == 'test') 
    		password = 'annamariepassword'

    	def adminAccount = new Account(username: 'admin', enabled: true, password: password)
	    
		adminAccount.save(flush: true)

	    AccountRole.create adminAccount, adminRole, true

	    def raiser_1 = new Raiser(firstName: 'Sylvester', lastName: 'Stallone', batchNumber: 1, dateStarted: new Date())
	    def raiser_2 = new Raiser(firstName: 'Jason', lastName: 'Statham', batchNumber: 3, dateStarted: new Date())

	    raiser_1.save(flush: true, failOnError: true)
	    raiser_2.save(flush: true, failOnError: true)

	    def priceSetting_1 = new PriceSetting(pricePerInitialTenKg: 10, priceSucceedingKg: 10)
	    def priceSetting_2 = new PriceSetting(pricePerInitialTenKg: 20, priceSucceedingKg: 25)
	    
		priceSetting_1.save(flush: true, failOnError: true)
	    priceSetting_2.save(flush: true, failOnError: true)

	    def initCapital_1
	    def initCapital_2
	    def initCapital_3

	    use (TimeCategory) {
		    initCapital_1 = new InitialCapital (
		    							raiser: raiser_1, 
		    							priceSetting: priceSetting_1, 
		    							pigSource: 'Hog Source Inc.', 
		    							numberOfHeads: 2, 
		    							totalWeight: 30,
		    							truckingExpenses: 300,
		    							grossAmount: 600,
		    							averageWeight: 15,
		    							netAmount: 900,
		    							averagePrice: 450,
		    							dateStarted: new Date(),
		    							expectedHaulDate: new Date() + 105.days
		    					)
	    	
		    initCapital_2 = new InitialCapital (
		    							raiser: raiser_2, 
		    							priceSetting: priceSetting_2, 
		    							pigSource: 'Hog Source Inc.', 
		    							numberOfHeads: 5, 
		    							totalWeight: 125,
		    							truckingExpenses: 300,
		    							grossAmount: 3075,
		    							averageWeight: 25,
		    							netAmount: 3375,
		    							averagePrice: 675,
		    							dateStarted: new Date(),
		    							expectedHaulDate: new Date() + 105.days
		    					)

		    initCapital_3 = new InitialCapital (
		    							raiser: raiser_2, 
		    							priceSetting: priceSetting_2, 
		    							pigSource: 'Hog Source Inc.', 
		    							numberOfHeads: 10, 
		    							totalWeight: 250,
		    							truckingExpenses: 300,
		    							grossAmount: 6200,
		    							averageWeight: 25,
		    							netAmount: 6500,
		    							averagePrice: 650,
		    							dateStarted: Date.parse('yyyy-MM-dd', '2014-05-20'),
		    							expectedHaulDate: Date.parse('yyyy-MM-dd', '2014-05-20') + 105.days
		    					)
		}

		def sales_1 = new Sales (
							raiser: raiser_1, 
							dateSold: Date.parse('yyyy-MM-dd', '2014-08-01'), 
							haulerName: 'Jet Li', 
							remarks: '5 pigs sold',
							quantity: 5,
							totalWeight: 125,
							amount: 3250,
							price: 3250,
							averageWeight: 25,
							hogScale: 125
						)

		def sales_2 = new Sales (
							raiser: raiser_1, 
							dateSold: Date.parse('yyyy-MM-dd', '2014-08-03'), 
							haulerName: 'Jay Hendrix', 
							remarks: '5 pigs sold',
							quantity: 5,
							totalWeight: 125,
							amount: 3250,
							price: 3250,
							averageWeight: 25,
							hogScale: 125
						)
		
		sales_1.save(flush: true, failOnError: true)
		sales_2.save(flush: true, failOnError: true)

		initCapital_3.addToSales(sales_1)
		initCapital_3.addToSales(sales_2)
		
		initCapital_1.save(flush: true, failOnError: true)
		initCapital_2.save(flush: true, failOnError: true)
		initCapital_3.save(flush: true, failOnError: true)

		def mortality_1 = new Mortality(raiser: raiser_1, dateOfDeath: new Date(), numberOfHeads: 1, causeOfDeath: 'Foot and mouth disease', initialCapital: initCapital_1)
		def mortality_2 = new Mortality(raiser: raiser_2, dateOfDeath: new Date(), numberOfHeads: 2, causeOfDeath: 'Ebola Virus', initialCapital: initCapital_2)

		mortality_1.save(flush: true, failOnError: true)
		mortality_2.save(flush: true, failOnError: true)
		
		def bankTx_1 = new BankTransaction (
							date: new Date(), 
							balance: 500, 
							checkNumber: '2058-956426', 
							description: 'debit', 
							transactionWith: 'Jona Morente', 
							bank: Bank.BDO, 
							transactionType: TransactionType.DEPOSIT,
							mode: PaymentMode.CHECK
						)

		def bankTx_2 = new BankTransaction (
							date: new Date(), 
							balance: 10000,  
							description: 'debit', 
							transactionWith: 'Nick Furry', 
							bank: Bank.BDO, 
							transactionType: TransactionType.WITHDRAWAL,
							mode: PaymentMode.CASH
						)

		bankTx_1.save(flush:true, failOnError: true)
		bankTx_2.save(flush:true, failOnError: true)

		def cashFlow_1 = new CashFlow(transactionDate: new Date(), amount: 3000, paidTo: 'Shell', remarks: 'gasoline', source: PaymentSource.VAULT, mode: PaymentMode.CASH)
		def cashFlow_2 = new CashFlow(transactionDate: new Date(), amount: 6000, paidTo: 'Meralco', remarks: 'electric bill', source: PaymentSource.AUB, mode: PaymentMode.CHECK)

		cashFlow_1.save(flush: true, failOnError: true)
		cashFlow_2.save(flush: true, failOnError: true)

	    new MedicineInventory(name: 'Respisure(50 dose)', unit: 'cc', cost: 1700, quantity: 300, medicineType: MedicineType.BIOLOGICAL_VACCINE).save(flush: true, failOnError: true)
		new MedicineInventory(name: 'Doxi-Colistin', cost: 700, quantity: 50, medicineType: MedicineType.WATER_MEDICATION).save(flush: true, failOnError: true)
	    new MedicineInventory(name: 'Tiamulin', cost: 6800, quantity: 100, medicineType: MedicineType.FEED_MEDICATION).save(flush: true, failOnError: true)
	    
	    new FeedsInventory(raiser: raiser_1, invoiceNumber: '0256243', date: new Date(), quantity: 15, truckingPerBag: 8, price: 975, unit: 'bags', description: 'Hog Starter Regular 50kgs.').save(flush: true, failOnError: true)
	    new FeedsInventory(raiser: raiser_2, invoiceNumber: '8513656', date: Date.parse('yyyy-MM-dd', '2014-05-12'), quantity: 1015, truckingPerBag: 8, price: 150, unit: 'bags', description: 'Hog Starter Regular 50kgs.').save(flush: true, failOnError: true)
	    new FeedsInventory(raiser: raiser_1, invoiceNumber: '8216264', date: new Date(), quantity: 50, truckingPerBag: 8, price: 885, unit: 'bags', description: 'Hog Starter Regular 50kgs.').save(flush: true, failOnError: true)

	    assert Account.count() == 1
	    assert AccountRole.count() == 1
	    assert MedicineInventory.count() == 3
	    assert FeedsInventory.count() == 3

    }
    def destroy = {
    }
}
