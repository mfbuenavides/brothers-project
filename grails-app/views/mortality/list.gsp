

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mortality.label', default: 'Mortality')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mortality" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<th><g:message code="mortality.raiser.label" default="Raiser" /></th>
					
						<g:sortableColumn property="dateOfDeath" title="${message(code: 'mortality.dateOfDeath.label', default: 'Date Of Death')}" class="title"/>
					
						<g:sortableColumn property="numberOfHeads" title="${message(code: 'mortality.numberOfHeads.label', default: 'Number Of Heads')}" class="title"/>
					
						<g:sortableColumn property="causeOfDeath" title="${message(code: 'mortality.causeOfDeath.label', default: 'Cause Of Death')}" class="title"/>
					
						<th><g:message code="mortality.initialCapital.label" default="Initial Capital" /></th>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${mortalityInstanceList}" status="i" var="mortalityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: mortalityInstance, field: "raiser")}</td>
					
						<td><g:formatDate format="MMM dd, yyyy" date="${mortalityInstance.dateOfDeath}" /></td>
					
						<td>${fieldValue(bean: mortalityInstance, field: "numberOfHeads")}</td>
					
						<td>${fieldValue(bean: mortalityInstance, field: "causeOfDeath")}</td>
					
						<td>${fieldValue(bean: mortalityInstance, field: "initialCapital")}</td>
					
					<td> <g:link action="edit" id="${mortalityInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mortalityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
