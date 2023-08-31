<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
<script>
	function check_update(){
		var frm = document.updateNotice;
	
		if(frm.ntitle.value == ""){
			alert("제목을 입력해주세요");
			frm.ntitle.focus();
			return false;
		}else if(frm.ncontent.value == ""){
			alert("공지 내용을 입력해주세요");
			frm.ncontent.focus();
			return false;
		}else if(confirm("공지를 수정하시겠습니까?")){
			frm.submit();
			alert("공지가 수정되었습니다");
			return;
		}else {
			return;
		}
		
	}

	function cancel_update(){
		if(confirm("수정을 취소하시겠습니까?")){
			location.href = "./noticeDetail?noticeno=${noticeDetail.noticeno }";
		} else{
			return;
		}
	}
</script>
</head>
<body>
	<h2>공지 수정</h2>
	
	<form action="noticeUpdate2" method="post" name="updateNotice" enctype="multipart/form-data">
	<input type="hidden" name="noticeno" value="${noticeDetail.noticeno }" />
	<table>
		<tr>
			<td>번호</td>
			<td>${noticeDetail.noticeno }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${noticeDetail.nwriter }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${noticeDetail.nregdate }</td>
		</tr>
		<tr>
			<td>삭제여부</td>
			<td>${noticeDetail.deleted }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="ntitle" size="30" maxlength="225" value="${noticeDetail.ntitle }" />
			</td>
		</tr>
		<tr>
			<td>공지내용</td>
			<td>
				<textarea type="text" name="ncontent" rows="10" cols="40"
				maxlength="1000" style="resize: none">${noticeDetail.ncontent }</textarea>
			</td>
		</tr>
		<tr>
			<td rowspan="2">첨부파일</td>
			<td>
				<!--
				<c:if test="${noticeDetail.nfilesrc ne null }">

				</c:if>
				-->
				<img border="1" width="75" height="75"
				src="../../resources/assets/upload/${noticeDetail.nfilesrc }" alt="${noticeDetail.nfilesrc }" />
				<input type="file" name="nfilesrc" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="수정" onclick="check_update();" />
				<input type="button" value="취소" onclick="cancel_update();" />
			</td>
		</tr>
	</table>
	</form>
	
	
</body>
</html>