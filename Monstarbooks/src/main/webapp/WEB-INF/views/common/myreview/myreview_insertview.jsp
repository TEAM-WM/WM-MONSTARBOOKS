<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<style>
form {
width: 550px;
align: center;
text-align: left;
}
table {
width: 550px;
align: center;
text-align: left;
height: 400px;
}

tr, td {
	padding: 10px 0px 5px 0px;
	
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
		
}

/* 주문/배송 목록 테이블 스타일 */
.order-table {
    width: 100%; /* 테이블 70% 너비로 설정 */
    float: right;
}

.content {
	display:flex;
	justify-content:space-between;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}

</style>
</head>

<body>
	<br />
	<br />
<h3>Review</h3>
	<br />
	<br />

    <div class="content">
        <!-- 왼쪽에 myprofile.jsp 내용 추가 -->
        <div id="myprofile-sidebar">
            <%@ include file="../myprofile/myprofile.jsp" %>
        </div>

        <!-- 주문/배송 목록 테이블 -->
        <table class="order-table">
            <tr>
                <th>주문일자</th>
                <th>상품정보</th>
                <th>수량</th>
                <th>가격</th>
                <th>총 가격</th>
                <th>배송 상태</th>
            </tr>
		</table>
		
	
<form action="insert" method="post" enctype="multipart/form-data">
    <table>
        <tr>
        <td>
<a href="${bcate.memberno }" >${bcate.member.mid } 님</a>
    </td>
    </tr>
        <tr>
            <td colspan="2" style="border-bottom: 1px solid; border-color: darkgray;" class="left">
                [${bcate.bookcategory.bcategory1 }│${bcate.bookcategory.bcategory2 }]
                &nbsp;&nbsp; ${bcate.book.btitle } <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="left">별점&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="left" style="color:#ffe100; font-weight: bold; font-size: 20px;">
                <select name="rstar">
						<option value="1" <c:if test="${bcate.rstar == 1}">selected</c:if>>★</option>
						<option value="2" <c:if test="${bcate.rstar == 2}">selected</c:if>>★★</option>
						<option value="3" <c:if test="${bcate.rstar == 3}">selected</c:if>>★★★</option>
						<option value="4" <c:if test="${bcate.rstar == 4}">selected</c:if>>★★★★</option>
						<option value="5" <c:if test="${bcate.rstar == 5}">selected</c:if>>★★★★★</option>
					</select>
			 </td>
			</tr>
		<tr>
			<td class="left">후기</td>
            <td><textarea name="rcontent" placeholder="후기를 입력하세요." rows="20" style="font-size: 15px; width: 400px;"></textarea></td>
        </tr>
        <tr>
            <td class="left">첨부</td>
            <td><input type="file" name="refilesrc" accept=".jpg, .png, .gif" onchange="imageChoose(this)" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="save" />
                <!-- Use hidden fields to submit data to the server -->
               <input type="hidden" name="bookno" value="${bcate.bookno }" />
               <input type="hidden" name="memberno" value="${bcate.memberno }" />
               <input type="hidden" name="orderno" value="${bcate.orderdetail.orderno }" />
               <input type="hidden" name="mid" value="${bcate.member.mid }" />
               <input type="hidden" name="reviewno" value="${bcate.reviewno }" />
			<input type="hidden" name="rtitle" value="${bcate.bookcategory.bcategory1 }|${bcate.bookcategory.bcategory2 }&${bcate.book.btitle }" />
				  
                <a href="list" class="relist">LIST</a>
            </td>
        </tr>

    </table>
</form>
</body>
</html>