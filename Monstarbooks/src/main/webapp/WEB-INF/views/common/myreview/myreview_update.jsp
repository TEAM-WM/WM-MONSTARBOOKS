<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>
	function redeptlist(target) {
		alert("target : "+target.value);
		var htmltxt="";
		//var pointvalue=document.getElementById("point").value;
		$('input[name=rstar]').attr('value',target.value);
		
	
	}
	
	function redeptlist() {
		<%-- alert("<%=path%>"); --%>
		var htmltxt="";
		$.ajax({
			type:"post",
			url:"<%=path%>/myreview_list",
			success:function(result){
				htmltxt="<table border='1'>";
				
				for ( var ele in result) {
					/* console.log(result[ele].loc); */
					htmltxt=htmltxt+"<tr><td>no:"+result[ele].reviewno+
					"</td><td>memberno:"+result[ele].memberno+"</td>"+
					"<td>loc:"+result[ele].loc+"</td></tr>";
					
				}
				
				htmltxt=htmltxt+"</table>";
				$("#display").html(htmltxt);
			}
			
		});
	}
	</script>

<script type="text/javascript">
   function getvalue(target) {
		alert(target.value);
		
	} 

   </script>


<style>
div {
width:550px;
}
form {
width: 550px;
align: center;
padding: 0 0 0 10px;
}
table {
width: 550px;
align: center;
}

tr, td {
	padding: 10px 0px 10px 0px;
}

.relist {
	margin-left: auto;
	margin-right: auto;
	display: block;
	width: 100%;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	padding-top: 15px;
	border-radius: 5px;
	border: 1px solid #d9d9d9;
	color: #767676;
	background-color: var(- -color-white);
	font-weight: var(- -weight-bold);
	color: var(- -color-main);
	
.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}
.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: auto;
}
.star span {
	width: 0;
	position: absolute; 
	left: 0;
	color: orange;
	overflow: hidden;
	
}
</style>

</head>
<!-- 	리뷰번호,회원번호,회원아이디,도서명,후기내용,별점,사진첨부,카테고리1,2 -->
<!--  230830 [효슬] 리뷰 상세페이지 수정폼 구현 -->
<body>
	<br />
	<br />

	<h3>리뷰 수정</h3>
	<form action="reviewupdate" method="post">
	<br />
	<table>
		<tr>
			<td colspan="2">
			<input type="hidden" name="reviewno" value="${myreview_view.reviewrno }" />
			<input type="hidden" name="memberno" value="${myreview_view.memberno }" /></td>
		</tr>
	
	<tr>
			<td colspan="2" style="border-bottom: 1px solid; border-color: darkgray;"
				class="left">[${myreview_view.bookcategory.bcategory1 }│${myreview_view.bookcategory.bcategory2 }]
				&nbsp;제목 ${myreview_view.rtitle } <br />
			<br />
			</td>
		</tr>

		<tr>
			<td class="left">별점</td>
				<td class="left"	colspan="3">
			      <c:choose>
              <c:when test="${myreview_view.rstar == 1}">
                ★
              </c:when>
              <c:when test="${myreview_view.rstar == 2}">
                ★★
              </c:when>
              <c:when test="${myreview_view.rstar == 3}">
                ★★★
              </c:when>
              <c:when test="${myreview_view.rstar == 4}">
                ★★★★
              </c:when>
              <c:when test="${myreview_view.rstar == 5}">
                ★★★★★
              </c:when>
            </c:choose></td>			
			</tr>
		<tr>
			<td class="left">후기</td>
			<td>${myreview_view.rcontent }</td>
		</tr>
		<tr>
			<td class="left">첨부</td>
			<td><input type="file" name="refilesrc" /></td>
		</tr>
		
		<tr>			
			<td colspan="2">
			
mid: <input type="text" name="mid" value="${myreview_list.mid }" />
				<input type="submit" value="save" />
				<a href="myreview_list" class="relist">list</a>
			</td>
		</tr>
	</table>
	<br />
	<br />
	
		<div class="left">
			<input type="hidden" name="point" value="" size="20" />
			<input type="file" name="refilesrc" accept=".jpg, .png, .gif" onchange="imageChoose(this)" />
				<br />
				<input type="submit" value="update" />
				<a href="myreview_list" class="relist">list</a>

		</div>
	</form>


</body>
</html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	<!--  별점 수정할 것 -->
	<%-- 	<c:forEach items="${reviewupdate }" var="star">
		<tr>
			<td class="star">별점 ${star.reviewno } | ${star.memberno }</td>
			<td><input type="range" onclick="redeptlist(this);"
				oninput="drawStar(this)" value="1" step="1" min="0" max="5">
			</td>
			<td align="center">
					<span class="star">
				      	  ★★★★★
				        <span id="star2" style="width:${star.rstar*20}%">★★★★★</span>
				        <input type="range" value="1" step="1" min="0" max="5">
					</span>
				</td>
		</tr>
		</c:forEach> --%>
		<%-- 			<td><input type="text" name="rstar"
					value="${myreview_list.rstar }" /></td> --%>
					
		<!-- <tr>					
					<td class="left">첨부</td>
					<td><input type="file" name="refilesrc" accept=".jpg, .png, .gif" onchange="imageChoose(this)" /></td>
				</tr>
			<tr>
				<td colspan="2"><input type="submit" value="update" />
					<a href="myreview_list" class="relist">list</a></td>
			</tr> -->
	