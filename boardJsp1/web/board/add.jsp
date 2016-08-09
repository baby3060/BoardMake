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
		<form name="AddForm" action="./boardAddPro.bo" method="post">
			<div>
				<div class="input-group input-group-lg">
					  <span class="input-group-addon">
					  	<i class="fa fa-hand-o-right "></i>
					  </span>
					  <input class="form-control" type="text" placeholder="Input Title" name="title">
				</div>
				
				<div class="input-group input-group-lg" style="margin : 0; padding : 0">
					<span class="input-group-addon">
						<i class="fa fa-lock"></i>
					</span>
					<input class="form-control" type="password" placeholder="If input password Private Content" name="password">
				</div>
				
				
				<div class="input-group input-group-lg" style="margin : 0; padding : 0; height : 300px;">
					<span class="input-group-addon">
						<i class="fa fa-comment"></i>
					</span>
					<textarea class="form-control" rows="10" id="comment" style="height : 100%"></textarea>
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
	// tbody 아래의 tr 클릭했을 시만.
	function ProcClick() {
		document.AddForm.submit();
	}

	registerEventById("btnAddProc", "click", ProcClick);
	
</script>	
	
</body>
</html>