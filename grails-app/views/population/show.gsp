

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'population.label', default: 'Population')}" />
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
		<div id="show-population" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list population">
			
				<g:if test="${populationInstance?.raiser}">
				<li class="fieldcontain">
					<span id="raiser-label" class="property-label"><g:message code="population.raiser.label" default="Raiser" /></span>
					
						<span class="property-value" aria-labelledby="raiser-label"><g:link controller="raiser" action="show" id="${populationInstance?.raiser?.id}">${populationInstance?.raiser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${populationInstance?.numberOfPiglets}">
				<li class="fieldcontain">
					<span id="numberOfPiglets-label" class="property-label"><g:message code="population.numberOfPiglets.label" default="Number Of Piglets" /></span>
					
						<span class="property-value" aria-labelledby="numberOfPiglets-label"><g:fieldValue bean="${populationInstance}" field="numberOfPiglets"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${populationInstance?.deliveryDate}">
				<li class="fieldcontain">
					<span id="deliveryDate-label" class="property-label"><g:message code="population.deliveryDate.label" default="Delivery Date" /></span>
					
						<span class="property-value" aria-labelledby="deliveryDate-label"><g:formatDate date="${populationInstance?.deliveryDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${populationInstance?.pigletSource}">
				<li class="fieldcontain">
					<span id="pigletSource-label" class="property-label"><g:message code="population.pigletSource.label" default="Piglet Source" /></span>
					
						<span class="property-value" aria-labelledby="pigletSource-label"><g:fieldValue bean="${populationInstance}" field="pigletSource"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${populationInstance?.mortalities}">
				<li class="fieldcontain">
					<span id="mortalities-label" class="property-label"><g:message code="population.mortalities.label" default="Mortalities" /></span>
					
						<g:each in="${populationInstance.mortalities}" var="m">
						<span class="property-value" aria-labelledby="mortalities-label"><g:link controller="mortality" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${populationInstance?.sales}">
				<li class="fieldcontain">
					<span id="sales-label" class="property-label"><g:message code="population.sales.label" default="Sales" /></span>
					
						<g:each in="${populationInstance.sales}" var="s">
						<span class="property-value" aria-labelledby="sales-label"><g:link controller="sales" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>			
				<g:hiddenField name="id" value="${populationInstance?.id}" />
				<g:link class="edit button radius" action="edit" id="${populationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete button radius" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />			
			</g:form>
		</div>
	</body>
</html>
