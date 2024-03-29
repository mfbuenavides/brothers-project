<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'raiser', 'error')} required">
	<label for="raiser">
		<g:message code="initialCapital.raiser.label" default="Raiser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="raiser" name="raiser.id" from="${Raiser.list()}" optionKey="id" optionValue="${{it.getFullName()}}" required="" value="${initialCapitalInstance?.raiser?.id}" class="many-to-one"/>
</div>
<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'pigSource', 'error')} ">
	<label for="pigSource">
		<g:message code="initialCapital.pigSource.label" default="Pig Source" />
		
	</label>
	<g:textField name="pigSource" maxlength="200" value="${initialCapitalInstance?.pigSource}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'numberOfHeads', 'error')} required">
	<label for="numberOfHeads">
		<g:message code="initialCapital.numberOfHeads.label" default="Number Of Heads" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="numberOfHeads" name="numberOfHeads" type="text" value="${initialCapitalInstance.numberOfHeads}" onkeypress="disablesave()" onchange="disablesave()" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'totalWeight', 'error')} required">
	<label for="totalWeight">
		<g:message code="initialCapital.totalWeight.label" default="Total Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="totalWeight" name="totalWeight" type="text" value="${fieldValue(bean: initialCapitalInstance, field: 'totalWeight')}" onkeypress="disablesave()" onchange="disablesave()" required="" />
</div>

<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'truckingExpenses', 'error')} required">
	<label for="truckingExpenses">
		<g:message code="initialCapital.truckingExpenses.label" default="Trucking Expenses" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="truckingExpenses" name="truckingExpenses" type="text"  value="${fieldValue(bean: initialCapitalInstance, field: 'truckingExpenses')}" onkeypress="disablesave()" onchange="disablesave()" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'dateStarted', 'error')} required">
	<label for="dateStarted">
		<g:message code="initialCapital.dateStarted.label" default="Date Started" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateStarted" precision="day"  value="${initialCapitalInstance?.dateStarted}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'grossAmount', 'error')} required">
	<label for="grossAmount">
		<g:message code="initialCapital.grossAmount.label" default="Gross Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="grossAmount" readonly="readonly" name="grossAmount" type="text"  value="${fieldValue(bean: initialCapitalInstance, field: 'grossAmount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'averageWeight', 'error')} required">
	<label for="averageWeight">
		<g:message code="initialCapital.averageWeight.label" default="Average Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="averageWeight" name="averageWeight" type="text" readonly="readonly" value="${fieldValue(bean: initialCapitalInstance, field: 'averageWeight')}" required=""/>
</div>%{-- 
<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'netAmount', 'error')} required">
	<label for="netAmount">
		<g:message code="initialCapital.netAmount.label" default="Net Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="netAmount" name="netAmount" readonly="readonly" type="text"  value="${fieldValue(bean: initialCapitalInstance, field: 'netAmount')}" required=""/>
</div> --}%
<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'netAmount', 'error')} required">
	<label for="netAmount">
		<g:message code="initialCapital.netAmount.label" default="Net Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="netAmount" name="netAmount" type="text" readonly="readonly" value="${fieldValue(bean: initialCapitalInstance, field: 'netAmount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'averagePrice', 'error')} required">
	<label for="averagePrice">
		<g:message code="initialCapital.averagePrice.label" default="Average Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="averagePrice" name="averagePrice" readonly="readonly" 	type="text"  value="${fieldValue(bean: initialCapitalInstance, field: 'averagePrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'expectedHaulDate', 'error')} required">
	<label for="expectedHaulDate">
		<g:message code="initialCapital.expectedHaulDate.label" default="Expected Haul Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="expectedHaulDate" precision="day"  value="${initialCapitalInstance?.expectedHaulDate}"  />
</div>

<!--div class="fieldcontain ${hasErrors(bean: initialCapitalInstance, field: 'mortalities', 'error')} ">
	<label for="mortalities">
		<g:message code="initialCapital.mortalities.label" default="Mortalities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${initialCapitalInstance?.mortalities?}" var="m">
    <li><g:link controller="mortality" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="mortality" action="create" params="['initialCapital.id': initialCapitalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'mortality.label', default: 'Mortality')])}</g:link>
</li>
</ul-->

</div>


