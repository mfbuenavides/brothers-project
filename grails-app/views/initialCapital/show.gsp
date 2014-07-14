

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'initialCapital.label', default: 'InitialCapital')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-initialCapital" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-initialCapital" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list initialCapital">
			
				<g:if test="${initialCapitalInstance?.raiser}">
				<li class="fieldcontain">
					<span id="raiser-label" class="property-label"><g:message code="initialCapital.raiser.label" default="Raiser" /></span>
					
						<span class="property-value" aria-labelledby="raiser-label"><g:link controller="raiser" action="show" id="${initialCapitalInstance?.raiser?.id}">${initialCapitalInstance?.raiser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.priceSetting}">
				<li class="fieldcontain">
					<span id="priceSetting-label" class="property-label"><g:message code="initialCapital.priceSetting.label" default="Price Setting" /></span>
					
						<span class="property-value" aria-labelledby="priceSetting-label"><g:link controller="priceSetting" action="show" id="${initialCapitalInstance?.priceSetting?.id}">${initialCapitalInstance?.priceSetting?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.pigSource}">
				<li class="fieldcontain">
					<span id="pigSource-label" class="property-label"><g:message code="initialCapital.pigSource.label" default="Pig Source" /></span>
					
						<span class="property-value" aria-labelledby="pigSource-label"><g:fieldValue bean="${initialCapitalInstance}" field="pigSource"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.numberOfHeads}">
				<li class="fieldcontain">
					<span id="numberOfHeads-label" class="property-label"><g:message code="initialCapital.numberOfHeads.label" default="Number Of Heads" /></span>
					
						<span class="property-value" aria-labelledby="numberOfHeads-label"><g:fieldValue bean="${initialCapitalInstance}" field="numberOfHeads"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.totalWeight}">
				<li class="fieldcontain">
					<span id="totalWeight-label" class="property-label"><g:message code="initialCapital.totalWeight.label" default="Total Weight" /></span>
					
						<span class="property-value" aria-labelledby="totalWeight-label"><g:fieldValue bean="${initialCapitalInstance}" field="totalWeight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.truckingExpenses}">
				<li class="fieldcontain">
					<span id="truckingExpenses-label" class="property-label"><g:message code="initialCapital.truckingExpenses.label" default="Trucking Expenses" /></span>
					
						<span class="property-value" aria-labelledby="truckingExpenses-label"><g:fieldValue bean="${initialCapitalInstance}" field="truckingExpenses"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.dateStarted}">
				<li class="fieldcontain">
					<span id="dateStarted-label" class="property-label"><g:message code="initialCapital.dateStarted.label" default="Date Started" /></span>
					
						<span class="property-value" aria-labelledby="dateStarted-label"><g:formatDate date="${initialCapitalInstance?.dateStarted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.grossAmount}">
				<li class="fieldcontain">
					<span id="grossAmount-label" class="property-label"><g:message code="initialCapital.grossAmount.label" default="Gross Amount" /></span>
					
						<span class="property-value" aria-labelledby="grossAmount-label"><g:fieldValue bean="${initialCapitalInstance}" field="grossAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.averageWeight}">
				<li class="fieldcontain">
					<span id="averageWeight-label" class="property-label"><g:message code="initialCapital.averageWeight.label" default="Average Weight" /></span>
					
						<span class="property-value" aria-labelledby="averageWeight-label"><g:fieldValue bean="${initialCapitalInstance}" field="averageWeight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.netAmount}">
				<li class="fieldcontain">
					<span id="netAmount-label" class="property-label"><g:message code="initialCapital.netAmount.label" default="Net Amount" /></span>
					
						<span class="property-value" aria-labelledby="netAmount-label"><g:fieldValue bean="${initialCapitalInstance}" field="netAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.averagePrice}">
				<li class="fieldcontain">
					<span id="averagePrice-label" class="property-label"><g:message code="initialCapital.averagePrice.label" default="Average Price" /></span>
					
						<span class="property-value" aria-labelledby="averagePrice-label"><g:fieldValue bean="${initialCapitalInstance}" field="averagePrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initialCapitalInstance?.expectedHaulDate}">
				<li class="fieldcontain">
					<span id="expectedHaulDate-label" class="property-label"><g:message code="initialCapital.expectedHaulDate.label" default="Expected Haul Date" /></span>
					
						<span class="property-value" aria-labelledby="expectedHaulDate-label"><g:formatDate date="${initialCapitalInstance?.expectedHaulDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${initialCapitalInstance?.id}" />
					<g:link class="edit" action="edit" id="${initialCapitalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
