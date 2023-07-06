package com.semi.view.model;

import java.sql.Timestamp;

public class ViewVO {
	private int qnano; /* QnA번호 */
	private String qnabody; /* 질문내용 */
	private String pdname; /* 상품명 */
	private String qnaview; /* 공개유무 */
	private Timestamp qnaregdate; /* 등록일 */

	private int reviewno; /* 리뷰번호 */
	private String reviewbody; /* 내용 */
	private int reviewgrade; /* 별점 */
	private int good; /* 좋아요 */
	private Timestamp reviewregdate; /* 등록일 */
	
	public ViewVO() {
		super();
	}
	//마이페이지 > 내가 쓴 Q&A 목록조회
	public ViewVO(int qnano, String qnabody, String pdname, String qnaview, Timestamp qnaregdate) {
		super();
		this.qnano = qnano;
		this.qnabody = qnabody;
		this.pdname = pdname;
		this.qnaview = qnaview;
		this.qnaregdate = qnaregdate;
	}
	//마이페이지 > 내가 쓴 상품리뷰 목록조회
	public ViewVO(int reviewno, String reviewbody, String pdname, int reviewgrade, int good, Timestamp reviewregdate) {
		super();
		this.reviewno = reviewno;
		this.reviewbody = reviewbody;
		this.pdname = pdname;
		this.reviewgrade = reviewgrade;
		this.good = good;
		this.reviewregdate = reviewregdate;
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
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public String getQnaview() {
		return qnaview;
	}
	public void setQnaview(String qnaview) {
		this.qnaview = qnaview;
	}
	public Timestamp getQnaregdate() {
		return qnaregdate;
	}
	public void setQnaregdate(Timestamp qnaregdate) {
		this.qnaregdate = qnaregdate;
	}
	public int getReviewno() {
		return reviewno;
	}
	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}
	public String getReviewbody() {
		return reviewbody;
	}
	public void setReviewbody(String reviewbody) {
		this.reviewbody = reviewbody;
	}
	public int getReviewgrade() {
		return reviewgrade;
	}
	public void setReviewgrade(int reviewgrade) {
		this.reviewgrade = reviewgrade;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public Timestamp getReviewregdate() {
		return reviewregdate;
	}
	public void setReviewregdate(Timestamp reviewregdate) {
		this.reviewregdate = reviewregdate;
	}
	@Override
	public String toString() {
		return "ViewVO [qnano=" + qnano + ", qnabody=" + qnabody + ", pdname=" + pdname + ", qnaview=" + qnaview
				+ ", qnaregdate=" + qnaregdate + ", reviewno=" + reviewno + ", reviewbody=" + reviewbody
				+ ", reviewgrade=" + reviewgrade + ", good=" + good + ", reviewregdate=" + reviewregdate + "]";
	}
	
}
