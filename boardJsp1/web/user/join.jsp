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

<div id="wrap" style="width : 800px; margin : 0 auto;">
		<form name="AddForm" action="./boardAddPro.bo" method="post">
			<div>
				<div class="input-group input-group-lg">
					  <span class="input-group-addon">
					  	<i class="fa fa-hand-o-right "></i>
					  </span>
					  <input class="form-control" type="text" placeholder="Input User Id" name="user_id">
				</div>
				
				<div class="input-group input-group-lg" style="margin : 0; padding : 0">
					<span class="input-group-addon">
						<i class="fa fa-lock"></i>
					</span>
					<input class="form-control" type="password" placeholder="input User password" name="user_pass">
				</div>
				
				
				<div class="input-group input-group-lg" style="margin : 0; padding : 0">
					<span class="input-group-addon">
						<i class="fa fa-comment"></i>
					</span>
					<input class="form-control" type="text" placeholder="Input User Name" name="user_name">
				</div>
				
				<div class="input-group input-group-lg" style="margin : 0; padding : 0">
					<span class="input-group-addon">
						<i class="fa fa-comment"></i>
					</span>
					<label for="sel1">Select list:</label>
				  <select class="form-control" id="user_sex" name="user_sex">
				    <option selected>선택</option>
				    <option>남</option>
				    <option>여</option>
				  </select>
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
 
</body>
</html>