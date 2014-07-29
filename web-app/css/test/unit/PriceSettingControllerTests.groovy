

import org.junit.*
import grails.test.mixin.*

@TestFor(PriceSettingController)
@Mock(PriceSetting)
class PriceSettingControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/priceSetting/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.priceSettingInstanceList.size() == 0
        assert model.priceSettingInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.priceSettingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.priceSettingInstance != null
        assert view == '/priceSetting/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/priceSetting/show/1'
        assert controller.flash.message != null
        assert PriceSetting.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/priceSetting/list'

        populateValidParams(params)
        def priceSetting = new PriceSetting(params)

        assert priceSetting.save() != null

        params.id = priceSetting.id

        def model = controller.show()

        assert model.priceSettingInstance == priceSetting
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/priceSetting/list'

        populateValidParams(params)
        def priceSetting = new PriceSetting(params)

        assert priceSetting.save() != null

        params.id = priceSetting.id

        def model = controller.edit()

        assert model.priceSettingInstance == priceSetting
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/priceSetting/list'

        response.reset()

        populateValidParams(params)
        def priceSetting = new PriceSetting(params)

        assert priceSetting.save() != null

        // test invalid parameters in update
        params.id = priceSetting.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/priceSetting/edit"
        assert model.priceSettingInstance != null

        priceSetting.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/priceSetting/show/$priceSetting.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        priceSetting.clearErrors()

        populateValidParams(params)
        params.id = priceSetting.id
        params.version = -1
        controller.update()

        assert view == "/priceSetting/edit"
        assert model.priceSettingInstance != null
        assert model.priceSettingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/priceSetting/list'

        response.reset()

        populateValidParams(params)
        def priceSetting = new PriceSetting(params)

        assert priceSetting.save() != null
        assert PriceSetting.count() == 1

        params.id = priceSetting.id

        controller.delete()

        assert PriceSetting.count() == 0
        assert PriceSetting.get(priceSetting.id) == null
        assert response.redirectedUrl == '/priceSetting/list'
    }
}
