--------------------------------------------------------------------------------
--도서
--------------------------------------------------------------------------------
create table m_book(
    bookno number,
    bisbn number,
    btitle varchar2(255),
    bsubtitle varchar2(255),
    bpublisher varchar2(100),
    bwriter varchar2(100),
    btranslator varchar2(100),    
    bpdate date,
    bprice number,
    bpricesell number,
    bdiscount number,    
    bstatus varchar2(10),
    bcdate date,
    bmdate date,
    bstock number
);

select * from m_book;
drop table m_book purge;
create sequence m_book_seq;
drop sequence m_book_seq;
select bookno, btitle, bpublisher, bwriter, bprice, bstatus, bstock from m_book;
delete from m_book;
commit;

insert into m_book values(m_book_seq.nextval, '1234', '제목1', '부제목1', '출판사1', '저자1', '번역1', '23-8-23', '1000', '900', '10', '판매중', '23-8-23', null, '5');
insert into m_book values(m_book_seq.nextval, '1235', '제목2', '부제목2', '출판사2', '저자2', '번역3', '23-8-23', '1000', '900', '10', '판매중', '23-8-23', null, '4');
insert into m_book values(m_book_seq.nextval, '1236', '제목3', '부제목3', '출판사3', '저자2', '번역3', '23-8-23', '1000', '900', '10', '판매중', '23-8-23', null, '3');

--------------------------------------------------------------------------------
--도서카테고리
--------------------------------------------------------------------------------
create table m_book_category(
    bcategoryno number,
    bcategory1 varchar2(100),
    bcategory2 varchar2(100)
);

select * from m_book_category;
create sequence m_book_category_seq;
drop sequence m_book_category_seq;
alter table m_book_category drop primary key;
delete from m_book_category;
drop table m_book_category purge;
commit;


insert into m_book_category values(1, '국내도서', '소설');
insert into m_book_category values(2, '국내도서', '시');
insert into m_book_category values(3, '국내도서', '경제');
insert into m_book_category values(4, '국내도서', '에세이');
insert into m_book_category values(5, '국내도서', '요리');
insert into m_book_category values(6, '국내도서', '문화');
insert into m_book_category values(7, '외국도서', '소설');
insert into m_book_category values(8, '외국도서', '시');
insert into m_book_category values(9, '외국도서', '경제');
insert into m_book_category values(10, '외국도서', '에세이');
insert into m_book_category values(11, '외국도서', '요리');
insert into m_book_category values(12, '외국도서', '문화');

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
    bsize varchar2(100),
    badge varchar2(15)
);

drop table m_book_detail purge;
alter table m_book_detail rename column besize to bsize;
commit;
select * from m_book_detail;
create SEQUENCE m_book_detail_seq;
drop sequence m_book_detail_seq;
select m_book_detail_seq.nextval from dual;
select M_BOOK_DETAIL_SEQ.CURRVAL from dual; 
delete from m_book_detail;
create sequence m_book_detail_seq;
drop sequence m_book_detail_seq;
select M_BOOK_SEQ.nextval from dual;
select M_BOOK_SEQ.CURRVAL from dual;
commit;

insert into m_book_detail values('1', '1', 'book01.jpg', 'book01detail.jpg', '국내 소설입니다.', '99', '133*200*30mm', '신상품');
insert into m_book_detail values('2', '2', 'book02.jpg', 'book02detail.jpg', '외국 시입니다.', '100', '133*300*31mm', '베스트다');
insert into m_book_detail values('3', '1', 'book03.jpg', 'book03detail.jpg', '국내 경제지입니다.', '101', '133*400*32mm', '주문폭주');
commit;





--------------------------------------------------------------------------------
--ProductMapper.xml(업댓중)
--------------------------------------------------------------------------------
--<select id="list" parameterType="com.monstar.books.product.dto.BookDto" resultMap="BookDto">
    SELECT B.BOOKNO, BD.BIMG, B.BTITLE, B.BPUBLISHER, B.BWRITER, B.BPRICE, B.BSTATUS, B.BCDATE, B.BMDATE, B.BSTOCK
    FROM M_BOOK B INNER JOIN M_BOOK_DETAIL BD
    ON B.BOOKNO = BD.BOOKNO;
--</select>


