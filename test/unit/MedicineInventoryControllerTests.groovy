

import org.junit.*
import grails.test.mixin.*

@TestFor(MedicineInventoryController)
@Mock(MedicineInventory)
class MedicineInventoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/medicineInventory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.medicineInventoryInstanceList.size() == 0
        assert model.medicineInventoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.medicineInventoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.medicineInventoryInstance != null
        assert view == '/medicineInventory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/medicineInventory/show/1'
        assert controller.flash.message != null
        assert MedicineInventory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/medicineInventory/list'

        populateValidParams(params)
        def medicineInventory = new MedicineInventory(params)

        assert medicineInventory.save() != null

        params.id = medicineInventory.id

        def model = controller.show()

        assert model.medicineInventoryInstance == medicineInventory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/medicineInventory/list'

        populateValidParams(params)
        def medicineInventory = new MedicineInventory(params)

        assert medicineInventory.save() != null

        params.id = medicineInventory.id

        def model = controller.edit()

        assert model.medicineInventoryInstance == medicineInventory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/medicineInventory/list'

        response.reset()

        populateValidParams(params)
        def medicineInventory = new MedicineInventory(params)

        assert medicineInventory.save() != null

        // test invalid parameters in update
        params.id = medicineInventory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/medicineInventory/edit"
        assert model.medicineInventoryInstance != null

        medicineInventory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/medicineInventory/show/$medicineInventory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        medicineInventory.clearErrors()

        populateValidParams(params)
        params.id = medicineInventory.id
        params.version = -1
        controller.update()

        assert view == "/medicineInventory/edit"
        assert model.medicineInventoryInstance != null
        assert model.medicineInventoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/medicineInventory/list'

        response.reset()

        populateValidParams(params)
        def medicineInventory = new MedicineInventory(params)

        assert medicineInventory.save() != null
        assert MedicineInventory.count() == 1

        params.id = medicineInventory.id

        controller.delete()

        assert MedicineInventory.count() == 0
        assert MedicineInventory.get(medicineInventory.id) == null
        assert response.redirectedUrl == '/medicineInventory/list'
    }
}
