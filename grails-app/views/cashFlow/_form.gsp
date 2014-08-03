



<div class="fieldcontain ${hasErrors(bean: cashFlowInstance, field: 'transactionDate', 'error')} required">
	<label for="transactionDate">
		<g:message code="cashFlow.transactionDate.label" default="Transaction Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="transactionDate" precision="day"  value="${cashFlowInstance?.transactionDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: cashFlowInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="cashFlow.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${fieldValue(bean: cashFlowInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: cashFlowInstance, field: 'paidTo', 'error')} required">
	<label for="paidTo">
		<g:message code="cashFlow.paidTo.label" default="Paid To" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="paidTo" required="" value="${cashFlowInstance?.paidTo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cashFlowInstance, field: 'remarks', 'error')} ">
	<label for="remarks">
		<g:message code="cashFlow.remarks.label" default="Remarks" />
		
	</label>
	<g:textField name="remarks" value="${cashFlowInstance?.remarks}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cashFlowInstance, field: 'source', 'error')} required">
	<label for="source">
		<g:message code="cashFlow.source.label" default="Source" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="source" from="${com.threebrothers.PaymentSource?.values().name}" keys="${com.threebrothers.PaymentSource.values()*.name()}" required="" value="${cashFlowInstance?.source?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cashFlowInstance, field: 'mode', 'error')} required">
	<label for="mode">
		<g:message code="cashFlow.mode.label" default="Mode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="mode" from="${com.threebrothers.PaymentMode?.values()}" keys="${com.threebrothers.PaymentMode.values()*.name()}" required="" value="${cashFlowInstance?.mode?.name()}"/>
</div>

