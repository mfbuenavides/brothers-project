

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicineInventory.label', default: 'MedicineInventory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-medicineInventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-medicineInventory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list medicineInventory">
			
				<g:if test="${medicineInventoryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="medicineInventory.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${medicineInventoryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicineInventoryInstance?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="medicineInventory.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${medicineInventoryInstance}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicineInventoryInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="medicineInventory.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:fieldValue bean="${medicineInventoryInstance}" field="cost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicineInventoryInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="medicineInventory.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${medicineInventoryInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicineInventoryInstance?.medicineType}">
				<li class="fieldcontain">
					<span id="medicineType-label" class="property-label"><g:message code="medicineInventory.medicineType.label" default="Medicine Type" /></span>
					
						<span class="property-value" aria-labelledby="medicineType-label"><g:fieldValue bean="${medicineInventoryInstance}" field="medicineType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${medicineInventoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${medicineInventoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
