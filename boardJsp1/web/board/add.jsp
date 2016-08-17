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
					<textarea class="form-control" rows="10" id="comment" name="comment" style="height : 100%"></textarea>
					<input type="hidden" name="content" id="content">
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
		var flag = true;
		
		var title = document.AddForm.title.value;
		title = title.replace(/(?:\r\n|\r|\n)/g, '');
		if( title === '' ) { 
			alert("제목은 필수입력입니다.");
			document.AddForm.title.focus();
			flag = false;
			return;
		}
		
		var comment = document.AddForm.comment.value;
		var content = comment.replace(/(?:\r\n|\r|\n)/g, '<br />');
		
		if( content === '' ) { 
			alert("내용은 필수입력입니다.");
			flag = false;
			document.AddForm.comment.focus();
			return;
		}
		
		document.AddForm.content.value = content;
		
		if( flag ) {
			document.AddForm.submit();	
		}
	}
	
	function GoHome() {
		document.AddForm.action = "./boardList.bo";
		document.AddForm.submit();
	}
	
	
	registerEventById("btnHome", "click", GoHome);
	registerEventById("btnAddProc", "click", ProcClick);
	
</script>	
	
</body>
</html>