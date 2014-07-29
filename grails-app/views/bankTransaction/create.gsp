
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankTransaction.label', default: 'BankTransaction')}" />
		<title>  New Bank Transaction </title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home  button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list button tiny radius" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-bankTransaction" class="content scaffold-create" role="main">
			<h1>  New Bank Transaction </h1>
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
			<g:form action="save" >									
					<g:render template="form"/>				
					<g:submitButton name="create" class="save button radius" value="${message(code: 'default.button.create.label', default: 'Create')}" />				
			</g:form>
		</div>
	</body>
</html>
