--------------------------------------------------------------------------------
--����
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

insert into m_book values(m_book_seq.nextval, '1234', '����1', '������1', '���ǻ�1', '����1', '����1', '23-8-23', '1000', '900', '10', '�Ǹ���', '23-8-23', null, '5');
insert into m_book values(m_book_seq.nextval, '1235', '����2', '������2', '���ǻ�2', '����2', '����3', '23-8-23', '1000', '900', '10', '�Ǹ���', '23-8-23', null, '4');
insert into m_book values(m_book_seq.nextval, '1236', '����3', '������3', '���ǻ�3', '����2', '����3', '23-8-23', '1000', '900', '10', '�Ǹ���', '23-8-23', null, '3');

--------------------------------------------------------------------------------
--����ī�װ�
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


insert into m_book_category values(1, '��������', '�Ҽ�');
insert into m_book_category values(2, '��������', '��');
insert into m_book_category values(3, '��������', '����');
insert into m_book_category values(4, '��������', '������');
insert into m_book_category values(5, '��������', '�丮');
insert into m_book_category values(6, '��������', '��ȭ');
insert into m_book_category values(7, '�ܱ�����', '�Ҽ�');
insert into m_book_category values(8, '�ܱ�����', '��');
insert into m_book_category values(9, '�ܱ�����', '����');
insert into m_book_category values(10, '�ܱ�����', '������');
insert into m_book_category values(11, '�ܱ�����', '�丮');
insert into m_book_category values(12, '�ܱ�����', '��ȭ');

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

insert into m_book_detail values('1', '1', 'book01.jpg', 'book01detail.jpg', '���� �Ҽ��Դϴ�.', '99', '133*200*30mm', '�Ż�ǰ');
insert into m_book_detail values('2', '2', 'book02.jpg', 'book02detail.jpg', '�ܱ� ���Դϴ�.', '100', '133*300*31mm', '����Ʈ��');
insert into m_book_detail values('3', '1', 'book03.jpg', 'book03detail.jpg', '���� �������Դϴ�.', '101', '133*400*32mm', '�ֹ�����');
commit;





--------------------------------------------------------------------------------
--ProductMapper.xml(������)
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

--product insert() �������̺� ���ÿ� �μ�Ʈ
insert all
    into m_book(bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator, 
            bpdate, bprice, bpricesell, bdiscount, bstatus, bcdate, bmdate, bstock) 
        values('4321', '����11', '������11', '���ǻ�11', '����11', '����11',
            '23-8-23', '1000', '900', '10', '�Ǹ���', '23-8-23', null, '5')
    into m_book_detail(bookno, bcategoryno, bimg, bimgdetail, bdescription, 
        bpage, bsize, bpdate, badge) 
        values('1', '1', 'book01.jpg', 'book01detail.jpg', '���� �Ҽ��Դϴ�.11',
            '99', '133*200*30mm', '23-8-24', '�Ż�ǰ')
    into m_book_category(bcategoryno, bcategory1, bcategory2) 
        values('1', '��������11', '�Ҽ�11')
    select *
    from m_book b left join m_book_detail bd
    on b.bookno = bd.bookno
    left join m_book_category bc
        on bd.bcategoryno = bc.bcategoryno;

insert all
    into m_book(bookno, bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator, 
            bpdate, bprice, bpricesell, bdiscount, bstatus, bcdate, bmdate, bstock) 
        values(m_book_seq.nextval, '4321', '����4', '������4', '���ǻ�4', '����4', '����4',
            '23-8-23', '1000', '900', '10', '�Ǹ���', '23-8-23', null, '5')
    into m_book_detail(bookno, bcategoryno, bimg, bimgdetail, bdescription, bpage, bsize, bpdate, badge) 
        values(m_book_seq.nextval, m_book_category_seq.nextval, 'book04.jpg', 
            'book04detail.jpg', '���� �Ҽ��Դϴ�.4', '99', '133*200*30mm', '23-8-24', '�Ż�ǰ')
    into m_book_category(bcategoryno, bcategory1, bcategory2) 
        values(m_book_category_seq.nextval, '��������4', '�Ҽ�4')
    select * from dual;
    
    
    
--insertBook()
insert into m_book(bookno, bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator, 
        bpdate, bprice, bpricesell, bdiscount, bstatus, bcdate, bmdate, bstock)
    values(m_book_seq.nextval, '1234', '����4', '������4', '���ǻ�4', '����4', '����4',
        '23-8-23', '1000', '900', '10', '�Ǹ���', '23-8-23', null, '4');
        
--insertBookDetail()
insert into m_book_detail(bookno, bcategoryno, bimg, bimgdetail, bdescription,
        bpage, bsize, bpdate, badge)
    values('4', '1', '�⿩��.png', '�⿩��.png', '��å���⿩���Դϴ�', '88', '133*200*30mm',
        '�Ż�ǰ');