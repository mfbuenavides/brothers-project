



<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'raiser', 'error')} required">
	<label for="raiser">
		<g:message code="feedsInventory.raiser.label" default="Raiser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="raiser" name="raiser.id" from="${Raiser.list()}" optionKey="id" optionValue="firstName" required="" value="${feedsInventoryInstance?.raiser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'invoiceNumber', 'error')} required">
	<label for="invoiceNumber">
		<g:message code="feedsInventory.invoiceNumber.label" default="Invoice Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="invoiceNumber" maxlength="50" required="" value="${feedsInventoryInstance?.invoiceNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="feedsInventory.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${feedsInventoryInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="feedsInventory.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="quantity" value="${fieldValue(bean: feedsInventoryInstance, field: 'quantity')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'truckingPerBag', 'error')} required">
	<label for="truckingPerBag">
		<g:message code="feedsInventory.truckingPerBag.label" default="Trucking Per Bag" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="truckingPerBag" value="${fieldValue(bean: feedsInventoryInstance, field: 'truckingPerBag')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="feedsInventory.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="price" value="${fieldValue(bean: feedsInventoryInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="feedsInventory.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="amount" value="${fieldValue(bean: feedsInventoryInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'unit', 'error')} required">
	<label for="unit">
		<g:message code="feedsInventory.unit.label" default="Unit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="unit" maxlength="100" required="" value="${feedsInventoryInstance?.unit}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="feedsInventory.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="100" required="" value="${feedsInventoryInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: feedsInventoryInstance, field: 'truckingCost', 'error')} required">
	<label for="truckingCost">
		<g:message code="feedsInventory.truckingCost.label" default="Trucking Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="truckingCost" value="${fieldValue(bean: feedsInventoryInstance, field: 'truckingCost')}" required=""/>
</div>

