commit;

select * from m_review;


<!-- reviewlist 마이페이지 리뷰 -->
CREATE TABLE m_review (
	reviewno	NUMBER,
	bookno	NUMBER,
	memberno	NUMBER,
	rtitle	VARCHAR2(225),
	rcontent	VARCHAR2(1000),
	regdate	DATE,
	rstar    NUMBER,
	refilesrc	VARCHAR2(225),
	deleted	char(3));
    

create sequence m_review_seq;
DROP SEQUENCE m_review_seq;

INSERT INTO m_review(reviewno, bookno, memberno, rtitle, rcontent, regdate, rstar, refilesrc, deleted) VALUES (m_review_seq.NEXTVAL, 1, 1, '아메리칸 프로메테우스(로버트 오펜하이머 평전)', '아메리칸 프로메테우스 특별판 후기', SYSDATE, 5, NULL, 'NO');
INSERT INTO m_review(reviewno, bookno, memberno, rtitle, rcontent, regdate, rstar, refilesrc, deleted) VALUES 
(2, 2, 2, '돈의 속성','경제에 대한 내용 뿐만 아니라,규칙적이고 생산적인 생활습관의 중요성을 역설한 책', SYSDATE, 4, NULL, 'NO');