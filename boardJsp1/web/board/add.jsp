<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/Common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body >
	<div id="wrap" style="width : 800px; margin : 0 auto;">
		<form name="AddForm" action="./boardAddPro.bo">
			<div>
				<div class="input-group input-group-lg">
					  <span class="input-group-addon">
					  	<i class="fa fa-envelope"></i>
					  </span>
					  <input class="form-control" type="text" placeholder="Email address">
				</div>
				
				<div class="input-group input-group-lg">
					<span class="input-group-addon">
						<i class="fa fa-lock"></i>
					</span>
					<input class="form-control" type="password" placeholder="Password">
				</div>
			</div> 
			
			<div class="btn-toolbar" role="toolbar" style="width : 100%; "> 
			  <div class="btn-group" style="width : 100%; "> 
			    
			    
			    <button type="button" class="btn btn-success" id="btnHome" style="float: right;"> 
			      <i class="fa fa-wrench"></i> 
			    </button>
			    
			    <button type="button" class="btn btn-primary" id="btnHome" style="float: right;"> 
			      <i class="fa fa-home"></i> 
			    </button>
			    
			  </div> 
			</div> 
			
		</form>
	</div>
</body>
</html>