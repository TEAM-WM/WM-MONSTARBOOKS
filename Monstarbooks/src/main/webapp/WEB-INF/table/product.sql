--------------------------------------------------------------------------------
--도서
--------------------------------------------------------------------------------
create table m_book(
    bookno number,
    btitle varchar2(255),
    bsubtitle varchar2(255),
    bwriter varchar2(100),
    btranslator varchar2(100),
    bpublisher varchar2(100),
    bpdate date,
    bprice number,
    bpricesell number,
    bdiscount number,
    bisbn number,
    bstatus varchar2(10),
    bcdate date,
    bmdate date,
    bstock number
);

select * from m_book;
create SEQUENCE m_book_seq;

insert into m_book values(m_book_seq.nextval, '제목1', '부제목1', '저자1', '번역1', '출판사1', '23-8-23', '1000', '900', '10', '1234', '판매중', '23-8-23', null, '5');
insert into m_book values(m_book_seq.nextval, '제목2', '부제목2', '저자2', '번역2', '출판사2', '23-8-23', '1000', '900', '10', '1234', '판매중', '23-8-23', null, '4');
insert into m_book values(m_book_seq.nextval, '제목3', '부제목3', '저자3', '번역3', '출판사3', '23-8-23', '1000', '900', '10', '1234', '판매중', '23-8-23', null, '3');
commit;

--------------------------------------------------------------------------------
--도서상세
--------------------------------------------------------------------------------
create table m_book_detail(
    bookno number,
    bcategoryno number,
    bimg varchar2(255),
    bimgdetail varchar2(255),
    bdescription varchar2(1000),
    bpage number,
    besize varchar2(100),
    badge varchar2(15),
    bpdate date
);

select * from m_book_detail;
create SEQUENCE m_book_detail_seq;

insert into m_book_detail values('1', '1', 'book01.jpg', 'book01detail.jpg', '국내 소설입니다.', '99', '133*200*30mm', '신상품', '23-8-24');
insert into m_book_detail values('2', '2', 'book02.jpg', 'book02detail.jpg', '외국 시입니다.', '100', '133*300*31mm', '베스트다', '23-8-24');
insert into m_book_detail values('3', '1', 'book03.jpg', 'book03detail.jpg', '국내 경제지입니다.', '101', '133*400*32mm', '주문폭주', '23-8-24');
commit;

--------------------------------------------------------------------------------
--도서카테고리
--------------------------------------------------------------------------------
create table m_book_category(
    bcategoryno number,
    bcategory1 varchar2(100),
    bcategory2 varchar2(100)
);

select * from m_book_category;
create SEQUENCE m_book_category_seq;

insert into m_book_category values(m_book_category_seq.nextval, '국내도서', '소설');
insert into m_book_category values(m_book_category_seq.nextval, '외국도서', '시');
insert into m_book_category values(m_book_category_seq.nextval, '국내도서', '경제');
commit;

--------------------------------------------------------------------------------
--상품목록 리스트
--------------------------------------------------------------------------------
--<select id="list" parameterType="com.monstar.books.product.dto.BookDto" resultMap="BookDto">
    SELECT B.BOOKNO, BD.BIMG, B.BTITLE, B.BPUBLISHER, B.BWRITER, B.BPRICE, B.BSTATUS, B.BCDATE, B.BMDATE, B.BSTOCK
    FROM M_BOOK B INNER JOIN M_BOOK_DETAIL BD
    ON B.BOOKNO = BD.BOOKNO;
--</select>

--<select id="detail" parameterType="com.monstar.books.product.dto.BookDto" resultMap="BookDto">
    SELECT B.BOOKNO, B.BISBN, B.BTITLE, B.BSUBTITLE, B.BPUBLISHER, B.BWRITER, B.BTRANSLATOR, B.BPDATE, 
			B.BPRICE, B.BPRICESELL, B.BDISCOUNT, B.BSTATUS, B.BCDATE, B.BMDATE, B.BSTOCK, 
    		BD.BOOKNO, BD.BCATEGORYNO, BD.BIMG, BD.BIMGDETAIL, BD.BDESCRIPTION, BD.BPAGE, BD.BSIZE, BD.BPDATE, 
    		BC.BCATEGORYNO, BC.BCATEGORY1, BC.BCATEGORY2
		FROM M_BOOK B INNER JOIN M_BOOK_DETAIL BD
		ON B.BOOKNO = BD.BOOKNO
		JOIN M_BOOK_CATEGORY BC
		ON BD.BCATEGORYNO = BC.BCATEGORYNO;
		--WHERE B.BOOKNO = #{param1}
--</select>
