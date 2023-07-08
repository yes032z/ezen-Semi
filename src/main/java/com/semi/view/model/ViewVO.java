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
	
	private int orderno; /* 주문번호 */
	private int orderqty; /* 수량 */
	private int price; /* 금액 */
	private String pickup; /* 픽업유무 */
	private Timestamp orderregdate; /* 구매일 */

	private int favoriteno; /* 찜한상품번호 */
	
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
	//마이페이지 > 주문 조회
	public ViewVO(int orderno, String pdname,  int orderqty, int price, String pickup, Timestamp orderregdate) {
		super();
		this.orderno = orderno;
		this.pdname = pdname;
		this.orderqty = orderqty;
		this.price = price;
		this.pickup = pickup;
		this.orderregdate = orderregdate;
	}
	//마이페이지 > 찜목록
	public ViewVO(int favoriteno, String pdname, int price) {
		super();
		this.favoriteno = favoriteno;
		this.pdname = pdname;
		this.price = price;
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
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public int getOrderqty() {
		return orderqty;
	}
	public void setOrderqty(int orderqty) {
		this.orderqty = orderqty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPickup() {
		return pickup;
	}
	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	public Timestamp getOrderregdate() {
		return orderregdate;
	}
	public void setOrderregdate(Timestamp orderregdate) {
		this.orderregdate = orderregdate;
	}
	public int getFavoriteno() {
		return favoriteno;
	}
	public void setFavoriteno(int favoriteno) {
		this.favoriteno = favoriteno;
	}
	@Override
	public String toString() {
		return "ViewVO [qnano=" + qnano + ", qnabody=" + qnabody + ", pdname=" + pdname + ", qnaview=" + qnaview
				+ ", qnaregdate=" + qnaregdate + ", reviewno=" + reviewno + ", reviewbody=" + reviewbody
				+ ", reviewgrade=" + reviewgrade + ", good=" + good + ", reviewregdate=" + reviewregdate + ", orderno="
				+ orderno + ", orderqty=" + orderqty + ", price=" + price + ", pickup=" + pickup + ", orderregdate="
				+ orderregdate + ", favoriteno=" + favoriteno + "]";
	}
	
}
