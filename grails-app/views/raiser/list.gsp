

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'raiser.label', default: 'Raiser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-raiser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message info radius-misc" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'raiser.firstName.label', default: 'First Name')}" class="title"/>
					
						<g:sortableColumn property="lastName" title="${message(code: 'raiser.lastName.label', default: 'Last Name')}" class="title"/>
					
						<g:sortableColumn property="batchNumber" title="${message(code: 'raiser.batchNumber.label', default: 'Batch Number')}" class="title"/>
					
						<g:sortableColumn property="dateStarted" title="${message(code: 'raiser.dateStarted.label', default: 'Date Started')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${raiserInstanceList}" status="i" var="raiserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: raiserInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: raiserInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: raiserInstance, field: "batchNumber")}</td>
					
						<td><g:formatDate format="MMM dd, yyyy" date="${raiserInstance.dateStarted}" /></td>
					
					<td> <g:link action="edit" id="${raiserInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
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
