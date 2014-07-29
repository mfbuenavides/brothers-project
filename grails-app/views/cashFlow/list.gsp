

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cashFlow.label', default: 'CashFlow')}" />
		<title> Cash Flow List </title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="create button tiny radius" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cashFlow" class="content scaffold-list" role="main">
			<h1> Cash Flow List </h1>
			<g:if test="${flash.message}">
			<div class="message info radius-misc" role="status">${flash.message}</div>
			</g:if>
			<table class="pricing-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="transactionDate" title="${message(code: 'cashFlow.transactionDate.label', default: 'Transaction Date')}" class="title"/>
					
						<g:sortableColumn property="amount" title="${message(code: 'cashFlow.amount.label', default: 'Amount')}" class="title"/>
					
						<g:sortableColumn property="paidTo" title="${message(code: 'cashFlow.paidTo.label', default: 'Paid To')}" class="title"/>
					
						<g:sortableColumn property="remarks" title="${message(code: 'cashFlow.remarks.label', default: 'Remarks')}" class="title"/>
					
						<g:sortableColumn property="source" title="${message(code: 'cashFlow.source.label', default: 'Source')}" class="title"/>
					
						<g:sortableColumn property="mode" title="${message(code: 'cashFlow.mode.label', default: 'Mode')}" class="title"/>
					
					    <g:sortableColumn property="action" title="Action"  class="title"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${cashFlowInstanceList}" status="i" var="cashFlowInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td> <g:formatDate format="MMM dd, yyyy"  date="${cashFlowInstance.transactionDate}" /></td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "paidTo")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "remarks")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "source")}</td>
					
						<td>${fieldValue(bean: cashFlowInstance, field: "mode")}</td>
					
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
