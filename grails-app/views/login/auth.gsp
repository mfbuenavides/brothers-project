<html>
<head>
	<!--meta name='layout' content='main'/-->
	<title><g:message code="springSecurity.login.title"/></title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'normalize.css')}" type="text/css">		
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'foundation.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
</head>

<body>
<br/><br/>
<div id='login'>
	<div class='inner'>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
		
			&nbsp;
			<div class="row large-offset-4">
					    <div class="large-10 columns">
					    	<g:img uri="../images/logo.jpg"/>
						</div>
			</div><br/>
		
			<div class="panel large-6 large-offset-3 columns">
				<g:if test='${flash.message}'>
					<div class='error radius-misc'>${flash.message}</div>
				</g:if>
				
				<div class="row">
				    <div class="large-12 columns">
				      <label for='username'><g:message code="springSecurity.login.username.label"/>:
				      	<input type="text" name='j_username' id='username' placeholder="Username" />
				      </label>
				        			      
				    </div>
			    </div>
			    
			    <div class="row">
				    <div class="large-12 columns">
				      <label for='password'><g:message code="springSecurity.login.password.label"/>:
				      	<input type="password" name='j_password' id='password' placeholder="Password" />
				      </label>
				    </div>			      
				</div>			    
			
				<br/>
				<div class="row">
					<div class="large-12 columns">
						<input type='submit' id="submit" class="button expand radius" value='${message(code: "springSecurity.login.button")}'/>
					</div>	
				</div>
			</div>
			
		</form>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>