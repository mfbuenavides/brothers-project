import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class MedicineInventoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [medicineInventoryInstanceList: MedicineInventory.list(params), medicineInventoryInstanceTotal: MedicineInventory.count()]
    }

    def create() {
        [medicineInventoryInstance: new MedicineInventory(params)]
    }

    def save() {
        def medicineInventoryInstance = new MedicineInventory(params)
        if (!medicineInventoryInstance.save(flush: true)) {
            render(view: "create", model: [medicineInventoryInstance: medicineInventoryInstance])
            return
        }

        flash.message = "New Medicine successfully created."
        redirect(action: "list", params: params)
    }

    def show(Long id) {
        def medicineInventoryInstance = MedicineInventory.get(id)
        if (!medicineInventoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicineInventory.label', default: 'MedicineInventory'), id])
            redirect(action: "list")
            return
        }

        [medicineInventoryInstance: medicineInventoryInstance]
    }

    def edit(Long id) {
        def medicineInventoryInstance = MedicineInventory.get(id)
        if (!medicineInventoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicineInventory.label', default: 'MedicineInventory'), id])
            redirect(action: "list")
            return
        }

        [medicineInventoryInstance: medicineInventoryInstance]
    }

    def update(Long id, Long version) {
        def medicineInventoryInstance = MedicineInventory.get(id)
        if (!medicineInventoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicineInventory.label', default: 'MedicineInventory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (medicineInventoryInstance.version > version) {
                medicineInventoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'medicineInventory.label', default: 'MedicineInventory')] as Object[],
                          "Another user has updated this MedicineInventory while you were editing")
                render(view: "edit", model: [medicineInventoryInstance: medicineInventoryInstance])
                return
            }
        }

        medicineInventoryInstance.properties = params

        if (!medicineInventoryInstance.save(flush: true)) {
            render(view: "edit", model: [medicineInventoryInstance: medicineInventoryInstance])
            return
        }

        flash.message = "Medicine successfully updated."
        redirect(action: "list")
    }

    def delete(Long id) {
        def medicineInventoryInstance = MedicineInventory.get(id)
        if (!medicineInventoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicineInventory.label', default: 'MedicineInventory'), id])
            redirect(action: "list")
            return
        }

        try {
            medicineInventoryInstance.delete(flush: true)
            flash.message = "Medicine deleted."
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'medicineInventory.label', default: 'MedicineInventory'), id])
            redirect(action: "show", id: id)
        }
    }
}
