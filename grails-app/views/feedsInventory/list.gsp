

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feedsInventory.label', default: 'FeedsInventory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-feedsInventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-feedsInventory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="feedsInventory.raiser.label" default="Raiser" /></th>
					
						<g:sortableColumn property="invoiceNumber" title="${message(code: 'feedsInventory.invoiceNumber.label', default: 'Invoice Number')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'feedsInventory.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'feedsInventory.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="truckingPerBag" title="${message(code: 'feedsInventory.truckingPerBag.label', default: 'Trucking Per Bag')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'feedsInventory.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${feedsInventoryInstanceList}" status="i" var="feedsInventoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${feedsInventoryInstance.id}">${fieldValue(bean: feedsInventoryInstance, field: "raiser")}</g:link></td>
					
						<td>${fieldValue(bean: feedsInventoryInstance, field: "invoiceNumber")}</td>
					
						<td><g:formatDate date="${feedsInventoryInstance.date}" /></td>
					
						<td>${fieldValue(bean: feedsInventoryInstance, field: "quantity")}</td>
					
						<td>${fieldValue(bean: feedsInventoryInstance, field: "truckingPerBag")}</td>
					
						<td>${fieldValue(bean: feedsInventoryInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${feedsInventoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
