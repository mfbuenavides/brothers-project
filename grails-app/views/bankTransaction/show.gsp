

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankTransaction.label', default: 'BankTransaction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bankTransaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bankTransaction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bankTransaction">
			
				<g:if test="${bankTransactionInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="bankTransaction.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${bankTransactionInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankTransactionInstance?.bank}">
				<li class="fieldcontain">
					<span id="bank-label" class="property-label"><g:message code="bankTransaction.bank.label" default="Bank" /></span>
					
						<span class="property-value" aria-labelledby="bank-label"><g:fieldValue bean="${bankTransactionInstance}" field="bank"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankTransactionInstance?.transactionType}">
				<li class="fieldcontain">
					<span id="transactionType-label" class="property-label"><g:message code="bankTransaction.transactionType.label" default="Transaction Type" /></span>
					
						<span class="property-value" aria-labelledby="transactionType-label"><g:fieldValue bean="${bankTransactionInstance}" field="transactionType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankTransactionInstance?.balance}">
				<li class="fieldcontain">
					<span id="balance-label" class="property-label"><g:message code="bankTransaction.balance.label" default="Balance" /></span>
					
						<span class="property-value" aria-labelledby="balance-label"><g:fieldValue bean="${bankTransactionInstance}" field="balance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankTransactionInstance?.checkNumber}">
				<li class="fieldcontain">
					<span id="checkNumber-label" class="property-label"><g:message code="bankTransaction.checkNumber.label" default="Check Number" /></span>
					
						<span class="property-value" aria-labelledby="checkNumber-label"><g:fieldValue bean="${bankTransactionInstance}" field="checkNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankTransactionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="bankTransaction.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${bankTransactionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankTransactionInstance?.transactionWith}">
				<li class="fieldcontain">
					<span id="transactionWith-label" class="property-label"><g:message code="bankTransaction.transactionWith.label" default="Transaction With" /></span>
					
						<span class="property-value" aria-labelledby="transactionWith-label"><g:fieldValue bean="${bankTransactionInstance}" field="transactionWith"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankTransactionInstance?.mode}">
				<li class="fieldcontain">
					<span id="mode-label" class="property-label"><g:message code="bankTransaction.mode.label" default="Mode" /></span>
					
						<span class="property-value" aria-labelledby="mode-label"><g:fieldValue bean="${bankTransactionInstance}" field="mode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bankTransactionInstance?.id}" />
					<g:link class="edit" action="edit" id="${bankTransactionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
