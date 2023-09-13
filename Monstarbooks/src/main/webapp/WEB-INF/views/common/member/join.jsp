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
	<form action="${pageContext.request.contextPath}/join/access" method="post" class="join left">
		<!-- hidden input으로 파라미터 값을 넘김 -->
    	<input type="hidden" name="termsAll" value="${param.termsAll}">
    	<input type="hidden" name="policyAgree" value="${param.policyAgree}">
    	<input type="hidden" name="privacyAgree" value="${param.privacyAgree}">
    	<input type="hidden" name="limitAgree" value="${param.limitAgree}">
    	
		<label for="id">아이디</label>
		<div class="form-small">
			<input type="text" name="id" placeholder="아이디를 입력해주세요." id="id" required>
			<input type="button"  id="checkBtn" value="중복확인" />
		</div>
		<span class="form-sapn">5~13자리 이하 영문 혹은 영문과 숫자 조합만 가능합니다.</span>
		<span class="form-sapn" id="idAlert">아이디를 양식에 맞춰서 입력해주세요.</span>
		<span class="form-sapn none" id="checkResult"></span>
		<span class="form-sapn none" id="checkId"></span>
		
		<label for="pw">비밀번호</label>
		<input type="password" name="pw" placeholder="비밀번호를 입력해주세요" id="pw" minlength="6" maxlength="20">
		<span class="form-sapn">영문, 숫자, 특수문자 중 2가지 조합하여 5~20자리 이하</span>
		<span class="form-sapn" id="pwdAlert"> 비밀번호 양식에 맞춰서 입력해주세요.</span>
		
		<label for="pwCheck">비밀번호 확인</label>
		<input type="password" name="pwCheck" placeholder="비밀번호를 입력해주세요" id="pwCheck">
		<span class="form-sapn" id="alert-success">비밀번호가 일치합니다.</span>
		<span class="form-sapn" id="alert-danger">비밀번호가 일치하지 않습니다.</span>
				
		<label for="name">이름</label>
		<input type="text" name="name" placeholder="이름을 입력해주세요." id="name" required>
		
        <label for="birth">생년월일</label>
        <input type="date" id="birth" name="birth" placeholder="생년월일을입력해주세요" required>
        
        <label for="tel">전화번호</label>
        <input type="tel" name="tel" id="tel" placeholder="ex)01000000000" required>
        
        <label for="email">이메일</label>
        <input type="email" name="email" id="email" placeholder="이메일을 입력하세요" required>
		
		<!-- <label for="adress">주소</label>
		<div class="form-small">
			<input type="text" name="adress" placeholder="주소를 입력해주세요." id="adress" readonly />
			<input type="button" value="주소검색" id="adress-btn" />
		</div>
		<input type="text" name="adressDetail" placeholder="상세주소를 입력해주세요." /> -->
		
		<label for="favorite">선호장르</label>
		<div class="favorite-box">
			<input type="checkbox" name="favorite" id="favorite01" value="소설"/>
			<label for="favorite01">소설</label>
			<input type="checkbox" name="favorite" id="favorite02" value="시"/>
			<label for="favorite02">시</label>
			<input type="checkbox" name="favorite" id="favorite03" value="경제"/>
			<label for="favorite03">경제</label>
			<input type="checkbox" name="favorite" id="favorite04" value="에세이"/>
			<label for="favorite04">에세이</label>
			<input type="checkbox" name="favorite" id="favorite05" value="요리"/>
			<label for="favorite05">요리</label>
			<input type="checkbox" name="favorite" id="favorite06" value="문화"/>
			<label for="favorite06">문화</label>
		</div>
		
		<input type="submit" value="회원가입" id="submit">
	</form>

	<!-- 카카오지도 -->
	<!-- <script
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
	</script> -->
	
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
	//=========== 아이디 중복 확인 =======================
	let isChecked = false;
	let canUseId=false;
	$("#checkBtn").on("click", function(){
		
		let inputId = $("#id").val();
		console.log(inputId);
		isChecked = true;
		
		$.ajax({
			url : "member/checkid",
			method : "get",
			data : "inputId="+inputId,
			success : function(data){
				if(data.isExist == null){
					$("#checkResult").text("사용 가능한 아이디입니다.");
					$("#checkResult").removeClass("none");
					$("#checkId").addClass("none");
					canUseId=true;
				}else{
					$("#checkResult").text("사용이 불가한 아이디입니다.");
					$("#checkResult").removeClass("none");
					$("#checkId").addClass("none");
					canUseId=false;
				}
			}
		}); 
		return false;
	});
	
	$(".join").on("submit", function(){
		if(!canUseId){
			event.preventDefault(); // 폼 제출 방지
			$("#checkId").text("입력하신 아이디의 중복확인을 해주세요.");	
			$("#checkId").removeClass("none");
			return false;
		}
	})
	
    const regCheckID = RegExp(/^[a-z0-9]{5,13}$/);
    const regCheckPW = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{5,20}$/;
    const regCheckName = RegExp(/^[가-힣]|[A-Z]|[a-z]$/);
    const regCheckPhone = RegExp(/^[0-9]+$/);        
    const regCheckEmail = RegExp(/^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$/);
	//=========아이디 영문/숫자 제한==============
	$("#idAlert").hide();
	$("#id").keyup(function(){
		const chkId = $(this).val();
		if(!regCheckID.test(chkId)){ // 정규표현식 메소드 값 일치하는지 여부
			$("#idAlert").show();
			$("#checkBtn").prop("disabled", true); // 유효하지 않은 아이디일 경우 중복확인 버튼 비활성화
			// 중복체크 결과 및 메시지 초기화
            $("#checkResult").addClass("none").text("");
            $("#checkId").addClass("none").text(""); 
			canUseId = false;
		}else{
			$("#idAlert").hide();
			 canUseId = true;
			 $("#checkBtn").prop("disabled", false); // 유효한 아이디일 경우 중복확인 버튼 활성화
			// 중복체크 결과 및 메시지 초기화
			 $("#checkResult").addClass("none").text("");
	         $("#checkId").addClass("none").text(""); 
		}
	})
		
	//==========  비밀번호 재확인 일치불일치 =============
	let canUse = false;
	$("#alert-success").hide();
	$("#alert-danger").hide();
	
	$(".join").keyup(function(){
		const pwd1 = $("#pw").val();
		const pwd2 = $("#pwCheck").val();
		console.log(pwd1);
		console.log(pwd2);
		if(pwd1!="" || pwd2!=""){
			if(pwd1==pwd2){
				$("#alert-success").show();
				$("#alert-danger").hide();
				 canUse = true;
			}else{
				$("#alert-success").hide(); 
				$("#alert-danger").show();
				 canUse = false;
			}
		}
	});
	//=========비밀번호 영문/숫자/특수문자 제한===========
	
	$("#pwdAlert").hide();
	$("#pw").keyup(function(){
		const password = $(this).val();
		if(!regCheckPW.test(password)){ // 정규표현식 메소드 값 일치하는지 여부
			$("#pwdAlert").show();
			 canUse = false;
		}else{
			$("#pwdAlert").hide();
			 canUse = true;
		}
	});
	
	$("#submit").on("click", function(){
		if(!isChecked){
			alert("아이디 중복확인을 해주세요")
			$("#id").focus();
			return false;
		}else if($("#pw").val() == "" || $("#pw").val() != $("#pwCheck").val()){
			alert("비밀번호를 확인하세요.")
			$("#pw").focus();
			return false;
		}else if($("#pw").val().length < 5){
			alert("비밀번호는 5자 이상 20자리 이하의 영문/숫자/특수문자 중 두가지 이상 사용가능합니다.")
			$("#pw").focus();
			return false;
		}else if($("#email").val() == "" || !regCheckEmail.test($("#email").val())){
			alert("이메일을 확인하세요")
			$("#email").focus();
			return false;
		}else if($("#tel").val() == "" || $("#tel").val().length < 9 || !regCheckPhone.test($("#tel").val())){
			alert("연락처를 확인하세요")
			$("#tel").focus();
			return false;
		}else if($("#name").val() == "" || !regCheckName.test($("#name").val())|| $("#name").val().length > 13){
			alert("이름을 확인하세요")
			$("#name").focus();
		}else if(!canUse){
			alert("잘못입력하신 가입란이 있습니다. 다시 확인해주세요.")
			return false;
		}
	})
	</script>
</body>
</html>