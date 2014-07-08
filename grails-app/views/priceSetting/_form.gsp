<div class="fieldcontain ${hasErrors(bean: priceSettingInstance, field: 'pricePerInitialTenKg', 'error')} required">
	<label for="pricePerInitialTenKg">
		<g:message code="priceSetting.pricePerInitialTenKg.label" default="Price Per Initial Ten Kg" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pricePerInitialTenKg" value="${fieldValue(bean: priceSettingInstance, field: 'pricePerInitialTenKg')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: priceSettingInstance, field: 'priceSuccceedingKg', 'error')} required">
	<label for="priceSuccceedingKg">
		<g:message code="priceSetting.priceSuccceedingKg.label" default="Price Succceeding Kg" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="priceSuccceedingKg" value="${fieldValue(bean: priceSettingInstance, field: 'priceSuccceedingKg')}" required=""/>
</div>

