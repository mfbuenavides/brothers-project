import org.junit.*
import grails.test.mixin.*

@TestFor(CashFlowController)
@Mock(CashFlow)
class CashFlowControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cashFlow/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cashFlowInstanceList.size() == 0
        assert model.cashFlowInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cashFlowInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cashFlowInstance != null
        assert view == '/cashFlow/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cashFlow/show/1'
        assert controller.flash.message != null
        assert CashFlow.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cashFlow/list'

        populateValidParams(params)
        def cashFlow = new CashFlow(params)

        assert cashFlow.save() != null

        params.id = cashFlow.id

        def model = controller.show()

        assert model.cashFlowInstance == cashFlow
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cashFlow/list'

        populateValidParams(params)
        def cashFlow = new CashFlow(params)

        assert cashFlow.save() != null

        params.id = cashFlow.id

        def model = controller.edit()

        assert model.cashFlowInstance == cashFlow
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cashFlow/list'

        response.reset()

        populateValidParams(params)
        def cashFlow = new CashFlow(params)

        assert cashFlow.save() != null

        // test invalid parameters in update
        params.id = cashFlow.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cashFlow/edit"
        assert model.cashFlowInstance != null

        cashFlow.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cashFlow/show/$cashFlow.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cashFlow.clearErrors()

        populateValidParams(params)
        params.id = cashFlow.id
        params.version = -1
        controller.update()

        assert view == "/cashFlow/edit"
        assert model.cashFlowInstance != null
        assert model.cashFlowInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cashFlow/list'

        response.reset()

        populateValidParams(params)
        def cashFlow = new CashFlow(params)

        assert cashFlow.save() != null
        assert CashFlow.count() == 1

        params.id = cashFlow.id

        controller.delete()

        assert CashFlow.count() == 0
        assert CashFlow.get(cashFlow.id) == null
        assert response.redirectedUrl == '/cashFlow/list'
    }
}
