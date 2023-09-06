<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 포함 --> 
</head>
<body>
<h3>productUpdateView.jsp</h3>

	<article>
	<form action="productupdate" method="post" enctype="multipart/form-data" class="updateForm">
	<input type="hidden" name="bookno" value="${dtos.bookno }" />
	<!-- 도서 테이블 -->
		<label for="" style="font-size: 20px;">도서 테이블</label>
		
		<label>도서번호: ${dtos.bookno }</label>
		
		<label for="bisbn">ISBN</label>
		<div class="form-small">
			<input type="text" name="bisbn" value="${dtos.bisbn }" />
			<input type="button" value="ISBN 검색" />
		</div>
		
		<label for="btitle">도서제목</label>
		<input type="text" name="btitle" value="${dtos.btitle }" />
		
		<label for="bsubtitle">도서부제목</label>
		<input type="text" name="bsubtitle" value="${dtos.bsubtitle }" />
		
		<label for="bpublisher">출판사</label>
		<input type="text" name="bpublisher" value="${dtos.bpublisher }" />
		
		<label for="bwriter">저자</label>
		<input type="text" name="bwriter" value="${dtos.bwriter }" />
		
		<label for="btranslator">역자</label>
		<input type="text" name="btranslator" value="${dtos.btranslator }" />
		
		<label for="bpdate">출간일</label>
		<input type="text" name="bpdate" value="${dtos.bpdate }" />
		
		<label for="bprice">정가</label>
		<input type="text" name="bprice" value="${dtos.bprice }" class="bprice"  />
		
		<label for="bdiscount">할인율</label>
		<input type="text" name="bdiscount" value="${dtos.bdiscount }" class="bdiscount" />
		
		<br />
		<button id="upcalDiscount">판매가계산</button>
		<br />
		
		<label for="bpricesell">판매가</label>
		<input type="text" name="bpricesell" value="${dtos.bpricesell }" id="bpricesell" />
		
		<%-- <label for="bstatus">상태</label>
		<input type="text" name="bstatus" value="${dtos.bstatus }" /> --%>
		
		<label for="bstatus">상태</label>
        <select name="bstatus" value="${dtos.bstatus }" id="selectedBstatus" >
            <option value="판매중" ${dtos.bstatus=='판매중' ? 'selected="selected"':'' }>판매중</option>
            <option value="품절" ${dtos.bstatus=='품절' ? 'selected="selected"':'' }>품절</option>
            <option value="숨김" ${dtos.bstatus=='숨김' ? 'selected="selected"':'' }>숨김</option>
        </select>
		<br />
        <br />
        <br />
		
		<!-- <label for="bcdate">등록날짜</label>
		<input type="text" name="bcdate" /> -->
		
		<%-- <label for="bmdate">수정날짜</label>
		<input type="text" name="bmdate" value="${dtos.bmdate }" /> --%> 
		
		<label for="bstock">재고</label>
		<input type="text" name="bstock" value="${dtos.bstock }" />
		
					
			
	<!-- 도서 상세 테이블 -->
		<label for="" style="font-size: 20px;">도서 디테일 테이블</label>
		
		<label for="bimg">도서썸네일</label>
		<label for="">${dtos.bookDetailDto.bimg}</label>
		<input type="file" name="bimg" value="${dtos.bookDetailDto.bimg }" />
		
		<label for="bimgdetail">도서상세이미지</label>
		<label for="">${dtos.bookDetailDto.bimgdetail}</label>
		<input type="file" name="bimgdetail" value="${dtos.bookDetailDto.bimgdetail }" />
		
		<label for="bdescription">도서설명</label>
		<input type="text" name="bdescription" value="${dtos.bookDetailDto.bdescription }" />
		
		<label for="bpage">전체페이지</label>
		<input type="text" name="bpage" value="${dtos.bookDetailDto.bpage }" />
		
		<label for="bsize">도서크기</label>
		<input type="text" name="bsize" value="${dtos.bookDetailDto.bsize }" />
		
		<label for="badge">상품뱃지</label>
		<select name="bstatus" value="${dtos.bstatus }" id="selectedBstatus" >
            <option value="신상품" ${dtos.bstatus=='신상품' ? 'selected="selected"':'' }>신상품</option>
            <option value="베스트" ${dtos.bstatus=='베스트' ? 'selected="selected"':'' }>베스트</option>
            <option value="주문폭주" ${dtos.bstatus=='주문폭주' ? 'selected="selected"':'' }>주문폭주</option>
        </select>
		<br />
        <br />
        <br />
		<input type="text" name="badge" value="${dtos.bookDetailDto.badge }" />
						
				
	<!-- 도서 카테고리 테이블 -->
		<label for="" style="font-size: 20px;">도서 카테고리 테이블</label>	
				
			<c:set var="selectedValue" value="${selectedValue}" />
			<div>
				<label for="">카테고리</label>
					<c:forEach items="${dto }" var="dto">
					<tr>
						<td><input type="radio" name="bcategoryno" value="${dto.bcategoryno }"
						<c:if test="${dto.bcategoryno eq selectedValue}">checked</c:if> />
						${dto.bcategory1 } >> ${dto.bcategory2 }</td>
					</tr>
				</c:forEach>
			</div>
				
				
				
				
				
			<!-- 	<label for="bcategory">카테고리</label>
					<form action="" method="post">
			    		<select name="category1" id="category1">
				          <option>----- 상위 카테고리 -----</option>
				          <option value="국내도서">국내도서</option>
				          <option value="외국도서">외국도서</option>
				        </select>
				        <select name="category2" id="category2">
				          <option>----- 하위 카테고리 -----</option>
				          <option value="소설">소설</option>
				          <option value="시">시</option>
				          <option value="경제">경제</option>
				          <option value="에세이">에세이</option>
				          <option value="요리">요리</option>
				          <option value="문화">문화</option>
				        </select>
					</form> -->
					
		<br />
		<br />
		<br />
		<br />
		<br />
			
			
				
				
				
		
		<input type="submit" value="수정하기" />
		<a href="productlist">목록으로</a>
	</form>
	</article>
	
				
	<script>
		document.title = "상품수정";
		
		$(document).ready(function(){
		   $("#upcalDiscount").click(function(){
		      var price = Number($(".bprice").val());
		      var discount = Number($(".bdiscount").val());
		      
		      // 할인율 계산 후 결과를 #bpricesell 입력란에 표시
		      $("#bpricesell").val(price - (price * discount * 0.01));
		      
		    //form submit 막기
			   $(".updateForm").submit(function(e){
			      e.preventDefault();
			      $(".updateForm").unbind();
			   })
		   });
		});
	</script>
</body>
</html>