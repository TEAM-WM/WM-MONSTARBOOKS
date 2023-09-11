<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body onload="">
<!-- <link rel="stylesheet" href="../css/join_style.css" /> -->
<style>
/* .pw{
margin-botom:20px;

} */
</style>
<script>

	function goJoinForm(){
		
		location.href="../join/join.jsp";
	}
	
	function checkValue(){
		
		inputForm=eval("document.loginInfo");
		
		if(!inputForm.mid.value){
			//alert(11);
			inputForm.mid.focus();
			return false;
			
		}
		
		
		if(!inputForm.mpwd.value){
			//alert(11);
			inputForm.mpwd.focus();
			return false;
			
		}
	}
	
	window.onload = function() {
		
		document.loginInfo.mpw.focus();
		  
		  console.log('로딩 완료');
		 }
</script>
<div id="wrap">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:if test="${param.result eq 0 }">
<script>
	alert('비밀번호가 틀립니다');
</script>
</c:if>
<form action="${pageContext.request.contextPath}/mypage/pwCheck" name="loginInfo" 
method="post" onsubmit="return pwCheck();">
<!-- 	<img src="../img/welcome.jpg" alt="wel_img" /> <br /><br /> -->
	<table width="340">
		
			<tr>
			<td bgcolor="skyblue" class="pw"><h2>비밀번호</h2></td>
			<td><input type="password" id="pwd" name="mpw" value=""/></td>
		</tr>
	
	</table>
	<input type="submit"  value="login"/>
<!-- 	<input type="button"  value="join" onclick="goJoinForm();"/> -->
</form>

<script>


//검색폼 쳄크 자바스크립트
    function pwCheck(){
		var frm	= document.loginInfo;
	
		
		
        if (frm.mpw.value.length<4){
            alert("비밀번호를 4자리 이상으로 입력하세요");
			frm.mpw.focus();

            return false;
        }

    }

    <!--
//-->
</script>
</div>
</body>
</html>