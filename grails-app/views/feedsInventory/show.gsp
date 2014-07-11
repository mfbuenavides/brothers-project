

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feedsInventory.label', default: 'FeedsInventory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-feedsInventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-feedsInventory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list feedsInventory">
			
				<g:if test="${feedsInventoryInstance?.raiser}">
				<li class="fieldcontain">
					<span id="raiser-label" class="property-label"><g:message code="feedsInventory.raiser.label" default="Raiser" /></span>
					
						<span class="property-value" aria-labelledby="raiser-label"><g:link controller="raiser" action="show" id="${feedsInventoryInstance?.raiser?.id}">${feedsInventoryInstance?.raiser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${feedsInventoryInstance?.invoiceNumber}">
				<li class="fieldcontain">
					<span id="invoiceNumber-label" class="property-label"><g:message code="feedsInventory.invoiceNumber.label" default="Invoice Number" /></span>
					
						<span class="property-value" aria-labelledby="invoiceNumber-label"><g:fieldValue bean="${feedsInventoryInstance}" field="invoiceNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${feedsInventoryInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="feedsInventory.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${feedsInventoryInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${feedsInventoryInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="feedsInventory.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${feedsInventoryInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${feedsInventoryInstance?.truckingPerBag}">
				<li class="fieldcontain">
					<span id="truckingPerBag-label" class="property-label"><g:message code="feedsInventory.truckingPerBag.label" default="Trucking Per Bag" /></span>
					
						<span class="property-value" aria-labelledby="truckingPerBag-label"><g:fieldValue bean="${feedsInventoryInstance}" field="truckingPerBag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${feedsInventoryInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="feedsInventory.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${feedsInventoryInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${feedsInventoryInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="feedsInventory.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${feedsInventoryInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${feedsInventoryInstance?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="feedsInventory.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${feedsInventoryInstance}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${feedsInventoryInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="feedsInventory.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${feedsInventoryInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${feedsInventoryInstance?.truckingCost}">
				<li class="fieldcontain">
					<span id="truckingCost-label" class="property-label"><g:message code="feedsInventory.truckingCost.label" default="Trucking Cost" /></span>
					
						<span class="property-value" aria-labelledby="truckingCost-label"><g:fieldValue bean="${feedsInventoryInstance}" field="truckingCost"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${feedsInventoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${feedsInventoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
