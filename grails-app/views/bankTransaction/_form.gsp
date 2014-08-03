



<div class="fieldcontain ${hasErrors(bean: bankTransactionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="bankTransaction.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${bankTransactionInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bankTransactionInstance, field: 'bank', 'error')} required">
	<label for="bank">
		<g:message code="bankTransaction.bank.label" default="Bank" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="bank" from="${com.threebrothers.Bank?.values().name}" keys="${com.threebrothers.Bank.values()*.name()}" required="" value="${bankTransactionInstance?.bank?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankTransactionInstance, field: 'transactionType', 'error')} required">
	<label for="transactionType">
		<g:message code="bankTransaction.transactionType.label" default="Transaction Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="transactionType" from="${com.threebrothers.TransactionType?.values()}" keys="${com.threebrothers.TransactionType.values()*.name()}" required="" value="${bankTransactionInstance?.transactionType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankTransactionInstance, field: 'balance', 'error')} required">
	<label for="balance">
		<g:message code="bankTransaction.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="balance" type="number" value="${fieldValue(bean: bankTransactionInstance, field: 'balance')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankTransactionInstance, field: 'checkNumber', 'error')} ">
	<label for="checkNumber">
		<g:message code="bankTransaction.checkNumber.label" default="Check Number" />
		
	</label>
	<g:textField name="checkNumber" maxlength="50" value="${bankTransactionInstance?.checkNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankTransactionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="bankTransaction.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="100" required="" value="${bankTransactionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankTransactionInstance, field: 'transactionWith', 'error')} ">
	<label for="transactionWith">
		<g:message code="bankTransaction.transactionWith.label" default="Transaction With" />
		
	</label>
	<g:textField name="transactionWith" value="${bankTransactionInstance?.transactionWith}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankTransactionInstance, field: 'mode', 'error')} required">
	<label for="mode">
		<g:message code="bankTransaction.mode.label" default="Mode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="mode" from="${com.threebrothers.PaymentMode?.values()}" keys="${com.threebrothers.PaymentMode.values()*.name()}" required="" value="${bankTransactionInstance?.mode?.name()}"/>
</div>

