

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'raiser.label', default: 'Raiser')}" />
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
		<div id="show-raiser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list raiser">
			
				<g:if test="${raiserInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="raiser.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${raiserInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raiserInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="raiser.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${raiserInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raiserInstance?.batchNumber}">
				<li class="fieldcontain">
					<span id="batchNumber-label" class="property-label"><g:message code="raiser.batchNumber.label" default="Batch Number" /></span>
					
						<span class="property-value" aria-labelledby="batchNumber-label"><g:fieldValue bean="${raiserInstance}" field="batchNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raiserInstance?.dateStarted}">
				<li class="fieldcontain">
					<span id="dateStarted-label" class="property-label"><g:message code="raiser.dateStarted.label" default="Date Started" /></span>
					
						<span class="property-value" aria-labelledby="dateStarted-label"><g:formatDate date="${raiserInstance?.dateStarted}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>			
				<g:hiddenField name="id" value="${raiserInstance?.id}" />
				<g:link class="edit button radius" action="edit" id="${raiserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete button radius" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />			
			</g:form>
		</div>
	</body>
</html>