--페이징 ver.
--<select id="list" parameterType="com.monstar.books.product.dto.BookDto" resultMap="BookDto">
select * 
from
    (select rownum num, n.* 
    from 
        (select b.bookno, bd.bimg, b.btitle, b.bpublisher, b.bwriter, b.bprice, 
            b.bstatus, b.bcdate, b.bmdate, b.bstock 
        from m_book b inner join m_book_detail bd
        on b.bookno = bd.bookno
        order by bookno desc) n)
where num between 1 and 10;
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

--product insert() 여러테이블 동시에 인서트
insert all
    into m_book(bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator, 
            bpdate, bprice, bpricesell, bdiscount, bstatus, bcdate, bmdate, bstock) 
        values('4321', '제목11', '부제목11', '출판사11', '저자11', '번역11',
            '23-8-23', '1000', '900', '10', '판매중', '23-8-23', null, '5')
    into m_book_detail(bookno, bcategoryno, bimg, bimgdetail, bdescription, 
        bpage, bsize, bpdate, badge) 
        values('1', '1', 'book01.jpg', 'book01detail.jpg', '국내 소설입니다.11',
            '99', '133*200*30mm', '23-8-24', '신상품')
    into m_book_category(bcategoryno, bcategory1, bcategory2) 
        values('1', '국내도서11', '소설11')
    select *
    from m_book b left join m_book_detail bd
    on b.bookno = bd.bookno
    left join m_book_category bc
        on bd.bcategoryno = bc.bcategoryno;

insert all
    into m_book(bookno, bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator, 
            bpdate, bprice, bpricesell, bdiscount, bstatus, bcdate, bmdate, bstock) 
        values(m_book_seq.nextval, '4321', '제목4', '부제목4', '출판사4', '저자4', '번역4',
            '23-8-23', '1000', '900', '10', '판매중', '23-8-23', null, '5')
    into m_book_detail(bookno, bcategoryno, bimg, bimgdetail, bdescription, bpage, bsize, bpdate, badge) 
        values(m_book_seq.nextval, m_book_category_seq.nextval, 'book04.jpg', 
            'book04detail.jpg', '국내 소설입니다.4', '99', '133*200*30mm', '23-8-24', '신상품')
    into m_book_category(bcategoryno, bcategory1, bcategory2) 
        values(m_book_category_seq.nextval, '국내도서4', '소설4')
    select * from dual;
    
    
    
--insertBook()
insert into m_book(bookno, bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator, 
        bpdate, bprice, bpricesell, bdiscount, bstatus, bcdate, bmdate, bstock)
    values(m_book_seq.nextval, '1234', '제목4', '부제목4', '출판사4', '저자4', '번역4',
        '23-8-23', '1000', '900', '10', '판매중', '23-8-23', null, '4');
        
--insertBookDetail()
insert into m_book_detail(bookno, bcategoryno, bimg, bimgdetail, bdescription,
        bpage, bsize, bpdate, badge)
    values('4', '1', '기여어.png', '기여어.png', '이책은기여어입니다', '88', '133*200*30mm',
        '신상품');
        
        
        
insert into m_book(bookno, bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator, 
        bpdate, bprice, bpricesell, bdiscount, bstatus, bcdate, bmdate, bstock)
    values(m_book_seq.nextval, '1234', '제목4', '부제목4', '출판사4', '저자4', '번역4',
        '23-8-23', '1000', '900', '10', '판매중', '23-8-23', null, '4'); 
         
insert into m_book_detail(bookno, bcategoryno, bimg, bimgdetail, bdescription,
        bpage, bsize, bpdate, badge)
    values('4', '1', '기여어.png', '기여어.png', '이책은기여어입니다', '88', '133*200*30mm',
        '신상품');
        
SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'M_BOOK_SEQ';






----------------------------
--통합
--------[


create table m_member(
    memberno	NUMBER,
	mid VARCHAR2(100)	NOT NULL,
	mpw VARCHAR2(100)	NOT NULL,
	mbirth	DATE,
	mname VARCHAR2(100)	NOT NULL,
	memail VARCHAR2(100)	NOT NULL,
	mtel	 VARCHAR2(100)	NOT NULL,
	mregdate DATE	NOT NULL,
	mprofileimg VARCHAR2(255)	NULL,
	mfavorite VARCHAR2(255)	NULL,
	mauthority VARCHAR2(10) DEFAULT '사용자',
	deleted	char(3) DEFAULT 'no',
    constraint m_member_id_pk primary key(mid)
);