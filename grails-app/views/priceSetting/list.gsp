

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'priceSetting.label', default: 'PriceSetting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-priceSetting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-priceSetting" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="pricePerInitialTenKg" title="${message(code: 'priceSetting.pricePerInitialTenKg.label', default: 'Price Per Initial Ten Kg')}" />
					
						<g:sortableColumn property="priceSuccceedingKg" title="${message(code: 'priceSetting.priceSuccceedingKg.label', default: 'Price Succceeding Kg')}" />
					
						<g:sortableColumn property="effectivityDate" title="${message(code: 'priceSetting.effectivityDate.label', default: 'Effectivity Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${priceSettingInstanceList}" status="i" var="priceSettingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${priceSettingInstance.id}">${fieldValue(bean: priceSettingInstance, field: "pricePerInitialTenKg")}</g:link></td>
					
						<td>${fieldValue(bean: priceSettingInstance, field: "priceSuccceedingKg")}</td>
					
						<td><g:formatDate date="${priceSettingInstance.effectivityDate}" /></td>
					
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
