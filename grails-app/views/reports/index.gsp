
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">		
		<title> Reports </title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home  button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list button tiny radius" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-raiser" class="content scaffold-create" role="main">
			<h1> Reports </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${}">
			<ul class="errors" role="alert">
				<g:eachError bean="${}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form>	
			    Report Type:	
				<g:select name="reportType"
		          from="['Medicine', 'Mortality', 'Cash Flow']"
		          value="${reportInstance?.reportType}"
		           />
		        
		        From:   							
				<g:datePicker name="startDate" precision="day"  
					value="${reportsInstance?.startDate}" default="none" noSelection="['': '']"
					relativeYears="[-10..10]" /><br/>
					
				To:			
				<g:datePicker name="endDate" precision="day"  
					value="${reportsInstance?.endDate}" default="none" noSelection="['': '']" 
					relativeYears="[-10..10]"/><br/><br/>
				<g:hiddenField type="hidden" name="_format" value="PDF" />	
				<g:actionSubmit controller="reports" action="generate"  value="Generate Report" class="save button radius"/>
				
			</g:form>
		</div>
	</body>
</html>
