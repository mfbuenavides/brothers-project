
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sales.label', default: 'Sales')}" />
		<title>Weighing Scale</title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home  button tiny radius" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list button tiny radius" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-weighing-reciept" class="content scaffold-create" role="main">
			<h1>Weighing Scale Reciept</h1>
			<g:uploadForm action="printReciept">
		    	<g:render template="form"/>
		        <input type="file" name="myFile" />
		        <input class="save button radius" type="submit" />
		    </g:uploadForm>
		</div>

	</body>
</html>
