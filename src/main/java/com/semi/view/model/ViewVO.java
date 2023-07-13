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
	private String filename; /* 업로드파일명 */

	private int favoriteno; /* 찜한상품번호 */
	private int pdno; /* 상품고유번호 */
	private String brand; /* 브랜드 */
	
	private Timestamp regdate; /* 입고일 */
	private int pdsize; /* 사이즈 */
	private int stockqty; /* 수량 */
	
	private int refundno; /* 환불번호 */
	private String refundbody; /* 환불사유 */
	private Timestamp refundregdate; /*환불신청일 */
	
	public ViewVO() {
		super();
	}
	//마이페이지 > 내가 쓴 Q&A 목록조회
	public ViewVO(int qnano, String qnabody, String pdname, String qnaview, Timestamp qnaregdate,int pdno) {
		super();
		this.qnano = qnano;
		this.qnabody = qnabody;
		this.pdname = pdname;
		this.qnaview = qnaview;
		this.qnaregdate = qnaregdate;
		this.pdno = pdno;
	}
	//마이페이지 > 내가 쓴 상품리뷰 목록조회
	public ViewVO(int reviewno, String reviewbody, String pdname, int reviewgrade, int good, Timestamp reviewregdate, int pdno) {
		super();
		this.reviewno = reviewno;
		this.reviewbody = reviewbody;
		this.pdname = pdname;
		this.reviewgrade = reviewgrade;
		this.good = good;
		this.reviewregdate = reviewregdate;
		this.pdno = pdno;
	}
	//마이페이지 > 주문 조회
	public ViewVO(int orderno, String filename, String pdname,  int orderqty, int price, String pickup, Timestamp orderregdate, int pdno) {
		super();
		this.orderno = orderno;
		this.filename = filename;
		this.pdname = pdname;
		this.orderqty = orderqty;
		this.price = price;
		this.pickup = pickup;
		this.orderregdate = orderregdate;
		this.pdno = pdno;
	}
	//마이페이지> 찜목록
	public ViewVO(int favoriteno, String filename, String pdname, int price, int pdno) {
		super();
		this.favoriteno = favoriteno;
		this.filename = filename;
		this.pdname = pdname;
		this.price = price;
		this.pdno = pdno;
	}
	//마이페이지 찜목록 최근 4건조회
	public ViewVO(String filename, String pdname, String brand, int price, int pdno) {
		super();
		this.filename = filename;
		this.pdname = pdname;
		this.brand = brand;
		this.price = price;
		this.pdno = pdno;
	}
	//사용자 발사이즈에 맞는 찜상품 입고 알림 조회
	public ViewVO(int favoriteno, int pdno, Timestamp regdate, int stockqty, String pdname, int pdsize, String filename) {
		super();
		this.favoriteno = favoriteno;
		this.pdno = pdno;
		this.regdate = regdate;
		this.stockqty = stockqty;
		this.pdname = pdname;
		this.pdsize = pdsize;
		this.filename = filename;
	}
	//환불 insert
	public ViewVO(int refundno, String refundbody, int pdno, int orderno) {
		this.refundno = refundno;
		this.refundbody = refundbody;
		this.pdno = pdno;
		this.orderno = orderno;
	}
	//마이페이지 > 주문목록 > 환불신청전 내역띄우기
	public ViewVO(int orderno, int orderqty, String pdname, int price, String filename,int pdno) {
		super();
		this.orderno = orderno;
		this.orderqty = orderqty;
		this.pdname = pdname;
		this.price = price;
		this.filename = filename;
		this.pdno = pdno;
	}
	//마이페이지 > 환불목록 조회
	public ViewVO(int refundno, int orderno, String filename, String pdname,  int orderqty, int price, String refundbody, Timestamp orderregdate, int pdno, Timestamp refundregdate) {
		super();
		this.refundno = refundno;
		this.orderno = orderno;
		this.filename = filename;
		this.pdname = pdname;
		this.orderqty = orderqty;
		this.price = price;
		this.refundbody = refundbody;
		this.orderregdate = orderregdate;
		this.pdno = pdno;
		this.refundregdate = refundregdate;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFavoriteno() {
		return favoriteno;
	}
	public void setFavoriteno(int favoriteno) {
		this.favoriteno = favoriteno;
	}
	public int getPdno() {
		return pdno;
	}
	public void setPdno(int pdno) {
		this.pdno = pdno;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getPdsize() {
		return pdsize;
	}
	public void setPdsize(int pdsize) {
		this.pdsize = pdsize;
	}
	public int getStockqty() {
		return stockqty;
	}
	public void setStockqty(int stockqty) {
		this.stockqty = stockqty;
	}
	public int getRefundno() {
		return refundno;
	}
	public void setRefundno(int refundno) {
		this.refundno = refundno;
	}
	public String getRefundbody() {
		return refundbody;
	}
	public void setRefundbody(String refundbody) {
		this.refundbody = refundbody;
	}
	public Timestamp getRefundregdate() {
		return refundregdate;
	}
	public void setRefundregdate(Timestamp refundregdate) {
		this.refundregdate = refundregdate;
	}
	@Override
	public String toString() {
		return "ViewVO [qnano=" + qnano + ", qnabody=" + qnabody + ", pdname=" + pdname + ", qnaview=" + qnaview
				+ ", qnaregdate=" + qnaregdate + ", reviewno=" + reviewno + ", reviewbody=" + reviewbody
				+ ", reviewgrade=" + reviewgrade + ", good=" + good + ", reviewregdate=" + reviewregdate + ", orderno="
				+ orderno + ", orderqty=" + orderqty + ", price=" + price + ", pickup=" + pickup + ", orderregdate="
				+ orderregdate + ", filename=" + filename + ", favoriteno=" + favoriteno + ", pdno=" + pdno + ", brand="
				+ brand + ", regdate=" + regdate + ", pdsize=" + pdsize + ", stockqty=" + stockqty + ", refundno="
				+ refundno + ", refundbody=" + refundbody + ", refundregdate=" + refundregdate + "]";
	}
	
}
