

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'priceSetting.label', default: 'PriceSetting')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list button tiny radius" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-priceSetting" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list priceSetting">
			
				<g:if test="${priceSettingInstance?.pricePerInitialTenKg}">
				<li class="fieldcontain">
					<span id="pricePerInitialTenKg-label" class="property-label"><g:message code="priceSetting.pricePerInitialTenKg.label" default="Price Per Initial Ten Kg" /></span>
					
						<span class="property-value" aria-labelledby="pricePerInitialTenKg-label"><g:fieldValue bean="${priceSettingInstance}" field="pricePerInitialTenKg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${priceSettingInstance?.priceSuccceedingKg}">
				<li class="fieldcontain">
					<span id="priceSuccceedingKg-label" class="property-label"><g:message code="priceSetting.priceSuccceedingKg.label" default="Price Succceeding Kg" /></span>
					
						<span class="property-value" aria-labelledby="priceSuccceedingKg-label"><g:fieldValue bean="${priceSettingInstance}" field="priceSuccceedingKg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${priceSettingInstance?.effectivityDate}">
				<li class="fieldcontain">
					<span id="effectivityDate-label" class="property-label"><g:message code="priceSetting.effectivityDate.label" default="Effectivity Date" /></span>
					
						<span class="property-value" aria-labelledby="effectivityDate-label"><g:formatDate date="${priceSettingInstance?.effectivityDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>			
				<g:hiddenField name="id" value="${priceSettingInstance?.id}" />
				<g:link class="edit button radius" action="edit" id="${priceSettingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete button radius" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />			
			</g:form>
		</div>
	</body>
</html>
