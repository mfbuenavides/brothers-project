import org.springframework.dao.DataIntegrityViolationException

class PriceSettingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [priceSettingInstanceList: PriceSetting.list(params), priceSettingInstanceTotal: PriceSetting.count()]
    }

    def create() {
        [priceSettingInstance: new PriceSetting(params)]
    }

    def save() {
        def priceSettingInstance = new PriceSetting(params)
        
        if (!priceSettingInstance.save(flush: true)) {
            render(view: "create", model: [priceSettingInstance: priceSettingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'priceSetting.label', default: 'PriceSetting'), priceSettingInstance.id])
        redirect(action: "show", id: priceSettingInstance.id)
    }

    def show(Long id) {
        def priceSettingInstance = PriceSetting.get(id)
        if (!priceSettingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceSetting.label', default: 'PriceSetting'), id])
            redirect(action: "list")
            return
        }

        [priceSettingInstance: priceSettingInstance]
    }

    def edit(Long id) {
        def priceSettingInstance = PriceSetting.get(id)
        if (!priceSettingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceSetting.label', default: 'PriceSetting'), id])
            redirect(action: "list")
            return
        }

        [priceSettingInstance: priceSettingInstance]
    }

    def update(Long id, Long version) {
        def priceSettingInstance = PriceSetting.get(id)
        if (!priceSettingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceSetting.label', default: 'PriceSetting'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (priceSettingInstance.version > version) {
                priceSettingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'priceSetting.label', default: 'PriceSetting')] as Object[],
                          "Another user has updated this PriceSetting while you were editing")
                render(view: "edit", model: [priceSettingInstance: priceSettingInstance])
                return
            }
        }

        priceSettingInstance.properties = params

        if (!priceSettingInstance.save(flush: true)) {
            render(view: "edit", model: [priceSettingInstance: priceSettingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'priceSetting.label', default: 'PriceSetting'), priceSettingInstance.id])
        redirect(action: "show", id: priceSettingInstance.id)
    }

    def delete(Long id) {
        def priceSettingInstance = PriceSetting.get(id)
        if (!priceSettingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceSetting.label', default: 'PriceSetting'), id])
            redirect(action: "list")
            return
        }

        try {
            priceSettingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'priceSetting.label', default: 'PriceSetting'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'priceSetting.label', default: 'PriceSetting'), id])
            redirect(action: "show", id: id)
        }
    }
}
