package com.semi.orderdetail.model;

public class OrderdetailVO {
	private int pdno; /* 상품번호 */
	private int orderno; /* 주문번호 */
	private int orderqty; /* 수량 */
	
	public OrderdetailVO() {
		super();
	}

	public OrderdetailVO(int pdno, int orderno, int orderqty) {
		super();
		this.pdno = pdno;
		this.orderno = orderno;
		this.orderqty = orderqty;
	}

	public int getPdno() {
		return pdno;
	}

	public void setPdno(int pdno) {
		this.pdno = pdno;
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

	@Override
	public String toString() {
		return "OrderdetailVO [pdno=" + pdno + ", orderno=" + orderno + ", orderqty=" + orderqty + "]";
	}


}
