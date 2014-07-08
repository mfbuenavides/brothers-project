

import org.junit.*
import grails.test.mixin.*

@TestFor(RaiserController)
@Mock(Raiser)
class RaiserControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/raiser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.raiserInstanceList.size() == 0
        assert model.raiserInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.raiserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.raiserInstance != null
        assert view == '/raiser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/raiser/show/1'
        assert controller.flash.message != null
        assert Raiser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/raiser/list'

        populateValidParams(params)
        def raiser = new Raiser(params)

        assert raiser.save() != null

        params.id = raiser.id

        def model = controller.show()

        assert model.raiserInstance == raiser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/raiser/list'

        populateValidParams(params)
        def raiser = new Raiser(params)

        assert raiser.save() != null

        params.id = raiser.id

        def model = controller.edit()

        assert model.raiserInstance == raiser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/raiser/list'

        response.reset()

        populateValidParams(params)
        def raiser = new Raiser(params)

        assert raiser.save() != null

        // test invalid parameters in update
        params.id = raiser.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/raiser/edit"
        assert model.raiserInstance != null

        raiser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/raiser/show/$raiser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        raiser.clearErrors()

        populateValidParams(params)
        params.id = raiser.id
        params.version = -1
        controller.update()

        assert view == "/raiser/edit"
        assert model.raiserInstance != null
        assert model.raiserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/raiser/list'

        response.reset()

        populateValidParams(params)
        def raiser = new Raiser(params)

        assert raiser.save() != null
        assert Raiser.count() == 1

        params.id = raiser.id

        controller.delete()

        assert Raiser.count() == 0
        assert Raiser.get(raiser.id) == null
        assert response.redirectedUrl == '/raiser/list'
    }
}
