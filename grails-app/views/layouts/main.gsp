<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'normalize.css')}" type="text/css">		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'foundation.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">		
		<script src="js/vendor/modernizr.js"></script>
		<g:layoutHead/>
		<r:layoutResources />	
	</head>
	<body>
		<!-- start of template -->
		
			   
 
  
  <div class="row">
    <div class="large-3 columns">
      <h1><img src="http://placehold.it/400x100&text=Logo"/></h1>
    </div>    
  </div>
  
   
  
  
  <div class="row">    
    
     
     
    <div class="large-9 push-3 columns">
      <g:layoutBody/>      
    </div>
    
    
     
     
    <div class="large-3 pull-9 columns">
        
      <ul class="side-nav">
        <li><g:link controller="raiser" action="list" >Raiser</g:link></li>
        <li><g:link controller="initialCapital" action="list" >Initial Capital</g:link></li>
        <li><g:link controller="sales" action="list" >Sales</g:link></li>
        <li><g:link controller="medicineInventory" action="list" >Medicine Inventory</g:link></li>
        <li><g:link controller="feedsInventory" action="list" >Feeds Inventory</g:link></li>
        <li><g:link controller="bankTransaction" action="list" >Bank Transactions</g:link></li>
        <li><g:link controller="cashFlow" action="list" >Cash Flow</g:link></li>
        <li><g:link controller="priceSetting" action="list" >Price Setting</g:link></li>
      </ul>
      
      <p><img src="http://placehold.it/320x240&text=Ad"/></p>
        
    </div>
    
  </div>
    
  <footer class="row">
    <div class="large-12 columns">
      <hr/>
      <div class="row">
        <div class="large-6 columns">
          <p>© Copyright no one at all. Go to town.</p>
        </div>       
      </div>
    </div> 
  </footer>
   
		
	<!-- end of template -->
	<g:javascript library="application"/>
	<r:layoutResources />
		
	</body>
</html>
