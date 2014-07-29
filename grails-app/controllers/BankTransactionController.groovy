import org.springframework.dao.DataIntegrityViolationException

class BankTransactionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bankTransactionInstanceList: BankTransaction.list(params), bankTransactionInstanceTotal: BankTransaction.count()]
    }

    def create() {
        [bankTransactionInstance: new BankTransaction(params)]
    }

    def save() {
        def bankTransactionInstance = new BankTransaction(params)
        if (!bankTransactionInstance.save(flush: true)) {
            render(view: "create", model: [bankTransactionInstance: bankTransactionInstance])
            return
        }

        flash.message = "Successfully created bank transaction."
        redirect(action: "list", params: params)
    }

    def show(Long id) {
        def bankTransactionInstance = BankTransaction.get(id)
        if (!bankTransactionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankTransaction.label', default: 'BankTransaction'), id])
            redirect(action: "list")
            return
        }

        [bankTransactionInstance: bankTransactionInstance]
    }

    def edit(Long id) {
        def bankTransactionInstance = BankTransaction.get(id)
        if (!bankTransactionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankTransaction.label', default: 'BankTransaction'), id])
            redirect(action: "list")
            return
        }

        [bankTransactionInstance: bankTransactionInstance]
    }

    def update(Long id, Long version) {
        def bankTransactionInstance = BankTransaction.get(id)
        if (!bankTransactionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankTransaction.label', default: 'BankTransaction'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bankTransactionInstance.version > version) {
                bankTransactionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bankTransaction.label', default: 'BankTransaction')] as Object[],
                          "Another user has updated this BankTransaction while you were editing")
                render(view: "edit", model: [bankTransactionInstance: bankTransactionInstance])
                return
            }
        }

        bankTransactionInstance.properties = params

        if (!bankTransactionInstance.save(flush: true)) {
            render(view: "edit", model: [bankTransactionInstance: bankTransactionInstance])
            return
        }

        flash.message = "Successfully updated bank transaction."
        redirect(action: "list")
    }

    def delete(Long id) {
        def bankTransactionInstance = BankTransaction.get(id)
        if (!bankTransactionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankTransaction.label', default: 'BankTransaction'), id])
            redirect(action: "list")
            return
        }

        try {
            bankTransactionInstance.delete(flush: true)
            flash.message = "Successfully deleted bank transaction."
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bankTransaction.label', default: 'BankTransaction'), id])
            redirect(action: "show", id: id)
        }
    }
}
