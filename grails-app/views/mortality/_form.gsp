



<div class="fieldcontain ${hasErrors(bean: mortalityInstance, field: 'raiser', 'error')} required">
	<label for="raiser">
		<g:message code="mortality.raiser.label" default="Raiser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="raiser" name="raiser.id" from="${Raiser.list()}" optionKey="id" required="" value="${mortalityInstance?.raiser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mortalityInstance, field: 'dateOfDeath', 'error')} required">
	<label for="dateOfDeath">
		<g:message code="mortality.dateOfDeath.label" default="Date Of Death" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfDeath" precision="day"  value="${mortalityInstance?.dateOfDeath}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: mortalityInstance, field: 'numberOfHeads', 'error')} required">
	<label for="numberOfHeads">
		<g:message code="mortality.numberOfHeads.label" default="Number Of Heads" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfHeads" type="number" value="${mortalityInstance.numberOfHeads}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: mortalityInstance, field: 'causeOfDeath', 'error')} ">
	<label for="causeOfDeath">
		<g:message code="mortality.causeOfDeath.label" default="Cause Of Death" />
		
	</label>
	<g:textField name="causeOfDeath" value="${mortalityInstance?.causeOfDeath}"/>
</div>

