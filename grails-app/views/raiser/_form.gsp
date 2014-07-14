



<div class="fieldcontain ${hasErrors(bean: raiserInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="raiser.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${raiserInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raiserInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="raiser.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${raiserInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raiserInstance, field: 'batchNumber', 'error')} required">
	<label for="batchNumber">
		<g:message code="raiser.batchNumber.label" default="Batch Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="batchNumber" type="number" value="${raiserInstance.batchNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: raiserInstance, field: 'dateStarted', 'error')} required">
	<label for="dateStarted">
		<g:message code="raiser.dateStarted.label" default="Date Started" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateStarted" precision="day"  value="${raiserInstance?.dateStarted}"  />
</div>

