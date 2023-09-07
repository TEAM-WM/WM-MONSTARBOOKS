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
<h3>productInsertView.jsp</h3>

	<article>
	<form action="productinsert" method="post" enctype="multipart/form-data" class="insertForm">
	<!-- 도서 테이블 -->
		<label for="" style="font-size: 20px;">도서 테이블</label>
		<label for="ISBN">ISBN</label>
		<div class="form-small">
			<input type="text" name="bisbn" />
			<input type="button" value="ISBN 검색" />
		</div>
		<label for="btitle">도서제목</label>
		<input type="text" name="btitle" />
		
		<label for="bsubtitle">도서부제목</label>
		<input type="text" name="bsubtitle" />
		
		<label for="bpublisher">출판사</label>
		<input type="text" name="bpublisher" />
		
		<label for="bwriter">저자</label>
		<input type="text" name="bwriter" />
		
		<label for="btranslator">역자</label>
		<input type="text" name="btranslator" />
		
		<label for="bpdate">출간날짜</label>
		<input type="text" name="bpdate" />
		
		<label for="bprice">정가</label>
		<input type="text" name="bprice" class="bprice" />
		
		<label for="bdiscount">할인율</label>
		<input type="text" name="bdiscount" class="bdiscount" />
		
		<br />
		<button id="calDiscount">판매가계산</button>
		<br />
		
		<label for="bpricesell">판매가</label>
 	    <input type="text" name="bpricesell" id="bpricesell" />
		
		<!-- <label for="bstatus">상태</label>
		<input type="text" name="bstatus" /> -->
		
		<label for="bstatus">상태</label>
        <select name="bstatus" id="selectedBstatus" >
            <option value="판매중">판매중</option>
            <option value="품절">품절</option>
            <option value="숨김">숨김</option>
        </select>
		<br />
        <br />
        <br />
		
		
		<!-- <label for="bcdate">등록날짜</label>
		<input type="text" name="bcdate" /> -->
		<!-- <label for="bmdate">수정날짜</label>
		<input type="text" name="bmdate" /> -->
		
		<label for="bstock">재고</label>
		<input type="text" name="bstock" />
		<br />
        <br />
        <br />
			
	<!-- 도서 상세 테이블 -->
		<label for="" style="font-size: 20px;">도서 디테일 테이블</label>
		<label for="bimg">도서썸네일</label>
		<input type="file" name="bimg" />
		
		<label for="bimgdetail">도서상세이미지</label>
		<input type="file" name="bimgdetail" />
		
		<label for="bdescription">도서설명</label>
		<input type="text" name="bdescription" />
		
		<label for="bpage">전체페이지</label>
		<input type="text" name="bpage" />
		
		<label for="bsize">도서크기</label>
		<input type="text" name="bsize" />
		
		<!-- <label for="badge">상품뱃지</label>
		<input type="text" name="badge" /> -->
		
		<label for=badge>상품뱃지</label>
        <select name="badge" >
            <option value="신상품">"신상품"</option>
            <option value="베스트">베스트</option>
            <option value="주문폭주">주문폭주</option>
        </select>
        <br />
        <br />
        <br />
						
				
	<!-- 도서 카테고리 테이블 -->
		<label for="" style="font-size: 20px;">도서 카테고리 테이블</label>	
				
			<div>
				<label for="">카테고리</label>
					<c:forEach items="${dto }" var="dto">
					<tr>
						<td><input type="radio" name="bcategoryno" value="${dto.bcategoryno }" />${dto.bcategory1 } >> ${dto.bcategory2 }</td>
					</tr>
				</c:forEach>
			</div>
				
				

				
				
				
				
		<!-- 		<label for="bcategory">카테고리</label>
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
					</form>
					 -->
		<br />
		<br />
		<br />
		<br />
		<br />
			
			
				
				
				
		
		<input type="submit" value="등록하기" />
		<a href="productlist">취소하기</a>
	</form>
	</article>
	
				
	<script>
	document.title = "상품등록";
	
	
	
	$(document).ready(function(){
	   $("#calDiscount").click(function(){
	      var price = Number($(".bprice").val());
	      var discount = Number($(".bdiscount").val());
	      
	      // 할인율 계산 후 결과를 #bpricesell 입력란에 표시
	      $("#bpricesell").val(price - (price * discount * 0.01));
	      
	    //form submit 막기
		   $(".insertForm").submit(function(e){
		      e.preventDefault();
		      $(".insertForm").unbind();
		   })
	   });
	});
	</script>
</body>
</html>