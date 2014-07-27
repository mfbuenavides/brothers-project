



<div class="fieldcontain ${hasErrors(bean: populationInstance, field: 'raiser', 'error')} required">
	<label for="raiser">
		<g:message code="population.raiser.label" default="Raiser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="raiser" name="raiser.id" from="${Raiser.list()}" optionKey="id" required="" value="${populationInstance?.raiser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: populationInstance, field: 'numberOfPiglets', 'error')} required">
	<label for="numberOfPiglets">
		<g:message code="population.numberOfPiglets.label" default="Number Of Piglets" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfPiglets" type="number" value="${populationInstance.numberOfPiglets}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: populationInstance, field: 'deliveryDate', 'error')} required">
	<label for="deliveryDate">
		<g:message code="population.deliveryDate.label" default="Delivery Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="deliveryDate" precision="day"  value="${populationInstance?.deliveryDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: populationInstance, field: 'pigletSource', 'error')} required">
	<label for="pigletSource">
		<g:message code="population.pigletSource.label" default="Piglet Source" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pigletSource" required="" value="${populationInstance?.pigletSource}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: populationInstance, field: 'mortalities', 'error')} ">
	<label for="mortalities">
		<g:message code="population.mortalities.label" default="Mortalities" />
		
	</label>
	<g:select name="mortalities" from="${Mortality.list()}" multiple="multiple" optionKey="id" size="5" value="${populationInstance?.mortalities*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: populationInstance, field: 'sales', 'error')} ">
	<label for="sales">
		<g:message code="population.sales.label" default="Sales" />
		
	</label>
	<g:select name="sales" from="${Sales.list()}" multiple="multiple" optionKey="id" size="5" value="${populationInstance?.sales*.id}" class="many-to-many"/>
</div>

