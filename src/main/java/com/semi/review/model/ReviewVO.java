package com.semi.review.model;

import java.sql.Timestamp;

public class ReviewVO {
	private int reviewno; /* 리뷰번호 */
	private String reviewbody; /* 내용 */
	private Timestamp reviewregdate; /* 등록일 */
	private int reviewgrade; /* 별점 */
	private int good; /* 좋아요 */
	private int no; /* 회원번호 */
	private int pdno; /* 상품번호 */
	private String filename; /* 업로드파일명 */
	private long filesize; /* 파일사이즈 */
	private String originalfilename; /* 변경전파일명 */
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(int reviewno, String reviewbody, Timestamp reviewregdate, int reviewgrade, int good, int no,
			int pdno, String filename, long filesize, String originalfilename) {
		super();
		this.reviewno = reviewno;
		this.reviewbody = reviewbody;
		this.reviewregdate = reviewregdate;
		this.reviewgrade = reviewgrade;
		this.good = good;
		this.no = no;
		this.pdno = pdno;
		this.filename = filename;
		this.filesize = filesize;
		this.originalfilename = originalfilename;
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

	public Timestamp getReviewregdate() {
		return reviewregdate;
	}

	public void setReviewregdate(Timestamp reviewregdate) {
		this.reviewregdate = reviewregdate;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public String getOriginalfilename() {
		return originalfilename;
	}

	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewno=" + reviewno + ", reviewbody=" + reviewbody + ", reviewregdate=" + reviewregdate
				+ ", reviewgrade=" + reviewgrade + ", good=" + good + ", no=" + no + ", pdno=" + pdno + ", filename="
				+ filename + ", filesize=" + filesize + ", originalfilename=" + originalfilename + "]";
	}
	
}
