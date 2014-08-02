
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'initialCapital.label', default: 'InitialCapital')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript src="form/update.js" />
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home  button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list button tiny radius" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-initialCapital" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${initialCapitalInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${initialCapitalInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >									
					<g:render template="form"/>				
					<g:submitButton id="create" name="create" class="save button radius" disabled="true" value="${message(code: 'default.button.create.label', default: 'Create')}" />				
			</g:form>
					<a id="update-form" name="update-form" onclick="updateform(${priceSetting?.pricePerInitialTenKg}, ${priceSetting?.priceSucceedingKg})">Update Form</a>
		</div>
	</body>
</html>
