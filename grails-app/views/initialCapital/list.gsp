

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'initialCapital.label', default: 'InitialCapital')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-initialCapital" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message info radius-misc" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>					
						<g:sortableColumn property="raiser" title="${message(code: 'initialCapital.raiser.label', default: 'Raiser')}" class="title"/>
					
						<g:sortableColumn property="priceSetting" title="${message(code: 'initialCapital.priceSetting.label', default: 'Price Setting')}" class="title"/>
					
						<g:sortableColumn property="pigSource" title="${message(code: 'initialCapital.pigSource.label', default: 'Pig Source')}" class="title"/>
					
						<g:sortableColumn property="numberOfHeads" title="${message(code: 'initialCapital.numberOfHeads.label', default: 'Number Of Heads')}" class="title"/>
					
						<g:sortableColumn property="totalWeight" title="${message(code: 'initialCapital.totalWeight.label', default: 'Total Weight')}" class="title"/>
					
						<g:sortableColumn property="truckingExpenses" title="${message(code: 'initialCapital.truckingExpenses.label', default: 'Trucking Expenses')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${initialCapitalInstanceList}" status="i" var="initialCapitalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "raiser.firstName")} 
						${fieldValue(bean: initialCapitalInstance, field: "raiser.lastName")}</td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "priceSetting.pricePerInitialTenKg")} /
						${fieldValue(bean: initialCapitalInstance, field: "priceSetting.priceSucceedingKg")} </td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "pigSource")}</td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "numberOfHeads")}</td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "totalWeight")}</td>
					
						<td>${fieldValue(bean: initialCapitalInstance, field: "truckingExpenses")}</td>
					
					<td> <g:link action="edit" id="${initialCapitalInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
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
