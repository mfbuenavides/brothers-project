import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class FeedsInventoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def sample = {
        def initCapital = InitialCapital.get(1)
        def indiCost = IndividualCost.findOrCreateWhere(initialCapital: initCapital, arNumber: '739402034')
        indiCost.save(flush: true)

        def indiCost_1 = IndividualCost.findOrCreateWhere(initialCapital: initCapital, arNumber: '343787483')
        indiCost_1.save(flush: true)

        def feeds = FeedsInventory.get(1)

        def indiFeeds = IndividualFeeds.findOrCreateWhere(feedsInventory: feeds, individualCost: indiCost, quantity: 100.toDouble())
        indiFeeds.save(flush: true, failOnError: true)

        def indiFeeds_2 = IndividualFeeds.findOrCreateWhere(feedsInventory: feeds, individualCost: indiCost, quantity: 300.toDouble())
        indiFeeds_2.save(flush: true, failOnError: true)

        println "DEBUG| feeds quantity: ${feeds.getRemainingAmount()}"
        render 'check console'
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [feedsInventoryInstanceList: FeedsInventory.list(params), feedsInventoryInstanceTotal: FeedsInventory.count()]
    }

    def create() {
        [feedsInventoryInstance: new FeedsInventory(params)]
    }

    def save() {
        def feedsInventoryInstance = new FeedsInventory(params)
        if (!feedsInventoryInstance.save(flush: true)) {
            render(view: "create", model: [feedsInventoryInstance: feedsInventoryInstance])
            return
        }

        flash.message = "Successfully added new feeds."
        redirect(action: "list", params: params)
    }

    def show(Long id) {
        def feedsInventoryInstance = FeedsInventory.get(id)
        if (!feedsInventoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'feedsInventory.label', default: 'FeedsInventory'), id])
            redirect(action: "list")
            return
        }

        [feedsInventoryInstance: feedsInventoryInstance]
    }

    def edit(Long id) {
        def feedsInventoryInstance = FeedsInventory.get(id)
        if (!feedsInventoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'feedsInventory.label', default: 'FeedsInventory'), id])
            redirect(action: "list")
            return
        }

        [feedsInventoryInstance: feedsInventoryInstance]
    }

    def update(Long id, Long version) {
        def feedsInventoryInstance = FeedsInventory.get(id)
        if (!feedsInventoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'feedsInventory.label', default: 'FeedsInventory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (feedsInventoryInstance.version > version) {
                feedsInventoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'feedsInventory.label', default: 'FeedsInventory')] as Object[],
                          "Another user has updated this FeedsInventory while you were editing")
                render(view: "edit", model: [feedsInventoryInstance: feedsInventoryInstance])
                return
            }
        }

        feedsInventoryInstance.properties = params

        if (!feedsInventoryInstance.save(flush: true)) {
            render(view: "edit", model: [feedsInventoryInstance: feedsInventoryInstance])
            return
        }

        flash.message = "Successfully updated feeds."
        redirect(action: "list")
    }

    def delete(Long id) {
        def feedsInventoryInstance = FeedsInventory.get(id)
        if (!feedsInventoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'feedsInventory.label', default: 'FeedsInventory'), id])
            redirect(action: "list")
            return
        }

        try {
            feedsInventoryInstance.delete(flush: true)
            flash.message = "Successfully deleted feeds."
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'feedsInventory.label', default: 'FeedsInventory'), id])
            redirect(action: "show", id: id)
        }
    }
}
