package com.semi.reviewdetail.model;

public class ReviewDetailVO {
	private int reviewno;
	private String filename; /* 업로드파일명 */
	private long filesize; /* 파일사이즈 */
	private String originalfilename; /* 변경전파일명 */
	
	public ReviewDetailVO() {
		super();
	}

	public ReviewDetailVO(int reviewno, String filename, long filesize, String originalfilename) {
		super();
		this.reviewno = reviewno;
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
		return "ReviewDetailVO [reviewno=" + reviewno + ", filename=" + filename + ", filesize=" + filesize
				+ ", originalfilename=" + originalfilename + "]";
	}
	
}
