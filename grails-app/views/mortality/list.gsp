

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mortality.label', default: 'Mortality')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mortality" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mortality" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="mortality.raiser.label" default="Raiser" /></th>
					
						<g:sortableColumn property="dateOfDeath" title="${message(code: 'mortality.dateOfDeath.label', default: 'Date Of Death')}" />
					
						<g:sortableColumn property="numberOfHeads" title="${message(code: 'mortality.numberOfHeads.label', default: 'Number Of Heads')}" />
					
						<g:sortableColumn property="causeOfDeath" title="${message(code: 'mortality.causeOfDeath.label', default: 'Cause Of Death')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mortalityInstanceList}" status="i" var="mortalityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mortalityInstance.id}">${fieldValue(bean: mortalityInstance, field: "raiser")}</g:link></td>
					
						<td><g:formatDate date="${mortalityInstance.dateOfDeath}" /></td>
					
						<td>${fieldValue(bean: mortalityInstance, field: "numberOfHeads")}</td>
					
						<td>${fieldValue(bean: mortalityInstance, field: "causeOfDeath")}</td>
					
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
