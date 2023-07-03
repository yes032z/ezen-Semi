package com.semi.refund.model;

public class RefundVO {
	private int refundno; /* 환불번호 */
	private String refundbody; /* 환불사유 */
	private int pdno; /* 상품번호 */
	private int orderno; /* 주문번호 */
	
	public RefundVO() {
		super();
	}

	public RefundVO(int refundno, String refundbody, int pdno, int orderno) {
		super();
		this.refundno = refundno;
		this.refundbody = refundbody;
		this.pdno = pdno;
		this.orderno = orderno;
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

	@Override
	public String toString() {
		return "RefundVO [refundno=" + refundno + ", refundbody=" + refundbody + ", pdno=" + pdno + ", orderno="
				+ orderno + "]";
	}

}
