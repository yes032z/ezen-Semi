/* 주문 */
CREATE TABLE orders (
	orderno NUMBER NOT NULL, /* 주문번호 */
	orderaddress VARCHAR2(100) NOT NULL, /* 주소 */
	orderregdate DATE DEFAULT sysdate NOT NULL, /* 구매일 */
	ordertel VARCHAR2(20) NOT NULL, /* 전화번호 */
	pickup VARCHAR2(20) NOT NULL, /* 픽업유무 */
	no NUMBER, /* 회원번호 */
	receiver VARCHAR2(50) NOT NULL /* 받는사람 */
);

CREATE UNIQUE INDEX PK_orders
	ON orders (
		orderno ASC
	);

ALTER TABLE orders
	ADD
		CONSTRAINT PK_orders
		PRIMARY KEY (
			orderno
		);

/* 환불 */
CREATE TABLE refund (
	refundno NUMBER NOT NULL, /* 환불번호 */
	refundbody VARCHAR2(300), /* 환불사유 */
	pdno NUMBER, /* 상품고유번호 */
	orderno NUMBER, /* 주문번호 */
	refundregdate DATE DEFAULT sysdate /* 환불신청일 */
);

CREATE UNIQUE INDEX PK_refund
	ON refund (
		refundno ASC
	);

ALTER TABLE refund
	ADD
		CONSTRAINT PK_refund
		PRIMARY KEY (
			refundno
		);

/* 입고 */
CREATE TABLE intostock (
	intostockno NUMBER NOT NULL, /* 입고번호 */
	regdate DATE DEFAULT sysdate NOT NULL, /* 입고일 */
	intostockqty NUMBER NOT NULL, /* 수량 */
	pdno NUMBER NOT NULL, /* 상품고유번호 */
	pdsizeno NUMBER /* 번호(사이즈) */
);

CREATE UNIQUE INDEX PK_intostock
	ON intostock (
		intostockno ASC
	);

ALTER TABLE intostock
	ADD
		CONSTRAINT PK_intostock
		PRIMARY KEY (
			intostockno
		);

/* 카드 */
CREATE TABLE card (
	cdno NUMBER NOT NULL, /* 번호 */
	cardno VARCHAR2(20) NOT NULL, /* 카드번호 */
	cardpwd CHAR(4) NOT NULL, /* 카드비밀번호 */
	paypwd CHAR(6), /* 결제비밀번호 */
	cardcom VARCHAR2(30) NOT NULL, /* 카드회사 */
	cvc CHAR(3) NOT NULL, /* cvc */
	no NUMBER NOT NULL /* 회원번호 */
);

CREATE UNIQUE INDEX PK_card
	ON card (
		cdno ASC
	);

ALTER TABLE card
	ADD
		CONSTRAINT PK_card
		PRIMARY KEY (
			cdno
		);

/* 회원 */
CREATE TABLE member (
	no NUMBER NOT NULL, /* 회원번호 */
	name VARCHAR2(20) NOT NULL, /* 이름 */
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	birth VARCHAR2(10), /* 생년월일 */
	email VARCHAR2(20), /* 이메일 */
	detailaddress VARCHAR2(200), /* 주소 */
	tel VARCHAR2(20) NOT NULL, /* 전화번호 */
	footsize NUMBER, /* 발 사이즈 */
	regdate DATE DEFAULT sysdate NOT NULL, /* 가입일 */
	zipno NUMBER, /* 번호(우편) */
	outdate DATE /* 탈퇴일 */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		no ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			no
		);

/* 리뷰 */
CREATE TABLE review (
	reviewno NUMBER NOT NULL, /* 리뷰번호 */
	reviewbody VARCHAR2(1000) NOT NULL, /* 내용 */
	reviewregdate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	reviewgrade NUMBER NOT NULL, /* 별점 */
	good NUMBER, /* 좋아요 */
	no NUMBER NOT NULL, /* 회원번호 */
	pdno NUMBER NOT NULL /* 상품고유번호 */
);

CREATE UNIQUE INDEX PK_review
	ON review (
		reviewno ASC
	);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			reviewno
		);

/* 찜한상품 */
CREATE TABLE favoritepd (
	favoriteno NUMBER NOT NULL, /* 찜한상품번호 */
	no NUMBER, /* 회원번호 */
	pdno NUMBER /* 상품고유번호 */
);

CREATE UNIQUE INDEX PK_favoritepd
	ON favoritepd (
		favoriteno ASC
	);

