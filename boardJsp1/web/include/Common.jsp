<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String cp = request.getContextPath(); 
%>

<script src="<%= cp %>/resources/scripts/jquery.min.js"></script>
<script src="<%= cp %>/resources/scripts/eventHandler.js"></script>
<script src="<%= cp %>/resources/scripts/Exceptions.js"></script>
<script src="<%= cp %>/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="<%= cp %>/resources/bootstrap/js/bootstrap-dialog.min.js"></script>
<link href="<%= cp %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= cp %>/resources/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="<%= cp %>/resources/bootstrap/css/bootstrap-dialog.min.css" rel="stylesheet">

<script>
// 크롬용
$(window).keydown(function(event) {
	  if(event.altKey && event.keyCode == 37) { 
	    event.preventDefault(); 
	  }
	  
	});
</script>


<script>

$(document).unbind('keydown').bind('keydown', function (event) {
    var doPrevent = false;
    if (event.keyCode === 8) {
        var d = event.srcElement || event.target;
        if ((d.tagName.toUpperCase() === 'INPUT' && 
             (
                 d.type.toUpperCase() === 'TEXT' ||
                 d.type.toUpperCase() === 'PASSWORD' || 
                 d.type.toUpperCase() === 'FILE' || 
                 d.type.toUpperCase() === 'SEARCH' || 
                 d.type.toUpperCase() === 'EMAIL' || 
                 d.type.toUpperCase() === 'NUMBER' || 
                 d.type.toUpperCase() === 'DATE' )
             ) || 
             d.tagName.toUpperCase() === 'TEXTAREA') {
            doPrevent = d.readOnly || d.disabled;
        }
        else {
            doPrevent = true;
        }
    }

    if (doPrevent) {
        event.preventDefault();
    }
});

</script>