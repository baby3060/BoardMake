<%@page import="com.user.action.LoginManager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int current_Page = (Integer)request.getAttribute("current_Page");
	LoginManager manager = (LoginManager)session.getAttribute("login");
	
	String sessionId = "";
	
	if( manager == null ) {
		sessionId = "";
	} else {
		sessionId = manager.getUserID(session.getId());	
	}
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
	    <button type="button" class="btn btn-primary" id="btnLogin" style="float: right;"> 
	    	<span class="glyphicon glyphicon-search"></span> Login
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

<nav aria-label="Page navigation" style="width : 100%; text-align : center;">
  <ul class="pagination">
  
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    
    
  </ul>
</nav>


<div class="btn-toolbar" role="toolbar" style="width : 100%; "> 
	  <div class="btn-group" style="width : 100%; "> 
	    <button type="button" class="btn btn-default" id="btnAdd" style="float: right;" title="Board Add"> 
	      <i class="fa fa-plus"></i> 
	    </button>
	  </div> 
	</div> 

</form>

</div>


<form name="loginForm" method="post" >
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Login Window</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">ID:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">PassWord:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Login</button>
      </div>
    </div>
  </div>
</div>
</form>

<script type="text/javascript">
	$(function(){
		JoinButtonDisabled();
	});

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
			$("#btnLogin").css("visibility", "visible");
			$("#btnLogin").removeAttr("disabled");
			
			$("#btnLogout").css("visibility", "hidden");
			$("#btnLogout").attr("disabled", "true");
			
		} else {
			$("#btnJoin").css("visibility", "hidden");
			$("#btnJoin").attr("disabled", "true");
			$("#btnLogin").css("visibility", "hidden");
			$("#btnLogin").attr("disabled", "true");
			
			$("#btnLogout").css("visibility", "visible");
			$("#btnLogout").removeAttr("disabled");
		}
	}
	
	function loginClick() {
		$('#exampleModal').modal({
			  keyboard: false,
			  backdrop : 'static'
		});
	}
	
	function logoutClick() {
		BootstrapDialog.confirm('Do you want to Logout?', function(result){
			// Logout Proc Action
            if(result) {
            	document.listForm.action = "../userLogout.uo";
        		document.listForm.submit();
            }else {
                return;
            }
        });
	}
	
	function btnJoin() {
		removeEventById("btnJoin", "click", btnJoin);
		document.listForm.action = "./userJoin.uo";
		document.listForm.submit();
	}
	
	registerEventById("tbody", "click", ListTrClick);
	registerEventById("btnAdd", "click", AddBtnClick);
	registerEventById("btnLogin", "click", loginClick);
	registerEventById("btnLogout", "click", logoutClick);
	registerEventById("btnJoin", "click", btnJoin);
	
</script>

</body>
</html>