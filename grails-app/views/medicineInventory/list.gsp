

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicineInventory.label', default: 'MedicineInventory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-medicineInventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-medicineInventory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'medicineInventory.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="unit" title="${message(code: 'medicineInventory.unit.label', default: 'Unit')}" />
					
						<g:sortableColumn property="cost" title="${message(code: 'medicineInventory.cost.label', default: 'Cost')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'medicineInventory.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="medicineType" title="${message(code: 'medicineInventory.medicineType.label', default: 'Medicine Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${medicineInventoryInstanceList}" status="i" var="medicineInventoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${medicineInventoryInstance.id}">${fieldValue(bean: medicineInventoryInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: medicineInventoryInstance, field: "unit")}</td>
					
						<td>${fieldValue(bean: medicineInventoryInstance, field: "cost")}</td>
					
						<td>${fieldValue(bean: medicineInventoryInstance, field: "quantity")}</td>
					
						<td>${fieldValue(bean: medicineInventoryInstance, field: "medicineType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medicineInventoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
