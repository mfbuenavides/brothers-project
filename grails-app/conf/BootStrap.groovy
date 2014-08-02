import com.threebrothers.MedicineType

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)

	    def testUser = new Account(username: 'admin', enabled: true, password: 'admin')
	    testUser.save(flush: true)

	    AccountRole.create testUser, adminRole, true

	    def raiserTwo = new Raiser(firstName: 'Jason', lastName: 'Statham', batchNumber: 3, dateStarted: new Date())
	    def raiserOne = new Raiser(firstName: 'Sylvester', lastName: 'Stallone', batchNumber: 1, dateStarted: new Date())

	    raiserOne.save(flush: true, failOnError: true)
	    raiserTwo.save(flush: true, failOnError: true)

	    new PriceSetting(pricePerInitialTenKg: 10, priceSucceedingKg: 30).save(flush: true, failOnError: true)

	    new MedicineInventory(name: 'Respisure(50 dose)', unit: 'cc', cost: 1700, quantity: 300, medicineType: MedicineType.BIOLOGICAL_VACCINE).save(flush: true, failOnError: true)
		new MedicineInventory(name: 'Doxi-Colistin', cost: 700, quantity: 50, medicineType: MedicineType.WATER_MEDICATION).save(flush: true, failOnError: true)
	    new MedicineInventory(name: 'Tiamulin', cost: 6800, quantity: 100, medicineType: MedicineType.FEED_MEDICATION).save(flush: true, failOnError: true)
	    
	    new FeedsInventory(raiser: raiserOne, invoiceNumber: '0256243', date: new Date(), quantity: 15, truckingPerBag: 8, price: 975, unit: 'bags', description: 'Hog Starter Regular 50kgs.').save(flush: true, failOnError: true)
	    new FeedsInventory(raiser: raiserTwo, invoiceNumber: '8513656', date: Date.parse('yyyy-MM-dd', '2014-05-12'), quantity: 1015, truckingPerBag: 8, price: 150, unit: 'bags', description: 'Hog Starter Regular 50kgs.').save(flush: true, failOnError: true)
	    new FeedsInventory(raiser: raiserOne, invoiceNumber: '8216264', date: new Date(), quantity: 50, truckingPerBag: 8, price: 885, unit: 'bags', description: 'Hog Starter Regular 50kgs.').save(flush: true, failOnError: true)

	    assert Account.count() == 1
	    assert AccountRole.count() == 1
	    assert MedicineInventory.count() == 3
	    assert FeedsInventory.count() == 3

    }
    def destroy = {
    }
}
