<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrap{
		height:100vh;
		margin-top:0;
	}
	main{
		min-height:auto;
	}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login/access" method="post" class="login">
		<input type="hidden" name="url" value="${url }" />
		<input type="text" name="id" placeholder="아이디를 입력해주세요." id="id">
		<input type="password" name="pw" placeholder="비밀번호를 입력해주세요" id="pw">
		<!-- <span class="valid-check">아이디 또는 비밀번호를 확인해주세요.</span> -->
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/join/terms';">
		<div class="login-text-wrap">
			<div class="login-save">
				<input type="checkbox" name="remember" id="remember">
				<label for="remember"></label>
				<span>아이디 저장</span>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/find/">아이디 / 비밀번호 찾기</a>
			</div>
		</div>
		<div class="social-wrap">
			<div class="divider">
				<span class="line"></span> <strong class="text">또는</strong> <span
					class="line"></span>
			</div>

			<div class="sns-login-box">
				<ul>
					<li>
						<button type="button">
							<img
								src="${pageContext.request.contextPath}/resources/assets/imgs/kakao.png"
								alt="kakao">
						</button>
					</li>
					<li>
						<button type="button">
							<img
								src="${pageContext.request.contextPath}/resources/assets/imgs/naver.png"
								alt="naver">
						</button>
					</li>
					<li>
						<button type="button">
							<img
								src="${pageContext.request.contextPath}/resources/assets/imgs/google.png"
								alt="google">
						</button>
					</li>
				</ul>
			</div>
			<!-- 로그인 박스 종료 -->
		</div>
		<!-- social-wrap 종료 -->
	</form>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	$(".login").on("submit", function(){
		if($("#id").val()==""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}else if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#pw").focus();
			return false;
		}
	});
	</script>
</body>
</html>