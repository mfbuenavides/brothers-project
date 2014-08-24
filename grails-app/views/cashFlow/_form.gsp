<g:javascript src="form/update.js" />
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
	<g:field name="amount" value="${fieldValue(bean: cashFlowInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: cashFlowInstance, field: 'paidFor', 'error')} required">
	<label for="paidFor">
		<g:message code="cashFlow.paidFor.label" default="Paid For" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="paidFor" name="paidFor" from="${com.threebrothers.OperatingExpenses?.values().name}" keys="${com.threebrothers.OperatingExpenses.values()*.name()}" required="" value="${cashFlowInstance?.paidFor?.name()}" onchange="displayfield(this.value)" />
</div>

<g:if test="${otherExpensesNull}">
	<div id="hide-div" class="fieldcontain ${hasErrors(bean: cashFlowInstance, field: 'remarks', 'error')}" style="display:none">
		<label for="otherExpenses">
			<g:message code="cashFlow.remarks.label" default="Other Expenses" />	
		</label>
		<g:textField id="otherExpenses" name="otherExpenses" value="${cashFlowInstance?.otherExpenses}" />
	</div>
</g:if>
<g:else>
	<div id="hide-div" class="fieldcontain ${hasErrors(bean: cashFlowInstance, field: 'remarks', 'error')}" >
		<label for="otherExpenses">
			<g:message code="cashFlow.remarks.label" default="Other Expenses" />	
		</label>
		<g:textField id="otherExpenses" name="otherExpenses" value="${cashFlowInstance?.otherExpenses}" />
	</div>
</g:else>


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
	<g:select name="mode" from="${com.threebrothers.PaymentMode?.values().name}" keys="${com.threebrothers.PaymentMode.values()*.name()}" required="" value="${cashFlowInstance?.mode?.name()}"/>
</div>
 
