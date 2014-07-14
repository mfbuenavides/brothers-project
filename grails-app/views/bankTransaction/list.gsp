

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankTransaction.label', default: 'BankTransaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bankTransaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bankTransaction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="date" title="${message(code: 'bankTransaction.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="bank" title="${message(code: 'bankTransaction.bank.label', default: 'Bank')}" />
					
						<g:sortableColumn property="transactionType" title="${message(code: 'bankTransaction.transactionType.label', default: 'Transaction Type')}" />
					
						<g:sortableColumn property="balance" title="${message(code: 'bankTransaction.balance.label', default: 'Balance')}" />
					
						<g:sortableColumn property="checkNumber" title="${message(code: 'bankTransaction.checkNumber.label', default: 'Check Number')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'bankTransaction.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bankTransactionInstanceList}" status="i" var="bankTransactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bankTransactionInstance.id}">${fieldValue(bean: bankTransactionInstance, field: "date")}</g:link></td>
					
						<td>${fieldValue(bean: bankTransactionInstance, field: "bank")}</td>
					
						<td>${fieldValue(bean: bankTransactionInstance, field: "transactionType")}</td>
					
						<td>${fieldValue(bean: bankTransactionInstance, field: "balance")}</td>
					
						<td>${fieldValue(bean: bankTransactionInstance, field: "checkNumber")}</td>
					
						<td>${fieldValue(bean: bankTransactionInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bankTransactionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
