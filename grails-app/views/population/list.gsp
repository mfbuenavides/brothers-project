

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'population.label', default: 'Population')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-population" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<th><g:message code="population.raiser.label" default="Raiser" /></th>
					
						<g:sortableColumn property="numberOfPiglets" title="${message(code: 'population.numberOfPiglets.label', default: 'Number Of Piglets')}" class="title"/>
					
						<g:sortableColumn property="deliveryDate" title="${message(code: 'population.deliveryDate.label', default: 'Delivery Date')}" class="title"/>
					
						<g:sortableColumn property="pigletSource" title="${message(code: 'population.pigletSource.label', default: 'Piglet Source')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${populationInstanceList}" status="i" var="populationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: populationInstance, field: "raiser")}</td>
					
						<td>${fieldValue(bean: populationInstance, field: "numberOfPiglets")}</td>
					
						<td><g:formatDate format="MMM dd, yyyy" date="${populationInstance.deliveryDate}" /></td>
					
						<td>${fieldValue(bean: populationInstance, field: "pigletSource")}</td>
					
					<td> <g:link action="edit" id="${populationInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${populationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
