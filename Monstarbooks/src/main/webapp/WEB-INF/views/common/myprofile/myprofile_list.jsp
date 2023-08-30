<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myprofile_list</title>
</head>
<!-- 로그인 시 회원이 등록한 이미지 출력/ 없을 경우 기본 이미지 -->
<body>
	<div align="center" class="card" style="height: 300px;">
		<input type="hidden" name="memberno" value="${myprofile_list.memberno }" />
			
			<a href="${myprofile_list.memberno }">${myprofile_list.mname }  님</a> <br /><br />
			
		<table>
			<c:choose>
				<c:when test="${not empty myprofile_list.mprofileimg}">
					<tr>
						<td>
							<div align="center" class="image-container">
								<img src="../resources/assets/upload/${myprofile_list.mprofileimg}"
									alt="" style="width: 100%; height: auto;" />
							</div>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>
							<div align="center" class="image-container">
								<img src="../resources/assets/imgs/hyoseul/profile.png" alt=""
									style="width: 100%; height: auto;" />
							</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>



		<br />
		<hr />
		<a href="myprofile_update" type="button">수정</a> &nbsp;&nbsp;&nbsp; <a
			href="delete?memberno=${myprofile_list.memberno }">삭제</a> <br /> <br />
		<hr />
		<input type="submit" value="save" style="max-width: 20%;" /> <br />
		<a href="sample1">회원정보관리</a> <br />
	</div>




	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 프로필뷰";
	</script>
</body>
</html>
