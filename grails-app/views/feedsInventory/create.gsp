
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feedsInventory.label', default: 'FeedsInventory')}" />
		<title> New Feeds </title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home  button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list button tiny radius" action="list"> Feeds Inventory List </g:link></li>
			</ul>
		</div>
		<div id="create-feedsInventory" class="content scaffold-create" role="main">
			<h1> New Feeds </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${feedsInventoryInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${feedsInventoryInstance}" var="error">
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
