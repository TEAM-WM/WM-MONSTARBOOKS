<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>몬스타북:FAQ</title>

<script>
	function check_faqInsert(){
		if(confirm("FAQ를 등록하시겠습니까?")){
			location.href = "./faqInsert";
		}else {
			return;
		}
	}
	
	function select_fcategory1(){
		location.href = "faq";
	}
	
	function select_fcategory2(){
		location.href = "faq2";
	}
	
	function select_fcategory3(){
		location.href = "faq3";
	}
	
	
</script>
</head>
<body>
<h2>FAQ</h2>

	<div class="category">
		<input type="button" value="반품/교환/환불" onclick="select_fcategory1();">
		<input type="button" value="주문취소/변경" onclick="select_fcategory2();">
		<input type="button" value="배송/수령일 안내" onclick="select_fcategory3();">
	</div>

<button onclick="check_faqInsert();">등록</button>

<div>
	<ul>
		<c:forEach items="${faq }" var="faq">
		
			<li>
			<!-- 질문 -->
				<div class="faq_question">
					<h3>${faq.fquestion }</h3>
					<!-- 수정을 하겠냐고 되묻는 팝업창 생성 해야 함 -->
					<button><a href="faqUpdate?faqno=${faq.faqno }">수정</a></button>
					<!-- 삭제를 하겠냐고 되묻는 팝업창 생성해야 함 -->
					<button><a href="faqDelete?faqno=${faq.faqno }">삭제</a></button>
				</div>
				
			<!-- 답변 -->
				<div class="faq_answer">
					<p>${faq.fanswer }</p>
				</div>
			</li>
			
		</c:forEach>
	</ul>
</div>
	
</body>
</html>