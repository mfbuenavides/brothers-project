

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sales.label', default: 'Sales')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sales" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="raiser" title="${message(code: 'sales.raiser.label', default: 'Raiser')}" class="title"/>
						
						<g:sortableColumn property="dateSold" title="${message(code: 'sales.dateSold.label', default: 'Date Sold')}" class="title"/>
					
						<g:sortableColumn property="haulerName" title="${message(code: 'sales.haulerName.label', default: 'Hauler Name')}" class="title"/>
					
						<g:sortableColumn property="quantity" title="${message(code: 'sales.quantity.label', default: 'Quantity')}" class="title"/>
					
						<g:sortableColumn property="amount" title="${message(code: 'sales.amount.label', default: 'Amount')}" class="title"/>
					
						<g:sortableColumn property="remarks" title="${message(code: 'sales.remarks.label', default: 'Remarks')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${salesInstanceList}" status="i" var="salesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: salesInstance, field: "raiser")}</td>
					
						<td><g:formatDate format="MMM dd, yyyy" date="${salesInstance.dateSold}" /></td>
					
						<td>${fieldValue(bean: salesInstance, field: "haulerName")}</td>
					
						<td>${fieldValue(bean: salesInstance, field: "quantity")}</td>
					
						<td>${fieldValue(bean: salesInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: salesInstance, field: "remarks")}</td>
					
					<td> <g:link action="edit" id="${salesInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${salesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
