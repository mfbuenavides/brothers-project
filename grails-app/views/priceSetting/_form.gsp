



<div class="fieldcontain ${hasErrors(bean: priceSettingInstance, field: 'pricePerInitialTenKg', 'error')} required">
	<label for="pricePerInitialTenKg">
		<g:message code="priceSetting.pricePerInitialTenKg.label" default="Price Per Initial Ten Kg" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pricePerInitialTenKg" type="text" value="${fieldValue(bean: priceSettingInstance, field: 'pricePerInitialTenKg')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: priceSettingInstance, field: 'priceSuccceedingKg', 'error')} required">
	<label for="priceSuccceedingKg">
		<g:message code="priceSetting.priceSuccceedingKg.label" default="Price Succceeding Kg" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="priceSucceedingKg"  type="text" value="${fieldValue(bean: priceSettingInstance, field: 'priceSucceedingKg')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: priceSettingInstance, field: 'effectivityDate', 'error')} ">
	<label for="effectivityDate">
		<g:message code="priceSetting.effectivityDate.label" default="Effectivity Date" />
		
	</label>
	<g:datePicker name="effectivityDate" precision="day"  value="${priceSettingInstance?.effectivityDate}" default="none" noSelection="['': '']" />
</div>

