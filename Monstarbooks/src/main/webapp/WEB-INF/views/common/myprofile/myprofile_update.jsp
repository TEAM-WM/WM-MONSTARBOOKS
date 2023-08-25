<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myprofile_update</title>
</head>
<!--  로그인 및 회원 memberno를 hidden으로 연동해서 관련 자료가 뜨게끔 해야됨. -->
<body>
	<h2>프로필이미지 변경</h2> <br />
	<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="memberno" value="${sessionScope.myprofile_list.memberno }" />
	<hr />
		<img src="../resources/assets/imgs/hyoseul/profile.png" style=" max-width: 30%;  height: auto;">
		
	<table>
				<tr>
					<td class="left">이름</td>
					<td>${myprofile_list.mname }</td>
				</tr>
					<tr> 
				</tr>		
				<tr>					
					<td class="left">첨부</td>
					<td><input type="file" name="mprofileimg" accept=".jpg, .png" onchange="imageChoose(this)" /></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="update" /> &nbsp;&nbsp;

					</td>
				</tr>
	
		</table>
	</form>








	
<script>
	document.title = "몬스타북스 :: 마이페이지 :: 프로필수정"; 
</script>
</body>
</html>