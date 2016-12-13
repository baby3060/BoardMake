<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/Common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
select::-ms-expand {
    border:none;
    background:#fff;
}
</style>
<title>Welcome Join Window</title>

</head>
<body>

<div id="wrap" style="width : 700px; margin : 0 auto; padding-top : 70px; ">
		<form class="form-horizontal" id="JoinForm" >
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="user_id" placeholder="UserID">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="user_pass" placeholder="Password">
		    </div>
		  </div>
		  <div class="form-group">
		  <label for="user_sex" class="col-sm-2 control-label">Gender</label>
		    <div class="col-sm-10">
		        <select class="" id="user_gender">
		          <option>Male</option>
		          <option>Female</option>
		        </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">Join</button>
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