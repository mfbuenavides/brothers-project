

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'initialCapital.label', default: 'InitialCapital')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-initialCapital" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-initialCapital" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="initialCapital.raiser.label" default="Raiser" /></th>
					
						<th><g:message code="initialCapital.priceSetting.label" default="Price Setting" /></th>
					
						<g:sortableColumn property="pigSource" title="${message(code: 'initialCapital.pigSource.label', default: 'Pig Source')}" />
					
						<g:sortableColumn property="numberOfHeads" title="${message(code: 'initialCapital.numberOfHeads.label', default: 'Number Of Heads')}" />
					
						<g:sortableColumn property="totalWeight" title="${message(code: 'initialCapital.totalWeight.label', default: 'Total Weight')}" />
					
						<g:sortableColumn property="truckingExpenses" title="${message(code: 'initialCapital.truckingExpenses.label', default: 'Trucking Expenses')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${initialCapitalInstanceList}" status="i" var="initialCapitalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${initialCapitalInstance.id}">${fieldValue(bean: initialCapitalInstance, field: "raiser")}</g:link></td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "priceSetting")}</td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "pigSource")}</td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "numberOfHeads")}</td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "totalWeight")}</td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "truckingExpenses")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${initialCapitalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
