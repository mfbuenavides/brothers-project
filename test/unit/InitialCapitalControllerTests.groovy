

import org.junit.*
import grails.test.mixin.*

@TestFor(InitialCapitalController)
@Mock(InitialCapital)
class InitialCapitalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/initialCapital/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.initialCapitalInstanceList.size() == 0
        assert model.initialCapitalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.initialCapitalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.initialCapitalInstance != null
        assert view == '/initialCapital/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/initialCapital/show/1'
        assert controller.flash.message != null
        assert InitialCapital.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/initialCapital/list'

        populateValidParams(params)
        def initialCapital = new InitialCapital(params)

        assert initialCapital.save() != null

        params.id = initialCapital.id

        def model = controller.show()

        assert model.initialCapitalInstance == initialCapital
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/initialCapital/list'

        populateValidParams(params)
        def initialCapital = new InitialCapital(params)

        assert initialCapital.save() != null

        params.id = initialCapital.id

        def model = controller.edit()

        assert model.initialCapitalInstance == initialCapital
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/initialCapital/list'

        response.reset()

        populateValidParams(params)
        def initialCapital = new InitialCapital(params)

        assert initialCapital.save() != null

        // test invalid parameters in update
        params.id = initialCapital.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/initialCapital/edit"
        assert model.initialCapitalInstance != null

        initialCapital.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/initialCapital/show/$initialCapital.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        initialCapital.clearErrors()

        populateValidParams(params)
        params.id = initialCapital.id
        params.version = -1
        controller.update()

        assert view == "/initialCapital/edit"
        assert model.initialCapitalInstance != null
        assert model.initialCapitalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/initialCapital/list'

        response.reset()

        populateValidParams(params)
        def initialCapital = new InitialCapital(params)

        assert initialCapital.save() != null
        assert InitialCapital.count() == 1

        params.id = initialCapital.id

        controller.delete()

        assert InitialCapital.count() == 0
        assert InitialCapital.get(initialCapital.id) == null
        assert response.redirectedUrl == '/initialCapital/list'
    }
}
