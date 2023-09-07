<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myprofile_update</title>
<style>
tr, td {
	padding: 10px 0px 5px 0px;
}

form {
	width: 550px;
	align: center;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}

table {
	width: 550px;
	align: center;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}	
.upde {
	margin-left: auto;
	margin-right: auto;
	display: block;
	width: 50%;
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
	background-color: var(--color-main);
    font-weight: var(--weight-bold);
    color: var(--color-white);
    max-width: 50%
      
}
  
/* 주문/배송 목록 테이블 스타일 */
.order-table {
    width: 100%; /* 테이블 70% 너비로 설정 */
    float: right;
}

.content {
	display:flex;
	justify-content:space-between;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}

</style>
</head>
<body>
	<br />
	<br />
	<br />
	<h2>My Profile View</h2>
	<br />
	<br />
	
    <div class="content">
        <!-- 왼쪽에 myprofile.jsp 내용 추가 -->
        <div id="myprofile-sidebar">
            <%@ include file="myprofile.jsp" %>
        </div>

        <!-- 주문/배송 목록 테이블 -->
        <table class="order-table">
            <tr>
                <th>주문일자</th>
                <th>상품정보</th>
                <th>수량</th>
                <th>가격</th>
                <th>총 가격</th>
                <th>배송 상태</th>
            </tr>
			</table>

	<div align="center" class="card" style="height: 700px;">
	<table>
			<c:choose>
			<c:when test="${not empty myprofile_view.mprofileimg}">
				<tr>
					<td class="center" colspan=2>
						<div align="center" class="image-container">
						<a href="download?p=resources/assets/upload/&f=${myprofile_view.mprofileimg }&mid=
							${myprofile_view.mid }">
							<img
								src="${pageContext.request.contextPath}/resources/assets/upload/${myprofile_view.mprofileimg }"
								alt="프로필사진" style="width: 200px; height: 200px;" />
							</a>
						</div>
					</td>
				</tr>
			</c:when>
			<c:otherwise>

				<tr>
					<td class="left" colspan=2>
						<div align="center" class="image-container">
							<img
								src="${pageContext.request.contextPath}/resources/assets/imgs/hyoseul/profile.png"
								alt="기본이미지" style="max-width: 40%; height: auto;">
						</div>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
			<tr>
			<td> </td>
		</tr>
		<tr>
			<td class="center" colspan="2">ID : &nbsp;${myprofile_view.mid }</td>
		</tr>
		<tr>
			<td class="center" colspan="2">이름 : &nbsp;${myprofile_view.mname }&nbsp;님</td>
		</tr>
		<tr>
			<td> </td>
		</tr>
		<tr>
		<td class="center" colspan="2">
			<a class="upde" href="update?mid=${myprofile_view.mid }">수정</a>&nbsp;&nbsp;
			 <a class="upde" href="delete?mid=${myprofile_view.mid }">삭제</a>
		</td>
		</tr>
		<tr>
		<td class="center" colspan="2">
				<a href="list" class="relist">LIST</a>
				</td>
		</tr>
			</table>
	</div>


	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 프로필뷰";
	</script>
</body>
</html>
