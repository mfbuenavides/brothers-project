

import org.junit.*
import grails.test.mixin.*

@TestFor(BankTransactionController)
@Mock(BankTransaction)
class BankTransactionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bankTransaction/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.bankTransactionInstanceList.size() == 0
        assert model.bankTransactionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.bankTransactionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.bankTransactionInstance != null
        assert view == '/bankTransaction/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bankTransaction/show/1'
        assert controller.flash.message != null
        assert BankTransaction.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bankTransaction/list'

        populateValidParams(params)
        def bankTransaction = new BankTransaction(params)

        assert bankTransaction.save() != null

        params.id = bankTransaction.id

        def model = controller.show()

        assert model.bankTransactionInstance == bankTransaction
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bankTransaction/list'

        populateValidParams(params)
        def bankTransaction = new BankTransaction(params)

        assert bankTransaction.save() != null

        params.id = bankTransaction.id

        def model = controller.edit()

        assert model.bankTransactionInstance == bankTransaction
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bankTransaction/list'

        response.reset()

        populateValidParams(params)
        def bankTransaction = new BankTransaction(params)

        assert bankTransaction.save() != null

        // test invalid parameters in update
        params.id = bankTransaction.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bankTransaction/edit"
        assert model.bankTransactionInstance != null

        bankTransaction.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bankTransaction/show/$bankTransaction.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bankTransaction.clearErrors()

        populateValidParams(params)
        params.id = bankTransaction.id
        params.version = -1
        controller.update()

        assert view == "/bankTransaction/edit"
        assert model.bankTransactionInstance != null
        assert model.bankTransactionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bankTransaction/list'

        response.reset()

        populateValidParams(params)
        def bankTransaction = new BankTransaction(params)

        assert bankTransaction.save() != null
        assert BankTransaction.count() == 1

        params.id = bankTransaction.id

        controller.delete()

        assert BankTransaction.count() == 0
        assert BankTransaction.get(bankTransaction.id) == null
        assert response.redirectedUrl == '/bankTransaction/list'
    }
}
