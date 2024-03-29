

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-account" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'account.username.label', default: 'Username')}" class="title"/>
					
						<g:sortableColumn property="password" title="${message(code: 'account.password.label', default: 'Password')}" class="title"/>
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'account.accountExpired.label', default: 'Account Expired')}" class="title"/>
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'account.accountLocked.label', default: 'Account Locked')}" class="title"/>
					
						<g:sortableColumn property="enabled" title="${message(code: 'account.enabled.label', default: 'Enabled')}" class="title"/>
					
						<g:sortableColumn property="passwordExpired" title="${message(code: 'account.passwordExpired.label', default: 'Password Expired')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${accountInstanceList}" status="i" var="accountInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: accountInstance, field: "username")}</td>
					
						<td>${fieldValue(bean: accountInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${accountInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${accountInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${accountInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${accountInstance.passwordExpired}" /></td>
					
					<td> <g:link action="edit" id="${accountInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${accountInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
