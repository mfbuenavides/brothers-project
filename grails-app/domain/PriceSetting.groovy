class PriceSetting {

	Double pricePerInitialTenKg
	Double priceSucceedingKg
	Date effectivityDate

    static constraints = {
    	pricePerInitialTenKg nullable: false, blank: false
    	priceSucceedingKg nullable: false, balnk: false
    	effectivityDate nullable: true 
    }

    static mapping = {
        table 'price_setting'
    	pricePerInitialTenKg column: 'price_per_initial_ten_kg'
    	priceSucceedingKg column: 'price_per_kg'
    	effectivityDate column: 'date_effectivity'
    }

    def getLatestSettings() {
    	def priceSettings = PriceSetting.executeQuery("""select ps from PriceSetting ps where ps.effectivityDate <= :now order by ps.effectivityDate desc""",[now: new Date()])

    	if (priceSettings) {
    		return priceSettings[0]
    	} else null
    }

    def beforeInsert() {
        effectivityDate = new Date()
    }
}
