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
	<div id="wrap" style="width : 400px; margin : 0 auto; margin-top : 50px;">
		<form name="LoginForm" action="./boardAddPro.bo" method="post">
			<div class="form-group">
			    <label for="ID">User ID</label>
			    <input type="text" class="form-control" id="InputID" placeholder="User ID" size="10">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" class="form-control" id="InputPass" placeholder="Password" size="10">
			  </div>

			
			<button type="button" class="btn btn-success" id="login" > 
				<i class="fa fa-wrench"> Login</i> 
			</button>
				    
			<button type="button" class="btn btn-primary" id="btnNoLogin" > 
				<i class="fa fa-home">  Enter No Login</i> 
			</button>
		</form>
	</div>
	
	<script type="text/javascript">
		function noLogin() {
			document.LoginForm.action = "/boardList.bo";
			document.LoginForm.submit();
		}
		
		registerEventById("btnNoLogin", "click", noLogin);
	</script>
	
</body>
</html>