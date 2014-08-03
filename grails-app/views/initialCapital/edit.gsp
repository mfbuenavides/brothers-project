
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'initialCapital.label', default: 'InitialCapital')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:javascript src="form/update.js" />
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list button tiny radius" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-initialCapital" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			<g:form method="post" >
				<g:hiddenField name="id" value="${initialCapitalInstance?.id}" />
				<g:hiddenField name="version" value="${initialCapitalInstance?.version}" />

					<g:render template="form"/>
					<g:actionSubmit id="create" class="save  button radius" action="update" disabled="false" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete  button radius" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

			</g:form>
				<a id="update-form" name="update-form" class="save button radius" onclick="updateform(${priceSetting?.pricePerInitialTenKg}, ${priceSetting?.priceSucceedingKg})">Update Form</a>
		</div>
	</body>
</html>
