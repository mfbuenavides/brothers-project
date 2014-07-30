import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class CashFlowController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cashFlowInstanceList: CashFlow.list(params), cashFlowInstanceTotal: CashFlow.count()]
    }

    def create() {
        [cashFlowInstance: new CashFlow(params)]
    }

    def save() {
        def cashFlowInstance = new CashFlow(params)
        if (!cashFlowInstance.save(flush: true)) {
            render(view: "create", model: [cashFlowInstance: cashFlowInstance])
            return
        }

        flash.message = "Successfully created cash flow."
        redirect(action: "list", params: params)
    }

    def show(Long id) {
        def cashFlowInstance = CashFlow.get(id)
        if (!cashFlowInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cashFlow.label', default: 'CashFlow'), id])
            redirect(action: "list")
            return
        }

        [cashFlowInstance: cashFlowInstance]
    }

    def edit(Long id) {
        def cashFlowInstance = CashFlow.get(id)
        if (!cashFlowInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cashFlow.label', default: 'CashFlow'), id])
            redirect(action: "list")
            return
        }

        [cashFlowInstance: cashFlowInstance]
    }

    def update(Long id, Long version) {
        def cashFlowInstance = CashFlow.get(id)
        if (!cashFlowInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cashFlow.label', default: 'CashFlow'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cashFlowInstance.version > version) {
                cashFlowInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cashFlow.label', default: 'CashFlow')] as Object[],
                          "Another user has updated this CashFlow while you were editing")
                render(view: "edit", model: [cashFlowInstance: cashFlowInstance])
                return
            }
        }

        cashFlowInstance.properties = params

        if (!cashFlowInstance.save(flush: true)) {
            render(view: "edit", model: [cashFlowInstance: cashFlowInstance])
            return
        }

        flash.message = "Successfully updated cash flow."
        redirect(action: "list")
    }

    def delete(Long id) {
        def cashFlowInstance = CashFlow.get(id)
        if (!cashFlowInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cashFlow.label', default: 'CashFlow'), id])
            redirect(action: "list")
            return
        }

        try {
            cashFlowInstance.delete(flush: true)
            flash.message = "Successfully deleted cash flow."
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cashFlow.label', default: 'CashFlow'), id])
            redirect(action: "show", id: id)
        }
    }
}
