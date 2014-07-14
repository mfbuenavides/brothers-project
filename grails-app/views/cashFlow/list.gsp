

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cashFlow.label', default: 'CashFlow')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cashFlow" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cashFlow" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="transactionDate" title="${message(code: 'cashFlow.transactionDate.label', default: 'Transaction Date')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'cashFlow.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="paidTo" title="${message(code: 'cashFlow.paidTo.label', default: 'Paid To')}" />
					
						<g:sortableColumn property="remarks" title="${message(code: 'cashFlow.remarks.label', default: 'Remarks')}" />
					
						<g:sortableColumn property="source" title="${message(code: 'cashFlow.source.label', default: 'Source')}" />
					
						<g:sortableColumn property="mode" title="${message(code: 'cashFlow.mode.label', default: 'Mode')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cashFlowInstanceList}" status="i" var="cashFlowInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cashFlowInstance.id}">${fieldValue(bean: cashFlowInstance, field: "transactionDate")}</g:link></td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "paidTo")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "remarks")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "source")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "mode")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cashFlowInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
