package com.semi.favoritepd.model;

public class FavoritePdVO {
	private int favoriteno; /* 찜한상품번호 */
	private int no; /* 회원번호 */
	private int pdno; /* 상품고유번호 */
	
	public FavoritePdVO() {
		super();
	}

	public FavoritePdVO(int favoriteno, int no, int pdno) {
		super();
		this.favoriteno = favoriteno;
		this.no = no;
		this.pdno = pdno;
	}

	public int getFavoriteno() {
		return favoriteno;
	}

	public void setFavoriteno(int favoriteno) {
		this.favoriteno = favoriteno;
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
		return "FavoritePdVO [favoriteno=" + favoriteno + ", no=" + no + ", pdno=" + pdno + "]";
	}
	
}
