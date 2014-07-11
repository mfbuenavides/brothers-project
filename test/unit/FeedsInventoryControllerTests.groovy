

import org.junit.*
import grails.test.mixin.*

@TestFor(FeedsInventoryController)
@Mock(FeedsInventory)
class FeedsInventoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/feedsInventory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.feedsInventoryInstanceList.size() == 0
        assert model.feedsInventoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.feedsInventoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.feedsInventoryInstance != null
        assert view == '/feedsInventory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/feedsInventory/show/1'
        assert controller.flash.message != null
        assert FeedsInventory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/feedsInventory/list'

        populateValidParams(params)
        def feedsInventory = new FeedsInventory(params)

        assert feedsInventory.save() != null

        params.id = feedsInventory.id

        def model = controller.show()

        assert model.feedsInventoryInstance == feedsInventory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/feedsInventory/list'

        populateValidParams(params)
        def feedsInventory = new FeedsInventory(params)

        assert feedsInventory.save() != null

        params.id = feedsInventory.id

        def model = controller.edit()

        assert model.feedsInventoryInstance == feedsInventory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/feedsInventory/list'

        response.reset()

        populateValidParams(params)
        def feedsInventory = new FeedsInventory(params)

        assert feedsInventory.save() != null

        // test invalid parameters in update
        params.id = feedsInventory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/feedsInventory/edit"
        assert model.feedsInventoryInstance != null

        feedsInventory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/feedsInventory/show/$feedsInventory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        feedsInventory.clearErrors()

        populateValidParams(params)
        params.id = feedsInventory.id
        params.version = -1
        controller.update()

        assert view == "/feedsInventory/edit"
        assert model.feedsInventoryInstance != null
        assert model.feedsInventoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/feedsInventory/list'

        response.reset()

        populateValidParams(params)
        def feedsInventory = new FeedsInventory(params)

        assert feedsInventory.save() != null
        assert FeedsInventory.count() == 1

        params.id = feedsInventory.id

        controller.delete()

        assert FeedsInventory.count() == 0
        assert FeedsInventory.get(feedsInventory.id) == null
        assert response.redirectedUrl == '/feedsInventory/list'
    }
}
