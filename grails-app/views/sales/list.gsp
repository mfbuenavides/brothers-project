

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sales.label', default: 'Sales')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sales" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sales" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="sales.raiser.label" default="Raiser" /></th>
					
						<g:sortableColumn property="dateSold" title="${message(code: 'sales.dateSold.label', default: 'Date Sold')}" />
					
						<g:sortableColumn property="haulerName" title="${message(code: 'sales.haulerName.label', default: 'Hauler Name')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'sales.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'sales.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="remarks" title="${message(code: 'sales.remarks.label', default: 'Remarks')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${salesInstanceList}" status="i" var="salesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${salesInstance.id}">${fieldValue(bean: salesInstance, field: "raiser")}</g:link></td>
					
						<td><g:formatDate date="${salesInstance.dateSold}" /></td>
					
						<td>${fieldValue(bean: salesInstance, field: "haulerName")}</td>
					
						<td>${fieldValue(bean: salesInstance, field: "quantity")}</td>
					
						<td>${fieldValue(bean: salesInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: salesInstance, field: "remarks")}</td>
					
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
