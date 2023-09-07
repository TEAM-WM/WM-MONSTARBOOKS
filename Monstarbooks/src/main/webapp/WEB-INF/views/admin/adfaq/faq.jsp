<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>몬스타북:FAQ</title>

<script>
	// onclick
	function check_faqInsert(){
		if(confirm("FAQ를 등록하시겠습니까?")){
			location.href = "./faqInsert";
		}else {
			return;
		}
	}
	
	function select_fcategory1(){
		location.href = "faq1";
	}
	
	function select_fcategory2(){
		location.href = "faq2";
	}
	
	function select_fcategory3(){
		location.href = "faq3";
	}
	
	function check_faqDelete(i){
		if(confirm("FAQ를 삭제하시겠습니까?")){
			location.href = "faqDelete?faqno=" + i;
			alert("FAQ가 삭제되었습니다");
			return;
		}else {
			return;
		}
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

	<!-- 아코디언 메뉴 -->
	<div>
		<ul>
			<c:forEach items="${faq }" var="faq">
				<li>
					<!-- 질문 -->
					<div>
						<h3>Q. ${faq.fquestion }</h3>
						<a href="faqUpdate?faqno=${faq.faqno }&fcategory=${faq.fcategory}">수정</a>
						<button onclick="check_faqDelete(${faq.faqno});">삭제</button>
						<button type="button">펼치기</button>
					</div>
				
					<!-- 답변 -->
					<div>
						<p>A. ${faq.fanswer }</p>
					</div>
				</li>
			</c:forEach>			
		</ul>
	</div>
	
</body>
</html>

