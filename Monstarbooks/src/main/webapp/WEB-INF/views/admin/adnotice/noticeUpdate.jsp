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
			<td>${noticeDetail.noticeno }</td>
			<td>
				<input type="text" name="ntitle" size="30" maxlength="225" value="${noticeDetail.ntitle }" />
			</td>
		</tr>
		<tr>
			<td>${noticeDetail.nwriter }</td>
			<td>${noticeDetail.nregdate }</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea type="text" name="ncontent" rows="10" cols="40"
				maxlength="1000" style="resize: none">${noticeDetail.ncontent }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
            	<label for="nfilesrc">첨부 파일:</label>
    			<input type="file" id="nfilesrc" name="nfilesrc"><br>
			</td>
		</tr>

	</table>
		<input type="button" value="수정" onclick="check_update();" />
		<input type="button" value="취소" onclick="cancel_update();" />
	</form>
</body>
</html>