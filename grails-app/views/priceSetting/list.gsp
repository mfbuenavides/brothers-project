

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'priceSetting.label', default: 'PriceSetting')}" />
		<title> Price Setting List </title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-priceSetting" class="content scaffold-list" role="main">
			<h1> Price Setting List </h1>
			<g:if test="${flash.message}">
			<div class="message info radius-misc" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="pricePerInitialTenKg" title="${message(code: 'priceSetting.pricePerInitialTenKg.label', default: 'Price Per Initial Ten Kg')}" class="title"/>
					
						<g:sortableColumn property="priceSuccceedingKg" title="${message(code: 'priceSetting.priceSuccceedingKg.label', default: 'Price Succceeding Kg')}" class="title"/>
					
						<g:sortableColumn property="effectivityDate" title="${message(code: 'priceSetting.effectivityDate.label', default: 'Effectivity Date')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${priceSettingInstanceList}" status="i" var="priceSettingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: priceSettingInstance, field: "pricePerInitialTenKg")}</td>
					
						<td>${fieldValue(bean: priceSettingInstance, field: "priceSuccceedingKg")}</td>
					
						<td><g:formatDate format="MMM dd, yyyy" date="${priceSettingInstance.effectivityDate}" /></td>
					
					<td> <g:link action="edit" id="${priceSettingInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${priceSettingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