ALTER TABLE favoritepd
	ADD
		CONSTRAINT PK_favoritepd
		PRIMARY KEY (
			favoriteno
		);

/* 상품 */
CREATE TABLE product (
	pdno NUMBER NOT NULL, /* 상품고유번호 */
	pdname VARCHAR2(200) NOT NULL, /* 상품명 */
	price NUMBER NOT NULL, /* 가격 */
	kind VARCHAR2(10) NOT NULL, /* 종류 */
	brand VARCHAR2(100) NOT NULL, /* 브랜드 */
	pdregdate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	filename VARCHAR2(50), /* 업로드파일명 */
	filesize NUMBER DEFAULT 0, /* 파일사이즈 */
	originalfilename VARCHAR2(100) /* 변경전파일명 */
);

CREATE UNIQUE INDEX PK_product
	ON product (
		pdno ASC
	);

ALTER TABLE product
	ADD
		CONSTRAINT PK_product
		PRIMARY KEY (
			pdno
		);

/* 재고 */
CREATE TABLE stock (
	stockno NUMBER NOT NULL, /* 재고번호 */
	stockqty NUMBER DEFAULT 0 NOT NULL, /* 수량 */
	pdno NUMBER NOT NULL, /* 상품고유번호 */
	pdsizeno NUMBER /* 번호(사이즈) */
);

CREATE UNIQUE INDEX PK_stock
	ON stock (
		stockno ASC
	);

ALTER TABLE stock
	ADD
		CONSTRAINT PK_stock
		PRIMARY KEY (
			stockno
		);

/* QnA */
CREATE TABLE QnA (
	qnano NUMBER NOT NULL, /* QnA번호 */
	qnabody VARCHAR2(1000) NOT NULL, /* 질문내용 */
	qnaview VARCHAR2(10) NOT NULL, /* 공개유무 */
	qnaregdate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	no NUMBER NOT NULL, /* 회원번호 */
	pdno NUMBER NOT NULL /* 상품고유번호 */
);

CREATE UNIQUE INDEX PK_QnA
	ON QnA (
		qnano ASC
	);

ALTER TABLE QnA
	ADD
		CONSTRAINT PK_QnA
		PRIMARY KEY (
			qnano
		);

