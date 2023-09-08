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
tr, td {
	padding: 10px 0px 5px 0px;
}

form {
	width: 500px;
	align: center;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}

table {
	width: 500px;
	align: center;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}
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

/* 주문/배송 목록 테이블 스타일 */
.order-table {
    width: 100%; /* 테이블 70% 너비로 설정 */
    float: right;
}

.content {
	display:flex;
	text-align: left;
	justify-content:space-between;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}

</style>
</head>
<!-- 로그인 시 회원이 등록한 이미지 출력/ 없을 경우 기본 이미지 -->
<body>

    <div class="content">
        <!-- 왼쪽에 myprofile.jsp 내용 추가 -->
        <div id="myprofile-sidebar">
            <%@ include file="myprofile.jsp" %>
        </div>
	<br />
	<br />

<form action="myprofile_list" method="post">
	<div align="left" class="card" style="height: 1000px;">
	<br /><br />	<br />
		<c:forEach items="${list }" var="mem">

		<table>
			<c:choose>
				<c:when test="${not empty mem.mprofileimg}">
				<tr>
				<td><a href="">${mem.mname }  님</a></td>
					<tr>
						<td>
							<div align="center" class="image-container">
							<a href="download?p=resources/assets/upload/&f=${mem.mprofileimg }&mid=
							${mem.mid }">
								<img src="${pageContext.request.contextPath}/resources/assets/upload/${mem.mprofileimg }"
									alt="회원 프로필이미지" style="width: 200px; height: auto;" />
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
									 alt="기본이미지" style=" max-width: 200px;  height: auto;">
							
							</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>

			<tr>
			<td class="center">
			<a class="relist" href="view?mid=${mem.mid }" type="button">프로필변경</a> &nbsp;&nbsp;&nbsp;
			</td>
			</tr>
			<tr>
			<td>
			<a href="../member/content_view" class=upde>회원정보관리</a>
			</td>
			</tr>

			
				</table>
			</c:forEach>
<br />
<br />
<br />
	</div>

</form>
</div>	
<br />
	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 프로필메인";
	</script>
</body>
</html>
