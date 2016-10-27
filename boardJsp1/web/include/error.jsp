<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	if(msg == null) {
		msg = "";
	}
	
	String actions = (String)request.getAttribute("actions");
	if(actions == null) {
		actions = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/Common.jsp" %>
</head>
<body>
<form name="errForm" method="post" action="<%= actions %>">
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
</form>
			
<% if(!msg.equals("")) { %>
	<script type="text/javascript">
		function err(message) {
			BootstrapDialog.show({
				title: 'Error',
		        message: message,
		        buttons: [{
	                label: 'Close',
	                action: function(dialog) {
	                    document.errForm.submit();
	                }
	            }]
		    });
		}
		err('<%= msg %>');
	</script>
	<% } %>
</body>
</html>