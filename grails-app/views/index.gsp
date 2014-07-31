<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Three Brother's Piggery</title>
		
	</head>
	<body>
		<sec:ifNotLoggedIn>
			<%
			     response.sendRedirect("${request.contextPath}/login/auth")
			%>
		</sec:ifNotLoggedIn>
	</body>
</html>