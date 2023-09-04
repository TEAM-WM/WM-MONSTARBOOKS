<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>

<script>
	function check_update(){
		var frm = document.updateFaq;
		
		if(frm.fquestion.value==""){
			alert("질문을 작성해주세요");
			frm.fquestion.focus();
			return false;
		}else if(frm.fanswer.value==""){
			alert("답변을 작성해주세요");
			frm.fanswer.focus();
			return false;
		}else if(confirm("FAQ를 수정하시겠습니까?")){
			frm.submit();
			alert("FAQ가 수정되었습니다");
			return;
		}else {
			return;
		}
	}
	
	function cancel_update(){
		if(confirm("FAQ 수정을 취소하시겠습니까?")){
			location.href = "./faq";
		}else {
			return;
		}
	}	
	
	
</script>
</head>
<body>
	<h2>FAQ 수정</h2>
	<hr />
	<form action="faqUpdate2" name="updateFaq">
	<input type="hidden" name="faqno" value="${faqDetail.faqno }" />
		Question. <br />
		
		<!-- 드롭다운 중복값 제거 못했음 / 해야함 -->
		<select name="fcategory">
			<option value="${faqDetail.fcategory }" selected>${faqDetail.fcategory }</option>
			<option id="fcategory1" value="반품/교환/환불">반품/교환/환불</option>
			<option id="fcategory2" value="주문취소/변경">주문취소/변경</option>
			<option id="fcategory3" value="배송/수령일 안내">배송/수령일 안내</option>
		</select> <br />
		
		<textarea type="text" name="fquestion" rows="10" cols="70" maxlength="500"
		style="resize: none;">${faqDetail.fquestion }</textarea> <br /><br /><br />
		Answer. <br />
		<textarea type="text" name="fanswer" rows="10" cols="70" maxlength="500"
		style="resize: none;">${faqDetail.fanswer }</textarea>
		<br /><br />
		
		<input type="button" value="수정" onclick="check_update();" />
		<input type="button" value="취소" onclick="cancel_update();" />
		
	</form>
	
	
</body>
</html>