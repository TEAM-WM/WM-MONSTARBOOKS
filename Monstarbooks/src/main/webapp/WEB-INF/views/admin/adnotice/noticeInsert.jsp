<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>
<script>
	function check_insert(){
		var frm = document.insertNotice;
		
		if(frm.ntitle.value == ""){
			alert("제목을 입력해주세요");
			frm.ntitle.focus();
			return false;
		}else if(frm.ncontent.value == ""){
			alert("공지 내용을 입력해주세요");
			frm.ncontent.focus();
			return false;
		}else if(confirm("공지를 등록하시겠습니까?")){
			frm.submit();
			alert("공지가 등록되었습니다");
			return;
		}else{
			return;	
		}
	}
	
	function cancel_insert(){
		if(confirm("공지등록을 취소하시겠습니까?")){
			location.href = "./notice";
		}else{
			return;
		}
		
	}
	
</script>
</head>
<body>
	<h2>공지 등록</h2>
	<hr />
	
	<form action="noticeInsert2" name="insertNotice" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>공지제목</td>
				<td>
					<input type="text" name="ntitle" size="30" maxlength="225" placeholder="제목을 입력하세요" />
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td></td>
				<td>작성날짜</td>
				<td>
					<c:set var="ymd" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea type="text" name="ncontent" rows="10" cols="40" maxlength="1000"
					 placeholder="공지할 내용을 작성하세요(최대 1000자)" style="resize: none"></textarea>
				</td>
			</tr>
			<tr>
				<td rowspan="2">첨부파일</td>
				<td>
					<input type="file" name="nfilesrc" />
				</td>
			</tr>
			<tr> </tr>
			<tr>
				<td>
					<input type="button" value="등록" onclick="check_insert();" />
					<input type="button" value="취소" onclick="cancel_insert();" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>