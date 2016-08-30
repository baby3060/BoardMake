<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int current_Page = (Integer)request.getAttribute("current_Page");
	String sessionId = (String)session.getAttribute("UserID");
	
	if( sessionId == null ) {
		sessionId = "";
	}
	
	System.out.println("sessionId : " + sessionId);
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>List JSP</title>
	<%@ include file="../include/Common.jsp" %>
</head>

<body>
	<div id="wrap" style="width : 800px; margin : 0 auto; ">
	
	<div class="btn-toolbar" role="toolbar" style="width : 100%; "> 
	  <div class="btn-group" style="width : 100%; "> 
	    <button type="button" class="btn btn-primary" id="btnJoin" style="float: right;" title="join"> 
	      <i class="fa fa-plus">&nbsp;User Join</i> 
	    </button>
	  </div> 
	  
	  <div class="btn-group" style="width : 100%; "> 
	    <button type="button" class="btn btn-primary" id="btnLogout" style="float: right;" title="Logout"> 
	      <i class="fa fa-plus">&nbsp;LogOut</i> 
	    </button>
	  </div> 
	</div>
	
	<form name="listForm" method="post">
		<input type="hidden" name="board_num" value="">
		<input type="hidden" name="ConnID" value="<%= sessionId %>" >
	<table class = "table table-striped table-bordered table-hover" >
   	<caption>Registered post</caption>
	<colgroup>
		<col width="6%">
		<col width="5%">
		<col width="11%">
		<col width="16%">
		<col width="15%">
		<col width="15%">
		<col width="19%">
		<col>
	</colgroup>
	<thead>
		<tr>
			<th>#</th>
			<th>Gubun</th>
			<th>Title</th>
			<th>Content</th>
			<th>Create Date</th>
			<th>Create User</th>
			<th>Hit Count</th>
		</tr>
	</thead>
	<tbody id="tbody">
   	<c:choose>
		<c:when test="${totalCount > 0}">
			<c:forEach items="${boardList }" var="boardBean" varStatus="status">
				<tr id="<c:out value="${boardBean.board_num}"></c:out>" 
					>
					<td><c:out value="${boardBean.board_num}"></c:out></td>
					<td>
						<c:choose>
							<c:when test="${boardBean.board_priva eq \"1\" }">
								비밀
							</c:when>
							<c:otherwise>
								공개
							</c:otherwise>
						</c:choose>
					</td>
					<td><c:out value="${boardBean.board_title}"></c:out></td>
					<td style="max-width: 100px;
    							overflow: hidden;
    							text-overflow: ellipsis;
   								 white-space: nowrap;
							">
						<c:out value="${boardBean.board_contn}"></c:out>
					</td>
					<td><c:out value="${boardBean.board_cdate}"></c:out></td>
					<td><c:out value="${boardBean.board_usrid}"></c:out></td>
					<td><c:out value="${boardBean.board_htcnt}"></c:out></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="7" style="text-align : center;">등록된 게시물이 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>

<div class="row" style="margin : 0 auto;">
  <div class="col-md-1">1</div>
  <div class="col-md-1">2</div>
</div>


<div class="btn-toolbar" role="toolbar" style="width : 100%; "> 
	  <div class="btn-group" style="width : 100%; "> 
	    <button type="button" class="btn btn-default" id="btnAdd" style="float: right;" title="Board Add"> 
	      <i class="fa fa-plus"></i> 
	    </button>
	  </div> 
	</div> 

</form>

</div>
<script type="text/javascript">
	// tbody 아래의 tr 클릭했을 시만.
	function ListTrClick() {
		var board_num = $(returnParent(event.target)).attr('id').trim();
		
		try {
			if( board_num === undefined || board_num === '') {
				throw new BoardNumNullException();
			} else {
				// Error
				if( board_num <= 0 ) {
					throw new NotBoardNumValidException(board_num);
				} else {
					removeEventById("tbody", "click", ListTrClick);
					document.listForm.board_num.value = board_num;
					document.listForm.action = "./boardDetail.bo";
					document.listForm.submit();
				}
			}
			
		} catch(err) {
			alert(err);
		}
	}
	
	function AddBtnClick() {
		removeEventById("btnAdd", "click", AddBtnClick);
		document.listForm.action = "./boardAdd.bo";
		document.listForm.submit();
	}	
	
	function JoinButtonDisabled() {
		var ConnID = document.listForm.ConnID.value.replace(/\\s/g, '');
		if( ConnID === '' ) {
			
			$("#btnJoin").css("visibility", "visible");
			$("#btnJoin").removeAttr("disabled");
			
			$("#btnLogout").css("visibility", "hidden");
			$("#btnLogout").attr("disabled", "true");
			
		} else {
			$("#btnJoin").css("visibility", "hidden");
			$("#btnJoin").attr("disabled", "true");
			
			$("#btnLogout").css("visibility", "visible");
			$("#btnLogout").removeAttr("disabled");
		}
	}
	
	$(function(){
		JoinButtonDisabled();
	});
	
	function logoutClick() {
		BootstrapDialog.confirm('Do you want to Logout?', function(result){
			// Logout Proc Action
            if(result) {
				            	
            	
            }else {
                return;
            }
        });
	}
	
	registerEventById("tbody", "click", ListTrClick);
	registerEventById("btnAdd", "click", AddBtnClick);
	registerEventById("btnLogout", "click", logoutClick);
	
</script>

</body>
</html>