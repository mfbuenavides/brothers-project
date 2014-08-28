class IndividualFeeds {

	IndividualCost individualCost
	FeedsInventory feedsInventory
	double quantity

    static constraints = {
    	quantity nullable: false
    	feedsInventory nullable: false
    	individualCost nullable: false, validator: { val, obj -> IndividualFeeds.findWhere(individualCost: val, feedsInventory: obj.feedsInventory) }
    }

    static create(IndividualCost individual, FeedsInventory feeds, Double quantity, boolean flush = true) {
    	new IndividualFeeds(individualCost: individual, feedsInventory: feeds, quantity: quantity).save(flush: flush)
    }
}
