package com.semi.basket.model;

public class BasketVO {
	private int basketno;	//장바구니 번호
	private int basketqty; 	//수량
	private int pdno; 		//상품번호
	private int no;			//회원번호
	
	public BasketVO() {
		super();				
	}
	
	public BasketVO(int basketeno, int basketqty, int pdno, int no) {
		super();
		this.basketno = basketeno;
		this.basketqty = basketqty;
		this.pdno = pdno;
		this.no = no;
	}

	public int getBasketno() {
		return basketno;
	}

	public void setBasketno(int basketno) {
		this.basketno = basketno;
	}

	public int getBasketqty() {
		return basketqty;
	}

	public void setBasketqty(int basketqty) {
		this.basketqty = basketqty;
	}

	public int getPdno() {
		return pdno;
	}

	public void setPdno(int pdno) {
		this.pdno = pdno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "BasketVO [basketno=" + basketno + ", basketqty=" + basketqty + ", pdno=" + pdno + ", no=" + no + "]";
	}	
}
