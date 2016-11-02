<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/Common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Join Window</title>

</head>
<body>

<div id="wrap" style="width : 700px; margin : 0 auto;">
		<form name="JoinForm" action="./boardAddPro.bo" method="post">
			<div>
				<div class="form-group">
					  <span class="input-group-addon" style="width : 40px; ">
					  	<i class="fa fa-hand-o-right "></i>
					  </span>
					  
					  
					  <div class="col-sm-10">
					  	<input class="form-control" type="text" placeholder="Input User Id" name="user_id">
					  </div>
				</div>
				
			</div> 
			
			<div class="btn-toolbar" role="toolbar" style="width : 100%; "> 
			  <div class="btn-group" style="width : 100%; "> 
			    
			    <button type="button" class="btn btn-success" id="btnAddProc" style="float: right;"> 
			      <i class="fa fa-wrench"></i> 
			    </button>
			    
			    <button type="button" class="btn btn-primary" id="btnHome" style="float: right;"> 
			      <i class="fa fa-home"></i> 
			    </button>
			    
			  </div> 
			</div> 
			
		</form>
	</div>
 	
 	<script type="text/javascript">
		function goToHome() {
			
			$("#btnAddProc").attr("disabled", "disabled");
			document.JoinForm.action = "/boardList.bo";
			document.JoinForm.submit();
		}
		
		function JoinActionProc() {
			$("#btnAddProc").attr("disabled", "disabled");
			var user_id = document.JoinForm.user_id.value;
			if( user_id === '' ) {
				alert("회원가입 시 아이디는 필수입력입니다.");
				document.JoinForm.user_id.focus();
				return false;
			}
		}
		
		
		registerEventById("btnHome", "click", goToHome);
		registerEventById("btnAddProc", "click", JoinActionProc);
	</script>
 	
</body>
</html>