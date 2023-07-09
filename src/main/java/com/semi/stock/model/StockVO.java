package com.semi.stock.model;

public class StockVO {
	private int stockno;
	private int stockqty;
	private int pdno;
	private int pdsize;
	
	public StockVO() {
		super();
	}
	public StockVO(int stockno, int stockqty, int pdno, int pdsize) {
		super();
		this.stockno = stockno;
		this.stockqty = stockqty;
		this.pdno = pdno;
		this.pdsize = pdsize;
	}
	public int getStockno() {
		return stockno;
	}
	public void setStockno(int stockno) {
		this.stockno = stockno;
	}
	public int getStockqty() {
		return stockqty;
	}
	public void setStockqty(int stockqty) {
		this.stockqty = stockqty;
	}
	public int getPdno() {
		return pdno;
	}
	public void setPdno(int pdno) {
		this.pdno = pdno;
	}
	public int getPdsize() {
		return pdsize;
	}
	public void setPdsize(int pdsize) {
		this.pdsize = pdsize;
	}
	@Override
	public String toString() {
		return "StockVO [stockno=" + stockno + ", stockqty=" + stockqty + ", pdno=" + pdno + ", pdsize=" + pdsize + "]";
	}
	
}
