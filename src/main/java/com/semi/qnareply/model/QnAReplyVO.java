package com.semi.qnareply.model;

import java.sql.Timestamp;

public class QnAReplyVO {
	private int qnareplyno; /* QnA답변번호 */
	private String qnareplybody; /* 답변내용 */
	private Timestamp qnareplyregdate; /* 작성일 */
	private int qnano; /* QnA번호 */

	public QnAReplyVO() {
		super();
	}

	public QnAReplyVO(int qnareplyno, String qnareplybody, Timestamp qnareplyregdate, int qnano) {
		super();
		this.qnareplyno = qnareplyno;
		this.qnareplybody = qnareplybody;
		this.qnareplyregdate = qnareplyregdate;
		this.qnano = qnano;
	}

	public int getQnareplyno() {
		return qnareplyno;
	}

	public void setQnareplyno(int qnareplyno) {
		this.qnareplyno = qnareplyno;
	}

	public String getQnareplybody() {
		return qnareplybody;
	}

	public void setQnareplybody(String qnareplybody) {
		this.qnareplybody = qnareplybody;
	}

	public Timestamp getQnareplyregdate() {
		return qnareplyregdate;
	}

	public void setQnareplyregdate(Timestamp qnareplyregdate) {
		this.qnareplyregdate = qnareplyregdate;
	}

	public int getQnano() {
		return qnano;
	}

	public void setQnano(int qnano) {
		this.qnano = qnano;
	}

	@Override
	public String toString() {
		return "QnAReplyVO [qnareplyno=" + qnareplyno + ", qnareplybody=" + qnareplybody + ", qnareplyregdate="
				+ qnareplyregdate + ", qnano=" + qnano + "]";
	}

}
