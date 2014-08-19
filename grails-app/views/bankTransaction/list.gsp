

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankTransaction.label', default: 'BankTransaction')}" />
		<title>Bank Transaction List</title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"> New Bank Transaction </g:link></li>
			</ul>
		</div>
		<div id="list-bankTransaction" class="content scaffold-list" role="main">
			<h1>Bank Transaction List</h1>
			<g:if test="${flash.message}">
			<div class="message info radius-misc" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="date" title="${message(code: 'bankTransaction.date.label', default: 'Date')}" class="title"/>
					
						<g:sortableColumn property="bank" title="${message(code: 'bankTransaction.bank.label', default: 'Bank')}" class="title"/>
					
						<g:sortableColumn property="transactionType" title="${message(code: 'bankTransaction.transactionType.label', default: 'Transaction Type')}" class="title"/>
					
						<g:sortableColumn property="balance" title="${message(code: 'bankTransaction.balance.label', default: 'Balance')}" class="title"/>
					
						<g:sortableColumn property="checkNumber" title="${message(code: 'bankTransaction.checkNumber.label', default: 'Check Number')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${bankTransactionInstanceList}" status="i" var="bankTransactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td> <g:formatDate format="MMM dd, yyyy" date="${bankTransactionInstance.date}" /></td>
					
						<td>${fieldValue(bean: bankTransactionInstance, field: "bank.name")}</td>
					
						<td>${fieldValue(bean: bankTransactionInstance, field: "transactionType.name")}</td>
					
						<td>${fieldValue(bean: bankTransactionInstance, field: "balance")}</td>
					
						<td>${fieldValue(bean: bankTransactionInstance, field: "checkNumber")}</td>
					
					<td> <g:link action="edit" id="${bankTransactionInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
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
