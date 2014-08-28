

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feedsInventory.label', default: 'FeedsInventory')}" />
		<title> Feeds Inventory List </title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"> New Feeds </g:link></li>
			</ul>
		</div>
		<div id="list-feedsInventory" class="content scaffold-list" role="main">
			<h1> Feeds Inventory List  	</h1>
			<g:if test="${flash.message}">
			<div class="message info radius-misc" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="invoiceNumber" title="${message(code: 'feedsInventory.invoiceNumber.label', default: 'Invoice Number')}" class="title"/>
					
						<g:sortableColumn property="date" title="${message(code: 'feedsInventory.date.label', default: 'Date')}" class="title"/>
					
						<g:sortableColumn property="quantity" title="${message(code: 'feedsInventory.quantity.label', default: 'Quantity')}" class="title"/>
					
						<g:sortableColumn property="truckingPerBag" title="${message(code: 'feedsInventory.truckingPerBag.label', default: 'Trucking Per Bag')}" class="title"/>
					
						<g:sortableColumn property="price" title="${message(code: 'feedsInventory.price.label', default: 'Price')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${feedsInventoryInstanceList}" status="i" var="feedsInventoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: feedsInventoryInstance, field: "invoiceNumber")}</td>
					
						<td><g:formatDate format="MMM dd, yyyy" date="${feedsInventoryInstance.date}" /></td>
					
						<td>${fieldValue(bean: feedsInventoryInstance, field: "quantity")}</td>
					
						<td>${fieldValue(bean: feedsInventoryInstance, field: "truckingPerBag")}</td>
					
						<td>${fieldValue(bean: feedsInventoryInstance, field: "price")}</td>
					
					<td> <g:link action="edit" id="${feedsInventoryInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
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
