<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery 라이브러리 포함 -->
</head>
<body>
	<form action="productinsert" method="post"
		enctype="multipart/form-data" class="insertForm admin-book-form">
		<!-- 도서 테이블 -->
		<!-- <h3>도서 테이블</h3> -->
		<label for="ISBN">ISBN</label>
		<div class="form-small">
			<!-- <input type="text" name="bisbn" /> -->
			<!-- <input type="button" value="ISBN 검색" /> -->
			<input type="text" name="bisbn" id="isbn" />
			<input type="button" id="search" value="ISBN 검색" />
		</div>
		<label for="btitle">도서제목</label>
		<input type="text" name="btitle" class="title" />
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
		<label for="bdiscount">할인율(%)</label>
		<div class="form-small">
		<input type="text" name="bdiscount" class="bdiscount" />
		<input type="button" id="calDiscount" value="판매가계산">
		</div>
		
		<label for="bpricesell">판매가</label>
		<input type="text" name="bpricesell" id="bpricesell" />
		<label for="bstatus">상태</label>
		
		<div class="select-group">
			<select name="bstatus" id="selectedBstatus" class="form-select">
				<option value="판매중">판매중</option>
				<option value="품절">품절</option>
				<option value="숨김">숨김</option>
			</select>
		</div>
		
		<label for="bstock">재고</label>
		<input type="text" name="bstock" />

		<!-- 도서 상세 테이블 -->
		<!-- <h3>도서 디테일 테이블</h3> -->
		<label for="bimg">도서썸네일</label>
		<input type="file" name="bimg" id="bimgInput" />
		<label for="bimgdetail">도서상세이미지</label>
		<input type="file" name="bimgdetail" id="bimgdetailInput" />
		<label for="bdescription">도서설명</label>
		<textarea name="bdescription"></textarea>
		<!-- <input type="text" name="bdescription" /> -->
		<label for="bpage">전체페이지</label>
		<input type="text" name="bpage" />
		<label for="bsize">도서크기</label>
		<input type="text" name="bsize" />
		<label for=badge>상품뱃지</label>

		<div class="select-group">
			<select name="badge" class="form-select">
				<option value="신상품">신상품</option>
				<option value="베스트">베스트</option>
				<option value="주문폭주">주문폭주</option>
			</select>
		</div>

		<!-- 도서 카테고리 테이블 -->
		<!-- <h3>도서 카테고리 테이블</h3> -->

		<div>
			<label for="">카테고리</label>
			<div class="select-group">
				<select name="bcategoryno" class="form-select">
				<c:forEach items="${dto }" var="dto">
					<option value="${dto.bcategoryno }">${dto.bcategory1 } / ${dto.bcategory2 }</option>
				</c:forEach>
				</select>
			</div>
		</div>
		<div class="btn-wrap" style="width:auto; margin-top:20px;">
			<input type="submit" value="등록하기" />
			<input type="button" onclick="location.href='productlist'" value="취소하기">
		</div>
	</form>
	<script>
		document.title = "몬스타북스 || 상품등록";
		/* 할인률 계산 */
		$(document).ready(function() {
			$("#calDiscount").click(function() {
				var price = Number($(".bprice").val());
				var discount = Number($(".bdiscount").val());

				// 할인율 계산 후 결과를 #bpricesell 입력란에 표시
				$("#bpricesell").val(price - (price * discount * 0.01));

				//form submit 막기
				$(".insertForm").submit(function(e) {
					e.preventDefault();
					$(".insertForm").unbind();
				})
			});
		});

		/* 파일추가 경고 */
		// 파일 선택란에 이벤트 리스너를 추가
		document.getElementById("bimgInput").addEventListener("change",
				function() {
					// 파일 선택 확인
					if (this.files.length === 0) {
						// 파일 선택되지 않을 시 경고창을 출력
						alert("파일을 선택해주세요!");
						// 선택 파일을 초기화 (선택된 파일을 제거)
						this.value = "";
					}
				});

		document.getElementById("bimgdetailInput").addEventListener("change",
				function() {
					if (this.files.length === 0) {
						alert("파일을 선택해주세요!");
						this.value = "";
					}
				});

		

//isbn 검색
$(document).ready(function() {$("#search").click(
	function() {$.ajax({
			method : "GET",
			url : "https://dapi.kakao.com/v3/search/book",
			data : {
				query : $(
						"#isbn")
						.val()
			},
			headers : {
				Authorization : "KakaoAK 01e8350958223ac98e6d3716c0a740f1"
			}
		})
.done(
		function(result) {
			var bookTitle = result.documents[0].title;
			var bookAuthors = result.documents[0].authors;
			var bookPublisher = result.documents[0].publisher;
			var bookDatetime = result.documents[0].datetime;
			var bookTranslators = result.documents[0].translators;
			var bookPrice = result.documents[0].price;
			var bookContents = result.documents[0].contents;

			$(
					"input[name='btitle']")
					.val(
							bookTitle);
			$(
					"input[name='bwriter']")
					.val(
							bookAuthors);
			$(
					"input[name='bpublisher']")
					.val(
							bookPublisher);
			$(
					"input[name='bpdate']")
					.val(
							bookDatetime
									.split('T')[0]);
			$(
					"input[name='btranslator']")
					.val(
							bookTranslators);
			$(
					"input[name='bprice']")
					.val(
							bookPrice);
			$(
					"input[name='bdescription']")
					.val(
							bookContents);
		});
});
});
	</script>
</body>
</html>