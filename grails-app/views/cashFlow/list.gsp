

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cashFlow.label', default: 'CashFlow')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cashFlow" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="transactionDate" title="${message(code: 'cashFlow.transactionDate.label', default: 'Transaction Date')}" class="title"/>
					
						<g:sortableColumn property="amount" title="${message(code: 'cashFlow.amount.label', default: 'Amount')}" class="title"/>
					
						<g:sortableColumn property="paidFor" title="${message(code: 'cashFlow.paidFor.label', default: 'Paid For')}" class="title"/>
					
						<g:sortableColumn property="remarks" title="${message(code: 'cashFlow.remarks.label', default: 'Remarks')}" class="title"/>
					
						<g:sortableColumn property="source" title="${message(code: 'cashFlow.source.label', default: 'Source')}" class="title"/>
					
						<g:sortableColumn property="mode" title="${message(code: 'cashFlow.mode.label', default: 'Mode')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${cashFlowInstanceList}" status="i" var="cashFlowInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: cashFlowInstance, field: "transactionDate")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "paidFor.name")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "remarks")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "source.name")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "mode.name")}</td>
					
					<td> <g:link action="edit" id="${cashFlowInstance.id}" class="button tiny radius" > View/Edit </g:link> </td>
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
