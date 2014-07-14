

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mortality.label', default: 'Mortality')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mortality" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mortality" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mortality">
			
				<g:if test="${mortalityInstance?.raiser}">
				<li class="fieldcontain">
					<span id="raiser-label" class="property-label"><g:message code="mortality.raiser.label" default="Raiser" /></span>
					
						<span class="property-value" aria-labelledby="raiser-label"><g:link controller="raiser" action="show" id="${mortalityInstance?.raiser?.id}">${mortalityInstance?.raiser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${mortalityInstance?.dateOfDeath}">
				<li class="fieldcontain">
					<span id="dateOfDeath-label" class="property-label"><g:message code="mortality.dateOfDeath.label" default="Date Of Death" /></span>
					
						<span class="property-value" aria-labelledby="dateOfDeath-label"><g:formatDate date="${mortalityInstance?.dateOfDeath}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${mortalityInstance?.numberOfHeads}">
				<li class="fieldcontain">
					<span id="numberOfHeads-label" class="property-label"><g:message code="mortality.numberOfHeads.label" default="Number Of Heads" /></span>
					
						<span class="property-value" aria-labelledby="numberOfHeads-label"><g:fieldValue bean="${mortalityInstance}" field="numberOfHeads"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mortalityInstance?.causeOfDeath}">
				<li class="fieldcontain">
					<span id="causeOfDeath-label" class="property-label"><g:message code="mortality.causeOfDeath.label" default="Cause Of Death" /></span>
					
						<span class="property-value" aria-labelledby="causeOfDeath-label"><g:fieldValue bean="${mortalityInstance}" field="causeOfDeath"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${mortalityInstance?.id}" />
					<g:link class="edit" action="edit" id="${mortalityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
