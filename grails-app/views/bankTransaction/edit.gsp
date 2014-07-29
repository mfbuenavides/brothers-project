
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankTransaction.label', default: 'BankTransaction')}" />
		<title> Edit Bank Transaction </title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list button tiny radius" action="list"> Bank Transaction List </g:link>
				<g:link class="create button tiny radius" action="create"> New Bank Transaction </g:link></li>
			</ul>
		</div>
		<div id="edit-bankTransaction" class="content scaffold-edit" role="main">
			<h1> Edit Bank Transaction </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${bankTransactionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${bankTransactionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${bankTransactionInstance?.id}" />
				<g:hiddenField name="version" value="${bankTransactionInstance?.version}" />

					<g:render template="form"/>
					<g:actionSubmit class="save  button radius" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete  button radius" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

			</g:form>
		</div>
	</body>
</html>
