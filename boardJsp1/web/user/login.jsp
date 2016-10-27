<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg = (String)request.getAttribute("msg");
	if( msg == null ) {
		msg = "";
	}
	
	String errCode = (String)request.getAttribute("errCode");
	if( errCode == null ) {
		errCode = "";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Login Window</title>
<%@ include file="../include/Common.jsp" %>
</head>
<body >
	<div id="wrap" style="width : 400px; margin : 0 auto; margin-top : 50px;">
		<form name="LoginForm" action="./boardAddPro.bo" method="post">
			<div class="modal fade">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Modal title</h4>
			      </div>
			      <div class="modal-body">
			        <p>One fine body…</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Save changes</button>
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
		
			<div class="form-group">
			    <label for="ID">User ID</label>
			    <input type="text" class="form-control" id="InputID" placeholder="User ID" size="10" name="UserID">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" class="form-control" id="InputPass" placeholder="Password" size="10" name="UserPass">
			  </div>

			
			<button type="button" class="btn btn-success" id="btnLogin" > 
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
			
			$("#btnLogin").attr("disabled", "true");
			$("#btnNoLogin").attr("disabled", "true");
			
			removeEventById("btnLogin", "click", login);
			removeEventById("btnNoLogin", "click", noLogin);
			document.LoginForm.submit();
		}
		
		function login() {
			var ObjID = document.getElementById("InputID");
			var ObjPass = document.getElementById("InputPass");
			
			var InputId = ObjID.value;
			var InputPass = ObjPass.value;
			
			var message = "";
			
			if( InputId === '' ) {
				message = "No Input User ID!!!!!";
			}
			
			if( InputPass === '' ) {
				message = "No Input User PassWord!!!!!";
			}
			
			if( message === '' ) {
				
				$("#btnLogin").attr("disabled", "true");
				$("#btnNoLogin").attr("disabled", "true");
				
				removeEventById("btnLogin", "click", login);
				removeEventById("btnNoLogin", "click", noLogin);
				document.LoginForm.action = "/userLoginProc.uo";
				document.LoginForm.submit();
			} else {
				BootstrapDialog.alert({
					title: 'Be Missing Data',
		            message: message
		        });
				return;
			}
		}
		
		registerEventById("btnLogin", "click", login);
		registerEventById("btnNoLogin", "click", noLogin);
	</script>
	
	
	
</body>
</html>