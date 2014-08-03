import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class MortalityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [mortalityInstanceList: Mortality.list(params), mortalityInstanceTotal: Mortality.count()]
    }

    def create() {
        [mortalityInstance: new Mortality(params)]
    }

    def save() {
        def mortalityInstance = new Mortality(params)
        if (!mortalityInstance.save(flush: true)) {
            render(view: "create", model: [mortalityInstance: mortalityInstance])
            return
        }

        flash.message = "Successfully saved new mortality."
        redirect(action: "list", params: params)
    }

    def show(Long id) {
        def mortalityInstance = Mortality.get(id)
        if (!mortalityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mortality.label', default: 'Mortality'), id])
            redirect(action: "list")
            return
        }

        [mortalityInstance: mortalityInstance]
    }

    def edit(Long id) {
        def mortalityInstance = Mortality.get(id)
        if (!mortalityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mortality.label', default: 'Mortality'), id])
            redirect(action: "list")
            return
        }

        [mortalityInstance: mortalityInstance]
    }

    def update(Long id, Long version) {
        def mortalityInstance = Mortality.get(id)
        if (!mortalityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mortality.label', default: 'Mortality'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mortalityInstance.version > version) {
                mortalityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'mortality.label', default: 'Mortality')] as Object[],
                          "Another user has updated this Mortality while you were editing")
                render(view: "edit", model: [mortalityInstance: mortalityInstance])
                return
            }
        }

        mortalityInstance.properties = params

        if (!mortalityInstance.save(flush: true)) {
            render(view: "edit", model: [mortalityInstance: mortalityInstance])
            return
        }

        flash.message = "Successfully updated mortality."
        redirect(action: "list")
    }

    def delete(Long id) {
        def mortalityInstance = Mortality.get(id)
        if (!mortalityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mortality.label', default: 'Mortality'), id])
            redirect(action: "list")
            return
        }

        try {
            mortalityInstance.delete(flush: true)
            flash.message = "Successfully deleted mortality."
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mortality.label', default: 'Mortality'), id])
            redirect(action: "show", id: id)
        }
    }
}