/* 공지사항 */
CREATE TABLE announcement (
	announcementno NUMBER NOT NULL, /* 공지사항번호 */
	announcementname VARCHAR2(200) NOT NULL, /* 제목 */
	announcementbody VARCHAR2(2000) NOT NULL, /* 내용 */
	announcementregdate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

CREATE UNIQUE INDEX PK_announcement
	ON announcement (
		announcementno ASC
	);

ALTER TABLE announcement
	ADD
		CONSTRAINT PK_announcement
		PRIMARY KEY (
			announcementno
		);

/* 장바구니 */
CREATE TABLE basket (
	basketno NUMBER NOT NULL, /* 장바구니번호 */
	basketqty NUMBER NOT NULL, /* 수량 */
	pdno NUMBER NOT NULL, /* 상품고유번호 */
	no NUMBER NOT NULL, /* 회원번호 */
	pdsizeno NUMBER /* 번호(사이즈) */
);

CREATE UNIQUE INDEX PK_basket
	ON basket (
		basketno ASC
	);

ALTER TABLE basket
	ADD
		CONSTRAINT PK_basket
		PRIMARY KEY (
			basketno
		);

/* FAQ */
CREATE TABLE FAQ (
	faqno NUMBER NOT NULL, /* FAQ번호 */
	faqtitle VARCHAR2(200) NOT NULL, /* 제목 */
	faqbody VARCHAR2(1000) NOT NULL, /* 내용 */
	faqcatagory VARCHAR2(20) NOT NULL /* 카테고리 */
);

CREATE UNIQUE INDEX PK_FAQ
	ON FAQ (
		faqno ASC
	);

ALTER TABLE FAQ
	ADD
		CONSTRAINT PK_FAQ
		PRIMARY KEY (
			faqno
		);

/* 주문상세 */
CREATE TABLE orderdetail (
	pdno NUMBER NOT NULL, /* 상품고유번호 */
	orderno NUMBER NOT NULL, /* 주문번호 */
	orderqty NUMBER, /* 수량 */
	pdsizeno NUMBER /* 번호(사이즈) */
);

CREATE UNIQUE INDEX PK_orderdetail
	ON orderdetail (
		pdno ASC,
		orderno ASC
	);

ALTER TABLE orderdetail
	ADD
		CONSTRAINT PK_orderdetail
		PRIMARY KEY (
			pdno,
			orderno
		);

/* 우편번호 */
CREATE TABLE zipcode (
	zipno NUMBER NOT NULL, /* 번호(우편) */
	zipcodeno CHAR(5) NOT NULL, /* 우편번호 */
	si VARCHAR2(20) NOT NULL, /* 시 */
	gu VARCHAR2(20) NOT NULL, /* 구/군 */
	dong VARCHAR2(20) NOT NULL, /* 동 */
	startbunji VARCHAR2(10) NOT NULL, /* 번지1 */
	endbunji VARCHAR2(10) /* 번지2 */
);

CREATE UNIQUE INDEX PK_zipcode
	ON zipcode (
		zipno ASC
	);

ALTER TABLE zipcode
	ADD
		CONSTRAINT PK_zipcode
		PRIMARY KEY (
			zipno
		);

/* QnA답변 */
CREATE TABLE qnareply (
	qnareplyno NUMBER NOT NULL, /* QnA답변번호 */
	qnareplybody VARCHAR2(1000) NOT NULL, /* 답변내용 */
	qnareplyregdate DATE DEFAULT sysdate NOT NULL, /* 작성일 */
	qnano NUMBER NOT NULL /* QnA번호 */
);

CREATE UNIQUE INDEX PK_qnareply
	ON qnareply (
		qnareplyno ASC
	);

ALTER TABLE qnareply
	ADD
		CONSTRAINT PK_qnareply
		PRIMARY KEY (
			qnareplyno
		);

/* 사이즈 */
CREATE TABLE productsize (
	pdsizeno NUMBER NOT NULL, /* 번호(사이즈) */
	pdsize NUMBER NOT NULL, /* 사이즈 */
	pdno NUMBER NOT NULL /* 상품고유번호 */
);

CREATE UNIQUE INDEX PK_productsize
	ON productsize (
		pdsizeno ASC
	);

ALTER TABLE productsize
	ADD
		CONSTRAINT PK_productsize
		PRIMARY KEY (
			pdsizeno
		);

/* 상품상세 */
CREATE TABLE productdetail (
	filename VARCHAR2(50), /* 업로드파일명 */
	filesize NUMBER, /* 파일사이즈 */
	pdno NUMBER, /* 상품고유번호 */
	originalfilename VARCHAR2(100) /* 변경전파일명 */
);

/* 리뷰상세 */
CREATE TABLE reviewdetail (
	reviewno NUMBER, /* 리뷰번호 */
	filename VARCHAR2(50), /* 업로드파일명 */
	filesize NUMBER, /* 파일사이즈 */
	originalfilename VARCHAR2(100) /* 변경전파일명 */
);

ALTER TABLE orders
	ADD
		CONSTRAINT FK_member_TO_orders
		FOREIGN KEY (
			no
		)
		REFERENCES member (
			no
		);

ALTER TABLE refund
	ADD
		CONSTRAINT FK_orderdetail_TO_refund
		FOREIGN KEY (
			pdno,
			orderno
		)
		REFERENCES orderdetail (
			pdno,
			orderno
		);

ALTER TABLE intostock
	ADD
		CONSTRAINT FK_product_TO_intostock
		FOREIGN KEY (
			pdno
		)
		REFERENCES product (
			pdno
		);

ALTER TABLE intostock
	ADD
		CONSTRAINT FK_productsize_TO_intostock
		FOREIGN KEY (
			pdsizeno
		)
		REFERENCES productsize (
			pdsizeno
		);

ALTER TABLE card
	ADD
		CONSTRAINT FK_member_TO_card
		FOREIGN KEY (
			no
		)
		REFERENCES member (
			no
		);

ALTER TABLE member
	ADD
		CONSTRAINT FK_zipcode_TO_member
		FOREIGN KEY (
			zipno
		)
		REFERENCES zipcode (
			zipno
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			no
		)
		REFERENCES member (
			no
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_product_TO_review
		FOREIGN KEY (
			pdno
		)
		REFERENCES product (
			pdno
		);

ALTER TABLE favoritepd
	ADD
		CONSTRAINT FK_member_TO_favoritepd
		FOREIGN KEY (
			no
		)
		REFERENCES member (
			no
		);

ALTER TABLE favoritepd
	ADD
		CONSTRAINT FK_product_TO_favoritepd
		FOREIGN KEY (
			pdno
		)
		REFERENCES product (
			pdno
		);

ALTER TABLE stock
	ADD
		CONSTRAINT FK_product_TO_stock
		FOREIGN KEY (
			pdno
		)
		REFERENCES product (
			pdno
		);

ALTER TABLE stock
	ADD
		CONSTRAINT FK_productsize_TO_stock
		FOREIGN KEY (
			pdsizeno
		)
		REFERENCES productsize (
			pdsizeno
		);

ALTER TABLE QnA
	ADD
		CONSTRAINT FK_member_TO_QnA
		FOREIGN KEY (
			no
		)
		REFERENCES member (
			no
		);

ALTER TABLE QnA
	ADD
		CONSTRAINT FK_product_TO_QnA
		FOREIGN KEY (
			pdno
		)
		REFERENCES product (
			pdno
		);

ALTER TABLE basket
	ADD
		CONSTRAINT FK_product_TO_basket
		FOREIGN KEY (
			pdno
		)
		REFERENCES product (
			pdno
		);

ALTER TABLE basket
	ADD
		CONSTRAINT FK_member_TO_basket
		FOREIGN KEY (
			no
		)
		REFERENCES member (
			no
		);

ALTER TABLE basket
	ADD
		CONSTRAINT FK_productsize_TO_basket
		FOREIGN KEY (
			pdsizeno
		)
		REFERENCES productsize (
			pdsizeno
		);

ALTER TABLE orderdetail
	ADD
		CONSTRAINT FK_product_TO_orderdetail
		FOREIGN KEY (
			pdno
		)
		REFERENCES product (
			pdno
		);

ALTER TABLE orderdetail
	ADD
		CONSTRAINT FK_orders_TO_orderdetail
		FOREIGN KEY (
			orderno
		)
		REFERENCES orders (
			orderno
		);

ALTER TABLE orderdetail
	ADD
		CONSTRAINT FK_productsize_TO_orderdetail
		FOREIGN KEY (
			pdsizeno
		)
		REFERENCES productsize (
			pdsizeno
		);

ALTER TABLE qnareply
	ADD
		CONSTRAINT FK_QnA_TO_qnareply
		FOREIGN KEY (
			qnano
		)
		REFERENCES QnA (
			qnano
		);

ALTER TABLE productsize
	ADD
		CONSTRAINT FK_product_TO_productsize
		FOREIGN KEY (
			pdno
		)
		REFERENCES product (
			pdno
		);

ALTER TABLE productdetail
	ADD
		CONSTRAINT FK_product_TO_productdetail
		FOREIGN KEY (
			pdno
		)
		REFERENCES product (
			pdno
		);

ALTER TABLE reviewdetail
	ADD
		CONSTRAINT FK_review_TO_reviewdetail
		FOREIGN KEY (
			reviewno
		)
		REFERENCES review (
			reviewno
		);

create SEQUENCE intostock_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE basket_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE reviewdetail_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE zipcode_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE productsize_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE product_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE review_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE member_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE stock_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE favoritepd_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE orders_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE qna_seq
start with 1
INCREMENT by 1
NOCACHE;
create SEQUENCE card_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE orderdetail_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE refund_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE faq_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE announcement_seq
start with 1
INCREMENT by 1
NOCACHE;

create SEQUENCE qnareply_seq
start with 1
INCREMENT by 1
NOCACHE;

ALTER TABLE member
ADD CONSTRAINT UQ_member_id unique(id);

ALTER TABLE member
ADD CONSTRAINT UQ_member_email unique(email);

ALTER TABLE member
ADD CONSTRAINT UQ_member2_tel unique(tel);

ALTER TABLE card
ADD CONSTRAINT UQ_card_cardno unique(cardno);

alter table productsize
add constraint UQ_prodectsize_pdsize unique(pdsize);

CREATE OR REPLACE TRIGGER trigger_intostock_insert
AFTER INSERT ON intostock
FOR EACH ROW
BEGIN
  UPDATE stock
  SET stockqty = stockqty + :NEW.intostockqty
  WHERE pdno = :NEW.pdno AND pdsize = :NEW.pdsize;
END;

CREATE OR REPLACE TRIGGER trigger_productsize_insert
AFTER INSERT ON productsize
FOR EACH ROW
BEGIN
  insert into stock(stockno,pdno,pdsizeno)
  values(stock_seq.nextval,:new.pdno,:new.pdsizeno);
END;        