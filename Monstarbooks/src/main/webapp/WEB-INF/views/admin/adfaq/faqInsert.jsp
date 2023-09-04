<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록</title>
<script>
	function check_insert(){
		var frm = document.insertFaq;
		
		if(frm.fquestion.value == ""){
			alert("질문을 작성해주세요");
			frm.fquestion.focus();
			return false;
		}else if(frm.fanswer.value == ""){
			alert("답변을 작성해주세요");
			frm.fanswer.focus();
			return false;
		}else if(confirm("FAQ를 등록하시겠습니까?")){
			frm.submit();
			alert("FAQ가 등록되었습니다");
			return;
		}else {
			return;
		}
	}
	
	function cancel_insert(){
		if(confirm("FAQ 등록을 취소하시겠습니까?")){
			location.href = "./faq";
		}else {
			return;
		}
	}
	
</script>
</head>
<body>
	<h2>FAQ 등록</h2>
	<hr />
	
	<form action="faqInsert2" name="insertFaq">
		Question. <br />
		<select name="fcategory">
			<option value="반품/교환/환불">반품/교환/환불</option>
			<option value="주문취소/변경">주문취소/변경</option>
			<option value="배송/수령일 안내">배송/수령일 안내</option>
		</select> <br />
		
		<textarea type="text" name="fquestion" rows="10" cols="70" maxlength="500"
		placeholder="질문을 작성해주세요" style="resize: none;"></textarea> <br /> <br /> <br />
		Answer. <br />
		<textarea type="text" name="fanswer" rows="10" cols="70" maxlength="500"
		placeholder="답변을 작성해주세요" style="resize: none;"></textarea>
		<br /> <br />
	
		<input type="button" value="등록" onclick="check_insert();" />
		<input type="button" value="취소" onclick="cancel_insert();" />
		
	</form>
	
</body>
</html>