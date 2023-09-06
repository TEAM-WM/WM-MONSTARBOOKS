<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myprofile_list</title>
<style>
.upde {
	margin-left: auto;
	margin-right: auto;
	display: block;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	padding-top: 15px;
	border-radius: 5px;
	border: 1px solid #d9d9d9;
	color: #767676;
	background-color: var(--color-main);
    font-weight: var(--weight-bold);
    color: var(--color-white);
    max-width: 50%
}
.relist {
	margin-left: auto;
	margin-right: auto;
	display: block;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	padding-top: 15px;
	border-radius: 5px;
	border: 1px solid #d9d9d9;
	color: #767676;
	background-color: var(- -color-white);
	font-weight: var(- -weight-bold);
	color: var(- -color-main);	
}
</style>
</head>
<!-- 로그인 시 회원이 등록한 이미지 출력/ 없을 경우 기본 이미지 -->
<body>
<br /><br />
<form action="myprofile_list" method="post">
	<div align="center" class="card" style="height: 700px;">
	
		<c:forEach items="${list }" var="mem">
			
			<a href="">${mem.mname }  님</a> <br /><br />
			
			
		<table>
			<c:choose>
				<c:when test="${not empty mem.mprofileimg}">
					<tr>
						<td>
							<div align="center" class="image-container">
							<a href="download?p=resources/assets/upload/&f=${mem.mprofileimg }&mid=
							${mem.mid }">
								<img src="${pageContext.request.contextPath}/resources/assets/upload/${mem.mprofileimg }"
									alt="회원 프로필이미지" style="width: 200px; height: 200px;" />
							</a>									
							</div>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>
							<div align="center" class="image-container">
									<img src="${pageContext.request.contextPath}/resources/assets/imgs/hyoseul/profile.png"
									 alt="기본이미지" style=" max-width: 70%;  height: auto;">
							
							</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
			<td>
			</td>
			</tr>
			<tr>
			<td class="center">
			<a class="relist" href="view?mid=${mem.mid }" type="button">프로필변경</a> &nbsp;&nbsp;&nbsp;
			</td>
			</tr>
				</table>
			</c:forEach>
					<a href="../member/content_view" class=upde>회원정보관리</a> <br />
<br />
<br />
<br />
	</div>
	
</form>
<br />
	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 프로필메인";
	</script>
</body>
</html>
