<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String cp = request.getContextPath(); 
	int current_Page = (Integer)request.getAttribute("current_Page");
%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<script src="<%= cp %>/resources/scripts/jquery.min.js"></script>
	<script src="<%= cp %>/resources/bootstrap/js/bootstrap.min.js"></script>
	<link href="<%= cp %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<title>List JSP</title>

</head>

<body>
	<div style="height : 60px; width : 100%; text-align: right; ">
		
	</div>

	<table class = "table table-striped table-bordered table-hover" >
   	<caption>Registered post</caption>
	<colgroup>
		<col width="6%">
		<col width="5%">
		<col width="11%">
		<col width="16%">
		<col width="12%">
		<col width="15%">
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
			<th>Hit(Reading) Count</th>
		</tr>
	</thead>
	<tbody>
   	<c:choose>
		<c:when test="${totalCount > 0}">
			<c:forEach items="${boardList }" var="boardBean" varStatus="status">
				<tr>
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
</body>
</html>