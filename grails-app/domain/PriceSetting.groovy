class PriceSetting {

	Double pricePerInitialTenKg
	Double priceSuccceedingKg
	Date effectivityDate

    static constraints = {
    	pricePerInitialTenKg nullable: false, blank: false
    	priceSuccceedingKg nullable: false, balnk: false
    	effectivityDate nullable: true 
    }

    static mapping = {
    	pricePerInitialTenKg column: 'price_per_initial_ten_kg'
    	priceSuccceedingKg column: 'price_succeeding_kg'
    	effectivityDate column: 'date_effectivity'
    }

    def getLatestSettings() {
    	def priceSettings = PriceSetting.getAll().sort { -it.effectivityDate }

    	if (priceSettings) {
    		return priceSettings[0]
    	} else null
    }

    def beforeInsert() {
        effectivityDate = new Date()
    }
}
