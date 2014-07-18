

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cashFlow.label', default: 'CashFlow')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cashFlow" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cashFlow" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cashFlow">
			
				<g:if test="${cashFlowInstance?.transactionDate}">
				<li class="fieldcontain">
					<span id="transactionDate-label" class="property-label"><g:message code="cashFlow.transactionDate.label" default="Transaction Date" /></span>
					
						<span class="property-value" aria-labelledby="transactionDate-label"><g:formatDate date="${cashFlowInstance?.transactionDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cashFlowInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="cashFlow.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${cashFlowInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cashFlowInstance?.paidTo}">
				<li class="fieldcontain">
					<span id="paidTo-label" class="property-label"><g:message code="cashFlow.paidTo.label" default="Paid To" /></span>
					
						<span class="property-value" aria-labelledby="paidTo-label"><g:fieldValue bean="${cashFlowInstance}" field="paidTo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cashFlowInstance?.remarks}">
				<li class="fieldcontain">
					<span id="remarks-label" class="property-label"><g:message code="cashFlow.remarks.label" default="Remarks" /></span>
					
						<span class="property-value" aria-labelledby="remarks-label"><g:fieldValue bean="${cashFlowInstance}" field="remarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cashFlowInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="cashFlow.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${cashFlowInstance}" field="source"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cashFlowInstance?.mode}">
				<li class="fieldcontain">
					<span id="mode-label" class="property-label"><g:message code="cashFlow.mode.label" default="Mode" /></span>
					
						<span class="property-value" aria-labelledby="mode-label"><g:fieldValue bean="${cashFlowInstance}" field="mode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cashFlowInstance?.id}" />
					<g:link class="edit" action="edit" id="${cashFlowInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>