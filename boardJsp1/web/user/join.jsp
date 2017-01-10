<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/Common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Welcome Join Window</title>

</head>
<body>

<div id="wrap" style="width : 700px; margin : 0 auto; padding-top : 70px; ">
		<form class="form-horizontal" id="JoinForm" name="JoinForm" >
		  <div class="form-group">
		    <label for="user_id" class="col-sm-2 control-label">UserID</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control w15 noKor" id="user_id" name="user_id" placeholder="UserID" 
		      >
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="user_pass" class="col-sm-2 control-label">Password</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control w15 noKor" id="user_pass" name="user_pass" placeholder="Password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="re_pass" class="col-sm-2 control-label">Re Password</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control w15 noKor" id="re_pass" name="re_pass" placeholder="Re Input Password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="user_name" class="col-sm-2 control-label">UserName</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control w15 FKor" id="user_name" name="user_name" placeholder="UserName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <label for="user_gender" class="col-sm-2 control-label">Gender</label>
		    <div class="col-sm-10">
		        <select class="" id="user_gender">
		          <option>Male</option>
		          <option>Female</option>
		        </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		    	<button type="button" class="btn primary" id="btnHome">Go List</button>
		      <button type="button" class="btn btn-default" id="btnAddProc">Join</button>
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
			
			var user_id = document.JoinForm.user_id.value;
			if( user_id === '' ) {
				alert("회원가입 시 아이디는 필수입력입니다.");
				document.JoinForm.user_id.focus();
				return false;
			}
			
			var user_pass = document.JoinForm.user_pass.value;
			if( user_pass === '' )
			{
				alert("회원가입 시 패스워드는 필수입력입니다.");
				document.JoinForm.user_pass.focus();
				return false;
			}
			var re_pass = document.JoinForm.re_pass.value;
			
			if( user_pass != re_pass )
			{
				alert("입력 패스워드와 패스워드 확인의 값이 서로 다릅니다.");
				document.JoinForm.re_pass.value = "";
				document.JoinForm.re_pass.focus();
				return false;
			}
			
			var user_name = document.JoinForm.user_name.value;
			if( user_name === '' ) {
				alert("회원가입 시 성명은 필수입력입니다.");
				document.JoinForm.user_name.focus();
				return false;
			} 
			
			
			document.JoinForm.action = "/userJoinProc.uo";
			document.JoinForm.submit();
			
			$("#btnAddProc").attr("disabled", "disabled");
		}
		
		registerEventById("user_name", "keyup", checkLangName);
		registerEventById("btnHome", "click", goToHome);
		registerEventById("btnAddProc", "click", JoinActionProc);
	</script>
 	
</body>
</html>