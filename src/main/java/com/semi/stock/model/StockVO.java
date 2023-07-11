package com.semi.stock.model;

public class StockVO {
	private int stockno;
	private int stockqty;
	private int pdno;
	private int pdsizeno;
	
	public StockVO() {
		super();
	}
	public StockVO(int stockno, int stockqty, int pdno, int pdsizeno) {
		super();
		this.stockno = stockno;
		this.stockqty = stockqty;
		this.pdno = pdno;
		this.pdsizeno = pdsizeno;
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
		return pdsizeno;
	}
	public void setPdsizeno(int pdsizeno) {
		this.pdsizeno = pdsizeno;
	}
	@Override
	public String toString() {
		return "StockVO [stockno=" + stockno + ", stockqty=" + stockqty + ", pdno=" + pdno + ", pdsizeno=" + pdsizeno + "]";
	}
	
}
