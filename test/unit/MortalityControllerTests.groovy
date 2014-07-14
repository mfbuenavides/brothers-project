

import org.junit.*
import grails.test.mixin.*

@TestFor(MortalityController)
@Mock(Mortality)
class MortalityControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mortality/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mortalityInstanceList.size() == 0
        assert model.mortalityInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mortalityInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mortalityInstance != null
        assert view == '/mortality/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mortality/show/1'
        assert controller.flash.message != null
        assert Mortality.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mortality/list'

        populateValidParams(params)
        def mortality = new Mortality(params)

        assert mortality.save() != null

        params.id = mortality.id

        def model = controller.show()

        assert model.mortalityInstance == mortality
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mortality/list'

        populateValidParams(params)
        def mortality = new Mortality(params)

        assert mortality.save() != null

        params.id = mortality.id

        def model = controller.edit()

        assert model.mortalityInstance == mortality
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mortality/list'

        response.reset()

        populateValidParams(params)
        def mortality = new Mortality(params)

        assert mortality.save() != null

        // test invalid parameters in update
        params.id = mortality.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mortality/edit"
        assert model.mortalityInstance != null

        mortality.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mortality/show/$mortality.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mortality.clearErrors()

        populateValidParams(params)
        params.id = mortality.id
        params.version = -1
        controller.update()

        assert view == "/mortality/edit"
        assert model.mortalityInstance != null
        assert model.mortalityInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mortality/list'

        response.reset()

        populateValidParams(params)
        def mortality = new Mortality(params)

        assert mortality.save() != null
        assert Mortality.count() == 1

        params.id = mortality.id

        controller.delete()

        assert Mortality.count() == 0
        assert Mortality.get(mortality.id) == null
        assert response.redirectedUrl == '/mortality/list'
    }
}
