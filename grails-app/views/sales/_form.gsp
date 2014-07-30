



<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'raiser', 'error')} required">
	<label for="raiser">
		<g:message code="sales.raiser.label" default="Raiser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="raiser" name="raiser.id" from="${Raiser.list()}" optionKey="id" optionValue="firstName" required="" value="${salesInstance?.raiser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'dateSold', 'error')} required">
	<label for="dateSold">
		<g:message code="sales.dateSold.label" default="Date Sold" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateSold" precision="day"  value="${salesInstance?.dateSold}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'haulerName', 'error')} required">
	<label for="haulerName">
		<g:message code="sales.haulerName.label" default="Hauler Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="haulerName" maxlength="100" required="" value="${salesInstance?.haulerName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="sales.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" value="${salesInstance.quantity}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="sales.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount"  type="number" value="${fieldValue(bean: salesInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'hogScale', 'error')} required">
	<label for="hogScale">
		<g:message code="sales.hogScale.label" default="Hog Scale" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hogScale" type="number" value="${salesInstance.hogScale}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="sales.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price"  type="number" value="${fieldValue(bean: salesInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'totalWeight', 'error')} required">
	<label for="totalWeight">
		<g:message code="sales.totalWeight.label" default="Total Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalWeight"  type="number" value="${fieldValue(bean: salesInstance, field: 'totalWeight')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'averageWeight', 'error')} required">
	<label for="averageWeight">
		<g:message code="sales.averageWeight.label" default="Average Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="averageWeight"  type="number" value="${fieldValue(bean: salesInstance, field: 'averageWeight')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'remarks', 'error')} ">
	<label for="remarks">
		<g:message code="sales.remarks.label" default="Remarks" />
		
	</label>
	<g:textField name="remarks" maxlength="250" value="${salesInstance?.remarks}"/>
</div>
