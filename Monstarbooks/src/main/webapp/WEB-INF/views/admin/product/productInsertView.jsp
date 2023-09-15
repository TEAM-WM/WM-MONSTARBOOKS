<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
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
			<!-- <input type="text" name="bisbn" /> -->
			<!-- <input type="button" value="ISBN 검색" /> -->
			<input type="text" name="bisbn" id="isbn" />
			<button type="button" id="search">ISBN 검색</button>
		</div>
		<label for="btitle">도서제목</label>
		<input type="text" name="btitle" class="title" />
		
		<label for="bsubtitle">도서부제목</label>
		<input type="text" name="bsubtitle" />
		
		<label for="bpublisher">출판사</label>
		<input type="text" name="bpublisher" />
		
		<label for="bwriter">저자</label>
		<input type="text" name="bwriter" id="bwriterInput" />
		
		<label for="btranslator">역자</label>
		<input type="text" name="btranslator" />
		
		<label for="bpdate">출간날짜</label>
		<input type="text" name="bpdate" />
		
		<label for="bprice">정가</label>
		<input type="text" name="bprice" class="bprice" />
		
		<label for="bdiscount">할인율(%)</label>
		<input type="text" name="bdiscount" class="bdiscount" />
		
		<br />
		<button type="button" id="calDiscount">판매가계산</button>
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
		<input type="file" name="bimg" id="bimgInput" />
		
		
		<label for="bimgdetail">도서상세이미지</label>
		<input type="file" name="bimgdetail" id="bimgdetailInput" />
		
		
		<label for="bdescription">도서설명</label>
		<input type="text" name="bdescription" />
		<!-- <textarea type="text" name="bdescription" rows="5"  ></textarea> -->
		
		<label for="bpage">전체페이지</label>
		<input type="text" name="bpage" />
		
		<label for="bsize">도서크기</label>
		<input type="text" name="bsize" />
				
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
	
	
	/* 할인률 계산 */
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
	 	
	
	
	/* not null 칼럼 미입력 경고 */
		
	
	/* $(document).ready(function() {
		$(".insertForm").submit(function(event) {
			var author = $("#bwriterInput").val().trim();
 
		    if (author === "") {
		      alert("저자를 입력하세요."");
		      event.preventDefault(); // 제출을 막음
		    }
		});
	}); */
	
  	// 파일 선택란에 이벤트 리스너를 추가
	document.getElementById("bimgInput").addEventListener("change", function () {
    	// 파일 선택 확인
	    if (this.files.length === 0) {
	      // 파일 선택되지 않을 시 경고창을 출력
	      alert("파일을 선택해주세요!");
	      // 선택 파일을 초기화 (선택된 파일을 제거)
	      this.value = "";
	    }
 	 });

	document.getElementById("bimgdetailInput").addEventListener("change", function () {
		if (this.files.length === 0) {
	      alert("파일을 선택해주세요!");
	      this.value = "";
	    }
	});
  
	//isbn 검색
	$(document).ready(function(){
		$("#search").click(function(){
			$.ajax({
				method: "GET",
				url: "https://dapi.kakao.com/v3/search/book",
				data: {query: $("#isbn").val()},
				headers: {Authorization: "KakaoAK 01e8350958223ac98e6d3716c0a740f1" }
			})
				.done(function(result){
					var bookTitle = result.documents[0].title;
					var bookAuthors = result.documents[0].authors;
					var bookPublisher = result.documents[0].publisher;
					var bookDatetime = result.documents[0].datetime;
					var bookTranslators = result.documents[0].translators;
					var bookPrice = result.documents[0].price;
					var bookContents = result.documents[0].contents;
					
					
					
					$("input[name='btitle']").val(bookTitle);
					$("input[name='bwriter']").val(bookAuthors);
					$("input[name='bpublisher']").val(bookPublisher);
					$("input[name='bpdate']").val(bookDatetime.split('T')[0]);
					$("input[name='btranslator']").val(bookTranslators);
					$("input[name='bprice']").val(bookPrice);
					$("input[name='bdescription']").val(bookContents);
				});
		});
		
		/* $(".insertForm").submit(function(event) {
			var author = $("#bwriterInput").val().trim();
 
		    if (author === "") {
		      alert("저자를 입력하세요."");
		      event.preventDefault(); // 제출을 막음
		    })
		}); */
	});

		
	</script>
</body>
</html>