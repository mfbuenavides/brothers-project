



<div class="fieldcontain ${hasErrors(bean: medicineInventoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="medicineInventory.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${medicineInventoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicineInventoryInstance, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="medicineInventory.unit.label" default="Unit" />
		
	</label>
	<g:textField name="unit" value="${medicineInventoryInstance?.unit}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicineInventoryInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="medicineInventory.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cost" type="number" value="${fieldValue(bean: medicineInventoryInstance, field: 'cost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicineInventoryInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="medicineInventory.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number"  value="${fieldValue(bean: medicineInventoryInstance, field: 'quantity')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicineInventoryInstance, field: 'medicineType', 'error')} required">
	<label for="medicineType">
		<g:message code="medicineInventory.medicineType.label" default="Medicine Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="medicineType" from="${com.threebrothers.MedicineType?.values().name}" keys="${com.threebrothers.MedicineType.values()*.name()}" required="" value="${medicineInventoryInstance?.medicineType?.name()}"/>
</div>

