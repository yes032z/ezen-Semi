package com.semi.productsize.model;

public class ProductSizeVO {
	private int pdsizeno;
	private int pdsize;
	private int pdno;
	
	public ProductSizeVO() {
		super();
	}

	public ProductSizeVO(int pdsizeno, int pdsize, int pdno) {
		super();
		this.pdsizeno = pdsizeno;
		this.pdsize = pdsize;
		this.pdno = pdno;
	}

	public int getPdsizeno() {
		return pdsizeno;
	}

	public void setPdsizeno(int pdsizeno) {
		this.pdsizeno = pdsizeno;
	}

	public int getPdsize() {
		return pdsize;
	}

	public void setPdsize(int pdsize) {
		this.pdsize = pdsize;
	}

	public int getPdno() {
		return pdno;
	}

	public void setPdno(int pdno) {
		this.pdno = pdno;
	}

	@Override
	public String toString() {
		return "ProductSizeVO [pdsizeno=" + pdsizeno + ", pdsize=" + pdsize + ", pdno=" + pdno + "]";
	}
	
	
}
