<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="step-list">
		<ul>
			<li>약관동의</li>
			<li class="active">정보입력</li>
			<li>가입완료</li>
		</ul>
	</div>
	<form action="./access" method="post" class="join left">
		<label for="id">아이디</label>
		<div class="form-small">
			<input type="text" name="id" placeholder="아이디를 입력해주세요." id="id" minlength="5" maxlength="13" required>
			<input type="button" value="중복확인" />
		</div>
		<span class="form-sapn">5자리 이상 13자리 이하 영문과 숫자 조합만 가능합니다.</span>
		<label for="pw">비밀번호</label>
		<input type="password" name="pw" placeholder="비밀번호를 입력해주세요" id="pw" minlength="6" maxlength="20">
		<span class="form-sapn">영문, 숫자, 특수문자 중 2가지 조합하여 6~20자리 이하</span>
		
		<label for="pwCheck">비밀번호 확인</label>
		<input type="password" name="pwCheck" placeholder="비밀번호를 입력해주세요" id="pwCheck">
		
		<label for="name">이름</label>
		<input type="text" name="name" placeholder="이름을 입력해주세요." id="name" required>
		
        <label for="birth">생년월일</label>
        <input type="date" id="birth" name="birth" placeholder="생년월일을입력해주세요" required>
        
        <label for="tel">전화번호</label>
        <input type="tel" name="tel" id="tel" placeholder="ex)01000000000" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" required>
        
        <label for="email">이메일</label>
        <input type="email" name="email" id="email" placeholder="이메일을 입력하세요" required>
		
		<label for="adress">주소</label>
		<div class="form-small">
			<input type="text" name="adress" placeholder="주소를 입력해주세요." id="adress" readonly />
			<input type="button" value="주소검색" id="adress-btn" />
		</div>
		<input type="text" name="adressDetail" placeholder="상세주소를 입력해주세요." />
		
		<label for="favorite">선호장르</label>
		<div class="favorite-box">
			<input type="checkbox" name="favorite" id="favorite01" value="소설"/>
			<label for="favorite01">소설</label>
			<input type="checkbox" name="favorite" id="favorite02" value="시/에세이"/>
			<label for="favorite02">시/에세이</label>
			<input type="checkbox" name="favorite" id="favorite03" value="인문"/>
			<label for="favorite03">인문</label>
			<input type="checkbox" name="favorite" id="favorite04" value="가정/육아"/>
			<label for="favorite04">가정/육아</label>
			<input type="checkbox" name="favorite" id="favorite05" value="요리"/>
			<label for="favorite05">요리</label>
			<input type="checkbox" name="favorite" id="favorite06" value="정치/사회"/>
			<label for="favorite06">정치/사회</label>
			<input type="checkbox" name="favorite" id="favorite07" value="경제/경영"/>
			<label for="favorite07">경제/경영</label>
			<input type="checkbox" name="favorite" id="favorite08" value="역사/문화"/>
			<label for="favorite08">역사/문화</label>
			<input type="checkbox" name="favorite" id="favorite09" value="컴퓨터/IT"/>
			<label for="favorite09">컴퓨터/IT</label>
			<input type="checkbox" name="favorite" id="favorite10" value="건강"/>
			<label for="favorite10">건강</label>
			<input type="checkbox" name="favorite" id="favorite11" value="스포츠"/>
			<label for="favorite11">스포츠</label>
			<input type="checkbox" name="favorite" id="favorite12" value="자기계발"/>
			<label for="favorite12">자기계발</label>
		</div>
		
		<input type="submit" value="회원가입">
	</form>


	<!-- 카카오지도 -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
	    document.getElementById("adress-btn").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("adress").value = data.address; // 주소 넣기
	                document.querySelector("input[name=adressDetail]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	</script>
</body>
</html>