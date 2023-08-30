--------------------------------------------------------------------------------
--����
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

insert into m_book values(m_book_seq.nextval, '����1', '������1', '����1', '����1', '���ǻ�1', '23-8-23', '1000', '900', '10', '1234', '�Ǹ���', '23-8-23', null, '5');
insert into m_book values(m_book_seq.nextval, '����2', '������2', '����2', '����2', '���ǻ�2', '23-8-23', '1000', '900', '10', '1234', '�Ǹ���', '23-8-23', null, '4');
insert into m_book values(m_book_seq.nextval, '����3', '������3', '����3', '����3', '���ǻ�3', '23-8-23', '1000', '900', '10', '1234', '�Ǹ���', '23-8-23', null, '3');
commit;

--------------------------------------------------------------------------------
--������
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

insert into m_book_detail values('1', '1', 'book01.jpg', 'book01detail.jpg', '���� �Ҽ��Դϴ�.', '99', '133*200*30mm', '�Ż�ǰ', '23-8-24');
insert into m_book_detail values('2', '2', 'book02.jpg', 'book02detail.jpg', '�ܱ� ���Դϴ�.', '100', '133*300*31mm', '����Ʈ��', '23-8-24');
insert into m_book_detail values('3', '1', 'book03.jpg', 'book03detail.jpg', '���� �������Դϴ�.', '101', '133*400*32mm', '�ֹ�����', '23-8-24');
commit;

--------------------------------------------------------------------------------
--����ī�װ�
--------------------------------------------------------------------------------
create table m_book_category(
    bcategoryno number,
    bcategory1 varchar2(100),
    bcategory2 varchar2(100)
);

select * from m_book_category;
create SEQUENCE m_book_category_seq;

insert into m_book_category values(m_book_category_seq.nextval, '��������', '�Ҽ�');
insert into m_book_category values(m_book_category_seq.nextval, '�ܱ�����', '��');
insert into m_book_category values(m_book_category_seq.nextval, '��������', '����');
commit;

--------------------------------------------------------------------------------
--��ǰ��� ����Ʈ
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
