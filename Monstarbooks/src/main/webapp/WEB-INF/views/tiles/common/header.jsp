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
					<li><a href="${pageContext.request.contextPath }/cscenter"> 고객센터 </a></li>
				</ul>
			</div>
			<!-- global-service-list  종료 -->
			<div class="global-header-main">
				<h1>
					<a href="${pageContext.request.contextPath}/"> </a>
				</h1>
				<!-- 검색 -->
				<div class="global-search">
					<form action="${pageContext.request.contextPath}/booklist/search" method="get">
						<input type="text" name="search" placeholder="세상에 꼭 나와야만 했던 이야기"
							autocomplete="off" value="${search }" onkeydown="handleEnterKey(event)" />
						<button type="button" class="search-icon" onclick="searching()"></button>
					</form>
					<section class="global-search-history">
						<div class="global-search-history-recommend">
							<h4>추천검색어</h4>
							<ul>
								<li><a href="${pageContext.request.contextPath}/booklist/search?search=챗GPT"> 챗GPT </a></li>
								<li><a href="${pageContext.request.contextPath}/booklist/search?search=자바"> 자바 </a></li>
								<li><a href="${pageContext.request.contextPath}/booklist/search?search=파이썬"> 파이썬 </a></li>
								<li><a href="${pageContext.request.contextPath}/booklist/search?search=총균쇠"> 총균쇠 </a></li>
								<li><a href="${pageContext.request.contextPath}/booklist/search?search=김태연"> 김태연 </a></li>
								<li><a href="${pageContext.request.contextPath}/booklist/search?search=히가시노 게이고"> 히가시노 게이고 </a></li>
								<li><a href="${pageContext.request.contextPath}/booklist/search?search=노벨문학상"> 노벨문학상 </a></li>
								<li><a href="${pageContext.request.contextPath}/booklist/search?search=베르나르 베르베르"> 베르나르 베르베르 </a></li>
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
					<li><a href="${pageContext.request.contextPath }/cart" class="global-user-menu-cart"></a></li>
					<li><a href="${pageContext.request.contextPath }/myprofile/list" class="global-user-menu-profile"></a></li>
				</ul>
			</div>
			<!-- global-header-main  종료 -->

			<!-- 메인메뉴 -->
			<nav class="global-main-menu">
				<!-- 전체 메뉴 아이콘 -->
				<button type="button" class="btn_menu"></button>
				<ul class="global-main-menu-list">
					<li><a href="${pageContext.request.contextPath }/booklist/bestlist">베스트</a></li>
					<li><a href="${pageContext.request.contextPath }/booklist/new">새로나온책</a></li>
					<li><a href="${pageContext.request.contextPath }/booklist/category?list=kor&code=0">국내도서</a></li>
					<li><a href="${pageContext.request.contextPath }/booklist/category?list=eng&code=0">외국도서</a></li>
					<li><a href="">이벤트</a></li>
				</ul>
			</nav>
			<section class="global-all-menu">
				<div class="global-book-list-wrap">
					<div class="global-book-list">
						<h4>
							<a href="${pageContext.request.contextPath }/booklist/category?list=kor&code=0"> 국내도서 전체 
							<span><i class="fa-solid fa-circle-chevron-right"></i></span>
							</a>
						</h4>
						<ul>
							<li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=kor&code=1">소설</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=kor&code=2">시</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=kor&code=3">경제</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=kor&code=4">에세이</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=kor&code=5">요리</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=kor&code=6">문화</a>
					         </li>
						</ul>
					</div>
					<div class="global-book-list">
						<h4>
							<a href="${pageContext.request.contextPath }/booklist/category?list=eng&code=0"> 외국도서 전체 <span><i
									class="fa-solid fa-circle-chevron-right"></i></span>
							</a>
						</h4>
						<ul>
							<li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=eng&code=1">소설</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=eng&code=2">시</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=eng&code=3">경제</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=eng&code=4">에세이</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=eng&code=5">요리</a>
					         </li>
					         <li>
					             <a href="${pageContext.request.contextPath }/booklist/category?list=eng&code=6">문화</a>
					         </li>
						</ul>
					</div>
				</div>
				<div class="global-book-event">
					<ul>
						<li>
							<a href="${pageContext.request.contextPath }/booklist/bestlist"> <i class="fa-solid fa-thumbs-up"></i>
						</a> <span> 베스트 </span></li>
						<li><a href="${pageContext.request.contextPath }/booklist/new"> N </a> <span> 새로나온책 </span></li>
						<li><a href=""> <i class="fa-solid fa-gift"></i>
						</a> <span>이벤트</span></li>
						<li>
						<a href="${pageContext.request.contextPath }/cscenter">
							<i class="fa-solid fa-headset"></i>
						</a> <span> 고객센터 </span>
						</li>
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
	
	//검색어 입력 후 엔터 눌렀을 때
	function handleEnterKey(event) {
	    if (event.key === "Enter") {	
			//event.preventDefault();
	    	searching();
	    }
	}
	//검색버튼 눌렀을 때
 	function searching(){
    	if($("input[name='search']").val().trim() == ""){//검색어 공백일때
    		alert("검색어를 입력해주세요.");
    		$("input[name='search']").focus();
		}else{
			$(".global-search form").submit();
		}
	}
	</script>
</body>
</html>