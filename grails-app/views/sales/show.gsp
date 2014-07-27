

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sales.label', default: 'Sales')}" />
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
		<div id="show-sales" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sales">
			
				<g:if test="${salesInstance?.raiser}">
				<li class="fieldcontain">
					<span id="raiser-label" class="property-label"><g:message code="sales.raiser.label" default="Raiser" /></span>
					
						<span class="property-value" aria-labelledby="raiser-label"><g:link controller="raiser" action="show" id="${salesInstance?.raiser?.id}">${salesInstance?.raiser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesInstance?.dateSold}">
				<li class="fieldcontain">
					<span id="dateSold-label" class="property-label"><g:message code="sales.dateSold.label" default="Date Sold" /></span>
					
						<span class="property-value" aria-labelledby="dateSold-label"><g:formatDate date="${salesInstance?.dateSold}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesInstance?.haulerName}">
				<li class="fieldcontain">
					<span id="haulerName-label" class="property-label"><g:message code="sales.haulerName.label" default="Hauler Name" /></span>
					
						<span class="property-value" aria-labelledby="haulerName-label"><g:fieldValue bean="${salesInstance}" field="haulerName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="sales.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${salesInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="sales.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${salesInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesInstance?.remarks}">
				<li class="fieldcontain">
					<span id="remarks-label" class="property-label"><g:message code="sales.remarks.label" default="Remarks" /></span>
					
						<span class="property-value" aria-labelledby="remarks-label"><g:fieldValue bean="${salesInstance}" field="remarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesInstance?.hogScale}">
				<li class="fieldcontain">
					<span id="hogScale-label" class="property-label"><g:message code="sales.hogScale.label" default="Hog Scale" /></span>
					
						<span class="property-value" aria-labelledby="hogScale-label"><g:fieldValue bean="${salesInstance}" field="hogScale"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="sales.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${salesInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesInstance?.averageWeight}">
				<li class="fieldcontain">
					<span id="averageWeight-label" class="property-label"><g:message code="sales.averageWeight.label" default="Average Weight" /></span>
					
						<span class="property-value" aria-labelledby="averageWeight-label"><g:fieldValue bean="${salesInstance}" field="averageWeight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesInstance?.totalWeight}">
				<li class="fieldcontain">
					<span id="totalWeight-label" class="property-label"><g:message code="sales.totalWeight.label" default="Total Weight" /></span>
					
						<span class="property-value" aria-labelledby="totalWeight-label"><g:fieldValue bean="${salesInstance}" field="totalWeight"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>			
				<g:hiddenField name="id" value="${salesInstance?.id}" />
				<g:link class="edit button radius" action="edit" id="${salesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete button radius" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />			
			</g:form>
		</div>
	</body>
</html>
