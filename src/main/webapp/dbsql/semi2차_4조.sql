/* �ֹ� */
CREATE TABLE orders (
	orderno NUMBER NOT NULL, /* �ֹ���ȣ */
	orderaddress VARCHAR2(100) NOT NULL, /* �ּ� */
	orderregdate DATE DEFAULT sysdate NOT NULL, /* ������ */
	ordertel VARCHAR2(20) NOT NULL, /* ��ȭ��ȣ */
	pickup VARCHAR2(20) NOT NULL, /* �Ⱦ����� */
	no NUMBER, /* ȸ����ȣ */
	receiver VARCHAR2(50) NOT NULL /* �޴»�� */
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

/* ȯ�� */
CREATE TABLE refund (
	refundno NUMBER NOT NULL, /* ȯ�ҹ�ȣ */
	refundbody VARCHAR2(300), /* ȯ�һ��� */
	pdno NUMBER, /* ��ǰ������ȣ */
	orderno NUMBER, /* �ֹ���ȣ */
	refundregdate DATE DEFAULT sysdate /* ȯ�ҽ�û�� */
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

/* �԰� */
CREATE TABLE intostock (
	intostockno NUMBER NOT NULL, /* �԰��ȣ */
	regdate DATE DEFAULT sysdate NOT NULL, /* �԰��� */
	intostockqty NUMBER NOT NULL, /* ���� */
	pdno NUMBER NOT NULL, /* ��ǰ������ȣ */
	pdsizeno NUMBER /* ��ȣ(������) */
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

/* ī�� */
CREATE TABLE card (
	cdno NUMBER NOT NULL, /* ��ȣ */
	cardno VARCHAR2(20) NOT NULL, /* ī���ȣ */
	cardpwd CHAR(4) NOT NULL, /* ī���й�ȣ */
	paypwd CHAR(6), /* ������й�ȣ */
	cardcom VARCHAR2(30) NOT NULL, /* ī��ȸ�� */
	cvc CHAR(3) NOT NULL, /* cvc */
	no NUMBER NOT NULL /* ȸ����ȣ */
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

/* ȸ�� */
CREATE TABLE member (
	no NUMBER NOT NULL, /* ȸ����ȣ */
	name VARCHAR2(20) NOT NULL, /* �̸� */
	id VARCHAR2(20) NOT NULL, /* ���̵� */
	pwd VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	birth VARCHAR2(10), /* ������� */
	email VARCHAR2(20), /* �̸��� */
	detailaddress VARCHAR2(200), /* �ּ� */
	tel VARCHAR2(20) NOT NULL, /* ��ȭ��ȣ */
	footsize NUMBER, /* �� ������ */
	regdate DATE DEFAULT sysdate NOT NULL, /* ������ */
	zipno NUMBER, /* ��ȣ(����) */
	outdate DATE /* Ż���� */
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

/* ���� */
CREATE TABLE review (
	reviewno NUMBER NOT NULL, /* �����ȣ */
	reviewbody VARCHAR2(1000) NOT NULL, /* ���� */
	reviewregdate DATE DEFAULT sysdate NOT NULL, /* ����� */
	reviewgrade NUMBER NOT NULL, /* ���� */
	good NUMBER, /* ���ƿ� */
	no NUMBER NOT NULL, /* ȸ����ȣ */
	pdno NUMBER NOT NULL /* ��ǰ������ȣ */
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

/* ���ѻ�ǰ */
CREATE TABLE favoritepd (
	favoriteno NUMBER NOT NULL, /* ���ѻ�ǰ��ȣ */
	no NUMBER, /* ȸ����ȣ */
	pdno NUMBER /* ��ǰ������ȣ */
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

/* ��ǰ */
CREATE TABLE product (
	pdno NUMBER NOT NULL, /* ��ǰ������ȣ */
	pdname VARCHAR2(200) NOT NULL, /* ��ǰ�� */
	price NUMBER NOT NULL, /* ���� */
	kind VARCHAR2(10) NOT NULL, /* ���� */
	brand VARCHAR2(100) NOT NULL, /* �귣�� */
	pdregdate DATE DEFAULT sysdate NOT NULL, /* ����� */
	filename VARCHAR2(50), /* ���ε����ϸ� */
	filesize NUMBER DEFAULT 0, /* ���ϻ����� */
	originalfilename VARCHAR2(100) /* ���������ϸ� */
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

/* ��� */
CREATE TABLE stock (
	stockno NUMBER NOT NULL, /* ����ȣ */
	stockqty NUMBER DEFAULT 0 NOT NULL, /* ���� */
	pdno NUMBER NOT NULL, /* ��ǰ������ȣ */
	pdsizeno NUMBER /* ��ȣ(������) */
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
	qnano NUMBER NOT NULL, /* QnA��ȣ */
	qnabody VARCHAR2(1000) NOT NULL, /* �������� */
	qnaview VARCHAR2(10) NOT NULL, /* �������� */
	qnaregdate DATE DEFAULT sysdate NOT NULL, /* ����� */
	no NUMBER NOT NULL, /* ȸ����ȣ */
	pdno NUMBER NOT NULL /* ��ǰ������ȣ */
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

/* �������� */
CREATE TABLE announcement (
	announcementno NUMBER NOT NULL, /* �������׹�ȣ */
	announcementname VARCHAR2(200) NOT NULL, /* ���� */
	announcementbody VARCHAR2(2000) NOT NULL, /* ���� */
	announcementregdate DATE DEFAULT sysdate NOT NULL /* ����� */
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

/* ��ٱ��� */
CREATE TABLE basket (
	basketno NUMBER NOT NULL, /* ��ٱ��Ϲ�ȣ */
	basketqty NUMBER NOT NULL, /* ���� */
	pdno NUMBER NOT NULL, /* ��ǰ������ȣ */
	no NUMBER NOT NULL, /* ȸ����ȣ */
	pdsizeno NUMBER /* ��ȣ(������) */
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
	faqno NUMBER NOT NULL, /* FAQ��ȣ */
	faqtitle VARCHAR2(200) NOT NULL, /* ���� */
	faqbody VARCHAR2(1000) NOT NULL, /* ���� */
	faqcatagory VARCHAR2(20) NOT NULL /* ī�װ� */
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

/* �ֹ��� */
CREATE TABLE orderdetail (
	pdno NUMBER NOT NULL, /* ��ǰ������ȣ */
	orderno NUMBER NOT NULL, /* �ֹ���ȣ */
	orderqty NUMBER, /* ���� */
	pdsizeno NUMBER /* ��ȣ(������) */
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

/* �����ȣ */
CREATE TABLE zipcode (
	zipno NUMBER NOT NULL, /* ��ȣ(����) */
	zipcodeno CHAR(5) NOT NULL, /* �����ȣ */
	si VARCHAR2(20) NOT NULL, /* �� */
	gu VARCHAR2(20) NOT NULL, /* ��/�� */
	dong VARCHAR2(20) NOT NULL, /* �� */
	startbunji VARCHAR2(10) NOT NULL, /* ����1 */
	endbunji VARCHAR2(10) /* ����2 */
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

/* QnA�亯 */
CREATE TABLE qnareply (
	qnareplyno NUMBER NOT NULL, /* QnA�亯��ȣ */
	qnareplybody VARCHAR2(1000) NOT NULL, /* �亯���� */
	qnareplyregdate DATE DEFAULT sysdate NOT NULL, /* �ۼ��� */
	qnano NUMBER NOT NULL /* QnA��ȣ */
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

/* ������ */
CREATE TABLE productsize (
	pdsizeno NUMBER NOT NULL, /* ��ȣ(������) */
	pdsize NUMBER NOT NULL, /* ������ */
	pdno NUMBER NOT NULL /* ��ǰ������ȣ */
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

/* ��ǰ�� */
CREATE TABLE productdetail (
	filename VARCHAR2(50), /* ���ε����ϸ� */
	filesize NUMBER, /* ���ϻ����� */
	pdno NUMBER, /* ��ǰ������ȣ */
	originalfilename VARCHAR2(100) /* ���������ϸ� */
);

/* ����� */
CREATE TABLE reviewdetail (
	reviewno NUMBER, /* �����ȣ */
	filename VARCHAR2(50), /* ���ε����ϸ� */
	filesize NUMBER, /* ���ϻ����� */
	originalfilename VARCHAR2(100) /* ���������ϸ� */
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