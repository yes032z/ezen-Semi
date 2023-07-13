package com.semi.qna.model;

import java.sql.Timestamp;

public class QnAVO {
	private int qnano; /* QnA번호 */
	private String qnabody; /* 질문내용 */
	private String qnaview; /* 공개유무 */
	private Timestamp qnaregdat; /* 등록일 */
	private int no; /* 회원번호 */
	private int pdno; /* 상품번호 */
	
	private String id; 

	public QnAVO() {
		super();
	}

	public QnAVO(int qnano, String qnabody, String qnaview, Timestamp qnaregdat, int no, int pdno, String id) {
		super();
		this.qnano = qnano;
		this.qnabody = qnabody;
		this.qnaview = qnaview;
		this.qnaregdat = qnaregdat;
		this.no = no;
		this.pdno = pdno;
		this.id = id;
	}

	public QnAVO(int qnano, String qnabody, String qnaview, Timestamp qnaregdat, int no, int pdno) {
		super();
		this.qnano = qnano;
		this.qnabody = qnabody;
		this.qnaview = qnaview;
		this.qnaregdat = qnaregdat;
		this.no = no;
		this.pdno = pdno;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQnano() {
		return qnano;
	}

	public void setQnano(int qnano) {
		this.qnano = qnano;
	}

	public String getQnabody() {
		return qnabody;
	}

	public void setQnabody(String qnabody) {
		this.qnabody = qnabody;
	}

	public String getQnaview() {
		return qnaview;
	}

	public void setQnaview(String qnaview) {
		this.qnaview = qnaview;
	}

	public Timestamp getQnaregdat() {
		return qnaregdat;
	}

	public void setQnaregdat(Timestamp qnaregdat) {
		this.qnaregdat = qnaregdat;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPdno() {
		return pdno;
	}

	public void setPdno(int pdno) {
		this.pdno = pdno;
	}

	@Override
	public String toString() {
		return "QnAVO [qnano=" + qnano + ", qnabody=" + qnabody + ", qnaview=" + qnaview + ", qnaregdat=" + qnaregdat
				+ ", no=" + no + ", pdno=" + pdno + ", id=" + id + "]";
	}

}
