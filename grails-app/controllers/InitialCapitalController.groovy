import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class InitialCapitalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [initialCapitalInstanceList: InitialCapital.list(params), initialCapitalInstanceTotal: InitialCapital.count()]
    }

    def create() {
        [initialCapitalInstance: new InitialCapital(params)]
    }

    def save() {
        def initialCapitalInstance = new InitialCapital(params)
        if (!initialCapitalInstance.save(flush: true)) {
            render(view: "create", model: [initialCapitalInstance: initialCapitalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'initialCapital.label', default: 'InitialCapital'), initialCapitalInstance.id])
        redirect(action: "show", id: initialCapitalInstance.id)
    }

    def show(Long id) {
        def initialCapitalInstance = InitialCapital.get(id)
        if (!initialCapitalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'initialCapital.label', default: 'InitialCapital'), id])
            redirect(action: "list")
            return
        }

        [initialCapitalInstance: initialCapitalInstance]
    }

    def edit(Long id) {
        def initialCapitalInstance = InitialCapital.get(id)
        if (!initialCapitalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'initialCapital.label', default: 'InitialCapital'), id])
            redirect(action: "list")
            return
        }

        [initialCapitalInstance: initialCapitalInstance]
    }

    def update(Long id, Long version) {
        def initialCapitalInstance = InitialCapital.get(id)
        if (!initialCapitalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'initialCapital.label', default: 'InitialCapital'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (initialCapitalInstance.version > version) {
                initialCapitalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'initialCapital.label', default: 'InitialCapital')] as Object[],
                          "Another user has updated this InitialCapital while you were editing")
                render(view: "edit", model: [initialCapitalInstance: initialCapitalInstance])
                return
            }
        }

        initialCapitalInstance.properties = params

        if (!initialCapitalInstance.save(flush: true)) {
            render(view: "edit", model: [initialCapitalInstance: initialCapitalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'initialCapital.label', default: 'InitialCapital'), initialCapitalInstance.id])
        redirect(action: "show", id: initialCapitalInstance.id)
    }

    def delete(Long id) {
        def initialCapitalInstance = InitialCapital.get(id)
        if (!initialCapitalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'initialCapital.label', default: 'InitialCapital'), id])
            redirect(action: "list")
            return
        }

        try {
            initialCapitalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'initialCapital.label', default: 'InitialCapital'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'initialCapital.label', default: 'InitialCapital'), id])
            redirect(action: "show", id: id)
        }
    }
}
