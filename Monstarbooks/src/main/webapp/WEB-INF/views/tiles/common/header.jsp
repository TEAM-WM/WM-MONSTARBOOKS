<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<header class="global-header header">
		<div class="global-header-container">
			<div class="global-service-list">
				<ul>
				<c:choose>
					<c:when test="${empty sessionScope.id }">
					<li><a href="${pageContext.request.contextPath}/join/terms"> 회원가입 </a></li>
					<li><a href="${pageContext.request.contextPath}/login/"> 로그인 </a></li>
					</c:when>
					<c:otherwise>
						<li>
							<a class="header-id">
								<span>${id }</span> 님 환영합니다.
							</a>
						</li>
						<li>
						<a href="javascript:logout()">
							로그아웃
						</a>
						</li>
						<c:if test="${auth eq '관리자'}">
							<li>
								<a href="${pageContext.request.contextPath }/admin/">
								<i class="fas fa-cog"></i>
								운영관리
								</a>
							</li>
						</c:if>
				</c:otherwise>
			</c:choose>
					<li><a href="#"> 고객센터 </a></li>
				</ul>
			</div>
			<!-- global-service-list  종료 -->
			<div class="global-header-main">
				<h1>
					<a href="${pageContext.request.contextPath}/"> </a>
				</h1>
				<!-- 검색 -->
				<div class="global-search">
					<form action="" method="get">
						<input type="text" name="search" placeholder="세상에 꼭 나와야만 했던 이야기"
							autocomplete="off">
						<button type="submit" class="search-icon"></button>
					</form>
					<section class="global-search-history">
						<div class="global-search-history-recommend">
							<h4>추천검색어</h4>
							<ul>
								<li><a href=""> 챗GPT </a></li>
								<li><a href=""> 자바 </a></li>
								<li><a href=""> 파이썬 </a></li>
								<li><a href=""> 총균쇠 </a></li>
								<li><a href=""> 김태연 </a></li>
								<li><a href=""> 히가시노 게이고 </a></li>
								<li><a href=""> 노벨문학상 </a></li>
								<li><a href=""> 베르나르 베르베르 </a></li>
							</ul>
						</div>
						<div class="global-search-history-recent">
							<div class="recent-search">
								<h4>최근 검색어</h4>
								<button type="button" class="search-delete">
									<i class="fa-solid fa-trash"></i> <span>전체삭제</span>
								</button>
							</div>
							<ul>
								<li class="recent-search-none center"><i
									class="fa-solid fa-circle-exclamation"></i><br> 최근 검색어 내역이
									없습니다.</li>
							</ul>
						</div>
					</section>
				</div>
				<!-- 장바구니 / 마이페이지 아이콘 -->
				<ul class="global-user-menu-list">
					<li><a href="" class="global-user-menu-cart"></a></li>
					<li><a href="" class="global-user-menu-profile"></a></li>
				</ul>
			</div>
			<!-- global-header-main  종료 -->

			<!-- 메인메뉴 -->
			<nav class="global-main-menu">
				<!-- 전체 메뉴 아이콘 -->
				<button type="button" class="btn_menu"></button>
				<ul class="global-main-menu-list">
					<li><a href="">베스트</a></li>
					<li><a href="">새로나온책</a></li>
					<li><a href="">국내도서</a></li>
					<li><a href="">외국도서</a></li>
					<li><a href="">이벤트</a></li>
				</ul>
			</nav>
			<section class="global-all-menu">
				<div class="global-book-list-wrap">
					<div class="global-book-list">
						<h4>
							<a href=""> 국내도서 전체 <span><i
									class="fa-solid fa-circle-chevron-right"></i></span>
							</a>
						</h4>
						<ul>
							<li><a href="">소설</a></li>
							<li><a href="">시/에세이</a></li>
							<li><a href="">인문</a></li>
							<li><a href="">기술공학</a></li>
							<li><a href="">가정/육아</a></li>
							<li><a href="">요리</a></li>
							<li><a href="">건강</a></li>
							<li><a href="">취미/실용/스포츠</a></li>
							<li><a href="">경제/경영</a></li>
							<li><a href="">자기계발</a></li>
							<li><a href="">정치/사회</a></li>
							<li><a href="">역사/문화</a></li>
							<li><a href="">기술/공학</a></li>
							<li><a href="">외국어</a></li>
							<li><a href="">과학</a></li>
							<li><a href="">취업/수험서</a></li>
							<li><a href="">여행</a></li>
							<li><a href="">컴퓨터/IT</a></li>
							<li><a href="">기타</a></li>
						</ul>
					</div>
					<div class="global-book-list">
						<h4>
							<a href=""> 외국도서 전체 <span><i
									class="fa-solid fa-circle-chevron-right"></i></span>
							</a>
						</h4>
						<ul>
							<li><a href="">잡지</a></li>
							<li><a href="">엔터테인먼트</a></li>
							<li><a href="">만화/애니</a></li>
							<li><a href="">문학</a></li>
							<li><a href="">라이트노벨</a></li>
							<li><a href="">취미/실용/여행</a></li>
							<li><a href="">생활/요리/건강</a></li>
							<li><a href="">예술/건축</a></li>
							<li><a href="">인문/사회</a></li>
							<li><a href="">경제/경영</a></li>
							<li><a href="">과학/기술</a></li>
							<li><a href="">어린이ELT</a></li>
							<li><a href="">유아/아동/청소년</a></li>
							<li><a href="">한국관련도서</a></li>
							<li><a href="">문구/멀티/비도서</a></li>
							<li><a href="">기타</a></li>
						</ul>
					</div>
				</div>
				<div class="global-book-event">
					<ul>
						<li><a href=""> <i class="fa-solid fa-thumbs-up"></i>
						</a> <span> 베스트 </span></li>
						<li><a href=""> N </a> <span> 새로나온책 </span></li>
						<li><a href=""> <i class="fa-solid fa-gift"></i>
						</a> <span>이벤트</span></li>
						<li><a href=""> <i class="fa-solid fa-headset"></i>
						</a> <span> 고객센터 </span></li>
					</ul>
				</div>
			</section>
		</div>
		<!-- global-header-container 종료 -->
		<div class="progress-container">
			<div class="progress-bar" id="myBar"></div>
		</div>
	</header>
	<!-- header 종료 -->
	
	<script>
	function logout(){
		alert("로그아웃 되었습니다");
		location.href="${pageContext.request.contextPath }/logout";
	}
	</script>
</body>
</html>