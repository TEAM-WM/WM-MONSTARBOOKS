<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 포함 --> 
</head>
<body>

	<form action="productupdate" method="post" enctype="multipart/form-data" class="updateForm admin-book-form">
	<input type="hidden" name="bookno" value="${dtos.bookno }" />
	<!-- 도서 테이블 -->
		<label for="" style="font-size: 20px;">도서 테이블</label>
		
		<label>도서번호: ${dtos.bookno }</label>
		
		<label for="bisbn">ISBN</label>
		<div class="form-small">
			<input type="text" name="bisbn" value="${dtos.bisbn }" />
		<!-- 	<input type="button" value="ISBN 검색" /> -->
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
		<div class="form-small">
		<input type="text" name="bdiscount" class="bdiscount"  value="${dtos.bdiscount }"/>
		<input type="button" id="calDiscount" value="판매가계산">
		</div>
		
		<label for="bpricesell">판매가</label>
		<input type="text" name="bpricesell" value="${dtos.bpricesell }" id="bpricesell" />
		
		<%-- <label for="bstatus">상태</label>
		<input type="text" name="bstatus" value="${dtos.bstatus }" /> --%>
		
		<label for="bstatus">상태</label>
		<div class="select-group">
			<select name="bstatus" id="selectedBstatus" class="form-select">
				<option value="판매중"
					${dtos.bstatus=='판매중' ? 'selected="selected"':'' }>판매중</option>
				<option value="품절" ${dtos.bstatus=='품절' ? 'selected="selected"':'' }>품절</option>
				<option value="숨김" ${dtos.bstatus=='숨김' ? 'selected="selected"':'' }>숨김</option>
			</select>
		</div>
        <%-- <select name="bstatus" value="${dtos.bstatus }" id="selectedBstatus" >
            <option value="판매중" ${dtos.bstatus=='판매중' ? 'selected="selected"':'' }>판매중</option>
            <option value="품절" ${dtos.bstatus=='품절' ? 'selected="selected"':'' }>품절</option>
            <option value="숨김" ${dtos.bstatus=='숨김' ? 'selected="selected"':'' }>숨김</option>
        </select>
		<br />
        <br />
        <br /> --%>
		
		<!-- <label for="bcdate">등록날짜</label>
		<input type="text" name="bcdate" /> -->
		
		<%-- <label for="bmdate">수정날짜</label>
		<input type="text" name="bmdate" value="${dtos.bmdate }" /> --%> 
		
		<label for="bstock">재고</label>
		<input type="text" name="bstock" value="${dtos.bstock }" />
		
					
			
	<!-- 도서 상세 테이블 -->
		<label for="" style="font-size: 20px;margin-top:40px; margin-bottom:10px;">도서 디테일 테이블</label>
		
		<label for="bimg">도서썸네일</label>
		<label for="">${dtos.bookDetailDto.bimg}</label>
		<input type="file" name="bimg" value="${dtos.bookDetailDto.bimg }" />
		
		<label for="bimgdetail">도서상세이미지</label>
		<label for="">${dtos.bookDetailDto.bimgdetail}</label>
		<input type="file" name="bimgdetail" value="${dtos.bookDetailDto.bimgdetail }" />
		
		<label for="bdescription">도서설명</label>
		<textarea name="bdescription">${dtos.bookDetailDto.bdescription }</textarea>
		
		<label for="bpage">전체페이지</label>
		<input type="text" name="bpage" value="${dtos.bookDetailDto.bpage }" />
		
		<label for="bsize">도서크기</label>
		<input type="text" name="bsize" value="${dtos.bookDetailDto.bsize }" />
		
		<label for="badge">상품뱃지</label>
		<div class="select-group">
			<select name="badge" class="form-select">
				<option value="신상품" ${dtos.bookDetailDto.badge=='신상품' ? 'selected="selected"':'' }>신상품</option>
	            <option value="베스트" ${dtos.bookDetailDto.badge=='베스트' ? 'selected="selected"':'' }>베스트</option>
	            <option value="주문폭주" ${dtos.bookDetailDto.badge=='주문폭주' ? 'selected="selected"':'' }>주문폭주</option>
			</select>
		</div>
				
	<!-- 도서 카테고리 테이블 -->
		<label for="" style="font-size: 20px;margin-top:40px; margin-bottom:10px;">도서 카테고리 테이블</label>
		<c:set var="selectedValue" value="${selectedValue}" />
		<label for="">카테고리</label>
		<div class="select-group">
			<select name="bcategoryno" class="form-select">
			<c:forEach items="${dto }" var="dto">
				<option value="${dto.bcategoryno }" <c:if test="${dto.bcategoryno eq selectedValue}">selected</c:if>>${dto.bcategory1 } / ${dto.bcategory2 }</option>
			</c:forEach>
			</select>
		</div>
<%-- 		<c:forEach items="${dto }" var="dto">
			<tr>
				<td><input type="radio" name="bcategoryno"
					value="${dto.bcategoryno }"
					<c:if test="${dto.bcategoryno eq selectedValue}">checked</c:if> />
					${dto.bcategory1 } >> ${dto.bcategory2 }</td>
			</tr>
		</c:forEach>
 --%>
		<div class="btn-wrap" style="width:auto; margin-top:20px;">
			<input type="submit" value="등록하기" />
			<input type="button" onclick="location.href='productlist'" value="취소하기">
		</div>
	</form>
	
				
	<script>
	// "수정하기" 버튼 클릭 시 폼을 제출하기 전에 파일 필드를 검사
	document.querySelector(".updateForm").addEventListener("submit", function (event) {
	  
	  var bimgInput = document.querySelector('input[name="bimg"]');
	  var bimgValue = bimgInput.value;
	  
	  var bimgdetailInput = document.querySelector('input[name="bimgdetail"]');
	  var bimgdetailValue = bimgdetailInput.value;
	
	  // 파일 필드 값이 둘 다 비어있는 경우 경고창 표시하고 폼 제출 취소
	  if (bimgValue === "" && bimgdetailValue === "") {
	    alert("도서썸네일과 도서상세이미지를 선택하세요.");
	    event.preventDefault(); // 폼 제출 취소
	  }
	});
	</script>
</body>
</html>