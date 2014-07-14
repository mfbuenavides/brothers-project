

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'raiser.label', default: 'Raiser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-raiser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-raiser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'raiser.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'raiser.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="batchNumber" title="${message(code: 'raiser.batchNumber.label', default: 'Batch Number')}" />
					
						<g:sortableColumn property="dateStarted" title="${message(code: 'raiser.dateStarted.label', default: 'Date Started')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${raiserInstanceList}" status="i" var="raiserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${raiserInstance.id}">${fieldValue(bean: raiserInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: raiserInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: raiserInstance, field: "batchNumber")}</td>
					
						<td><g:formatDate date="${raiserInstance.dateStarted}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${raiserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
