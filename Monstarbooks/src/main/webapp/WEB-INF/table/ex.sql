commit;

select * from ex;

create table ex(
    exno number, -- 번호
    extitle varchar2(255), -- 제목
    excontent varchar2(500), --글내용
    exregdate date, -- 등록일
    deleted char(3) default 'no' 
);-- 삭제 되면 no를 yes 로 변경

create SEQUENCE ex_seq;

insert into ex values(ex_seq.nextval, '제목제목', '내용내용', sysdate, 'no');
insert into ex values(ex_seq.nextval, '제목제목2', '내용내용', sysdate, 'no');
insert into ex values(ex_seq.nextval, '제목제목3', '내용내용', sysdate, 'no');