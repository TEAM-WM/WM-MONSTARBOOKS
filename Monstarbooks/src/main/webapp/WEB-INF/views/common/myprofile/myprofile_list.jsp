<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myprofile_list</title>
</head>
<!-- 로그인 시 회원이 등록한 이미지 출력/ 없을 경우 기본 이미지 -->
<body>
	<article class="mypage-wrap">
		<c:forEach items="${list }" var="mem">
		<form action="myprofile_list" method="post">
		<section class="mypage-section-wrap">
			<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp">
				<jsp:param name="name" value="${mem.mname }" />
				<jsp:param name="img" value="${mem.mprofileimg }" />
				<jsp:param name="id" value="${mem.mid }" />
			</jsp:include>
			<div class="mypage-content-box">
				<div class="mypage-title">
					<h3>내 정보 관리</h3>
				</div>
				<div class="mypage-content">
					<table>
						<tr>
							<th>프로필 이미지</th>
							<td>
								<div class="profile-img-box">
								
									<a <c:if test="${not empty mem.mprofileimg}">href='download?p=resources/assets/upload/&f=${mem.mprofileimg }&mid=${mem.mid }' </c:if> class="btn-profile">
										<span class="thumb-box">
										<c:if test="${not empty mem.mprofileimg}">
											<img src="${pageContext.request.contextPath}/resources/assets/upload/${mem.mprofileimg }" alt="프로필이미지"/>
										</c:if>
										</span>
									</a>
									<a href="view?mid=${mem.mid }" class="btn-a">
										<i class="fa-solid fa-camera"></i> 프로필변경
									</a>
								</div>
							</td>
						</tr>
						<tr>
							<th>회원정보수정 화면으로 이동</th>
							<td>
								<a href="${pageContext.request.contextPath}/mypage/pwCheckForm" class="btn-a"> 
									<i class="fa-solid fa-pen-to-square"></i> 회원정보관리
								</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
		</form>
		</c:forEach>
	</article>
<%-- 	<c:forEach items="${list }" var="mem">
				<br />
				<br />
				<div class="content">

					<!-- 왼쪽에 myprofile.jsp 내용 추가 -->
					<div id="myprofile-sidebar">
						<%@ include file="myprofile.jsp"%>
					</div>

					<form action="myprofile_list" method="post">
						<div align="left" class="card" style="height: 1000px;">
							<br /> <br />
							<br />
							<table>
								<c:choose>
									<c:when test="${not empty mem.mprofileimg}">
										<tr>
											<td><a href="">${mem.mname } 님</a></td>
										<tr>
											<td>
												<div align="center" class="image-container">
													<a
														href="download?p=resources/assets/upload/&f=${mem.mprofileimg }&mid=${mem.mid }">
														<img
														src="${pageContext.request.contextPath}/resources/assets/upload/${mem.mprofileimg }"
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
													<img
														src="${pageContext.request.contextPath}/resources/assets/imgs/mypage/profile.png"
														alt="기본이미지" style="max-width: 200px; height: auto;">

												</div>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>

								<tr>
									<td class="center"><a class="relist"
										href="view?mid=${mem.mid }" type="button">프로필변경</a>
										&nbsp;&nbsp;&nbsp;</td>
								</tr>
								<tr>
									<td><a href="../member/content_view" class=upde>회원정보관리</a>
									</td>
								</tr>


							</table>

							<br /> <br /> <br />
						</div>

					</form>
				</div>
			</c:forEach>
			<br /> --%>
	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 프로필메인";
	</script>
</body>
</html>
