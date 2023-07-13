package com.semi.orders.model;

import java.sql.Timestamp;

public class OrdersVO {
	private int pdno;
	private int orderqty;
	private int pdsizeno;
	
	private int orderno; 
	private String orderaddress; 
	private Timestamp orderregdate;
	private String ordertel;
	private String pickup;
	private int no;
	private String receiver;
	
	public OrdersVO() {
		super();
	}
	

	public OrdersVO(int pdno, int orderqty, int pdsizeno, int orderno, String orderaddress, Timestamp orderregdate,
			String ordertel, String pickup, int no, String receiver) {
		super();
		this.pdno = pdno;
		this.orderqty = orderqty;
		this.pdsizeno = pdsizeno;
		this.orderno = orderno;
		this.orderaddress = orderaddress;
		this.orderregdate = orderregdate;
		this.ordertel = ordertel;
		this.pickup = pickup;
		this.no = no;
		this.receiver = receiver;
	}


	public OrdersVO(int orderno, String orderaddress, Timestamp orderregdate, String ordertel, String pickup, int no,
			String receiver) {
		super();
		this.orderno = orderno;
		this.orderaddress = orderaddress;
		this.orderregdate = orderregdate;
		this.ordertel = ordertel;
		this.pickup = pickup;
		this.no = no;
		this.receiver = receiver;
	}
	
	

	public int getPdno() {
		return pdno;
	}


	public void setPdno(int pdno) {
		this.pdno = pdno;
	}


	public int getOrderqty() {
		return orderqty;
	}


	public void setOrderqty(int orderqty) {
		this.orderqty = orderqty;
	}


	public int getPdsizeno() {
		return pdsizeno;
	}


	public void setPdsizeno(int pdsizeno) {
		this.pdsizeno = pdsizeno;
	}


	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public String getOrderaddress() {
		return orderaddress;
	}

	public void setOrderaddress(String orderaddress) {
		this.orderaddress = orderaddress;
	}

	public Timestamp getOrderregdate() {
		return orderregdate;
	}

	public void setOrderregdate(Timestamp orderregdate) {
		this.orderregdate = orderregdate;
	}

	public String getOrdertel() {
		return ordertel;
	}

	public void setOrdertel(String ordertel) {
		this.ordertel = ordertel;
	}

	public String getPickup() {
		return pickup;
	}

	public void setPickup(String pickup) {
		this.pickup = pickup;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}


	@Override
	public String toString() {
		return "OrdersVO [pdno=" + pdno + ", orderqty=" + orderqty + ", pdsizeno=" + pdsizeno + ", orderno=" + orderno
				+ ", orderaddress=" + orderaddress + ", orderregdate=" + orderregdate + ", ordertel=" + ordertel
				+ ", pickup=" + pickup + ", no=" + no + ", receiver=" + receiver + "]";
	}

	
	
}
