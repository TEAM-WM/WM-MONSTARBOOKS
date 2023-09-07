<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세</title>
<script>

	function updateNotice(){
		if(confirm("공지를 수정하시겠습니까?")){
			location.href = "./noticeUpdate?noticeno=${noticeDetail.noticeno }";
		}else {
			return;
		}
	}
	
	function deleteNotice(i){
		if(confirm("공지를 삭제하시겠습니까?")){
			location.href = "delete?noticeno=" + i;
			alert("공지가 삭제되었습니다");
		}else {
			return;
		}
	}
	
</script>
</head>
<body>
	<h3>공지 상세</h3>
	<hr />
	
	<table>
		<tr>
			<td>${noticeDetail.noticeno }</td>
			<td colspan="3"><h1>${noticeDetail.ntitle }</h1></td>
		</tr>
		<tr>
			<td>${noticeDetail.nwriter }</td>
			<td>${noticeDetail.nregdate }</td>
			<td><button onclick="updateNotice();">공지 수정</button></td>
			<td> <button onclick="deleteNotice(${noticeDetail.noticeno});">삭제</button></td>
		</tr>
		<tr>
			<td colspan="4">${noticeDetail.ncontent }</td>
		</tr>
		<tr>
			<td colspan="4">
				<c:if test="${noticeDetail.nfilesrc ne null }">
					<img border="1" width="75" height="75"
					 src="../../resources/assets/upload/${noticeDetail.nfilesrc }" alt="${noticeDetail.nfilesrc }" />
				</c:if>
			</td>
		</tr>
	</table>
	<br/>
<button><a href="./notice">목록</a></button>
</body>
</html>