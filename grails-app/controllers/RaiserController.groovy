import org.springframework.dao.DataIntegrityViolationException

class RaiserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [raiserInstanceList: Raiser.list(params), raiserInstanceTotal: Raiser.count()]
    }

    def create() {
        [raiserInstance: new Raiser(params)]
    }

    def save() {
        def raiserInstance = new Raiser(params)
        if (!raiserInstance.save(flush: true)) {
            render(view: "create", model: [raiserInstance: raiserInstance])
            return
        }
	
        flash.message = message(code: 'default.created.message', args: [message(code: 'raiser.label', default: 'Raiser'), (raiserInstance.firstName + " " +  raiserInstance.lastName)])
        //redirect(action: "show", id: raiserInstance.id)
        redirect(action: "list", params: params)
    }

    def show(Long id) {
        def raiserInstance = Raiser.get(id)
        if (!raiserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'raiser.label', default: 'Raiser'), id])
            redirect(action: "list")
            return
        }

        [raiserInstance: raiserInstance]
    }

    def edit(Long id) {
        def raiserInstance = Raiser.get(id)
        if (!raiserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'raiser.label', default: 'Raiser'), (raiserInstance.firstName + " " +  raiserInstance.lastName)])
            redirect(action: "list")
            return
        }

        [raiserInstance: raiserInstance]
    }

    def update(Long id, Long version) {
        def raiserInstance = Raiser.get(id)
        if (!raiserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'raiser.label', default: 'Raiser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (raiserInstance.version > version) {
                raiserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'raiser.label', default: 'Raiser')] as Object[],
                          "Another user has updated this Raiser while you were editing")
                render(view: "edit", model: [raiserInstance: raiserInstance])
                return
            }
        }

        raiserInstance.properties = params

        if (!raiserInstance.save(flush: true)) {
            render(view: "edit", model: [raiserInstance: raiserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'raiser.label', default: 'Raiser'), (raiserInstance.firstName + " " +  raiserInstance.lastName)])
        redirect(action: "list")
    }

    def delete(Long id) {
        def raiserInstance = Raiser.get(id)
        if (!raiserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'raiser.label', default: 'Raiser'), (raiserInstance.firstName + " " +  raiserInstance.lastName)])
            redirect(action: "list")
            return
        }

        try {
            raiserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'raiser.label', default: 'Raiser'), (raiserInstance.firstName + " " +  raiserInstance.lastName)])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'raiser.label', default: 'Raiser'), id])
            redirect(action: "show", id: id)
        }
    }
}
