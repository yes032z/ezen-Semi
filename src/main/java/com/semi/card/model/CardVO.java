package com.semi.card.model;

public class CardVO {
	private int cdno; //번호
	private String cardno; //카드번호 
	private int cardpwd; //카드비밀번호 
	private int paypwd; //결제비밀번호
	private String cardcom; //카드회사
	private int cvc; //cvc
	private int no; //회원번호
	
	public CardVO() {
		super();
	}
	
	public CardVO(int cdno, String cardno, int cardpwd, int paypwd, String cardcom, int cvc, int no) {
		this.cdno = cdno;
		this.cardno = cardno;
		this.cardpwd = cardpwd;
		this.paypwd = paypwd;
		this.cardcom = cardcom;
		this.cvc = cvc;
		this.no = no;
	}

	public int getCdno() {
		return cdno;
	}

	public void setCdno(int cdno) {
		this.cdno = cdno;
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public int getCardpwd() {
		return cardpwd;
	}

	public void setCardpwd(int cardpwd) {
		this.cardpwd = cardpwd;
	}

	public int getPaypwd() {
		return paypwd;
	}

	public void setPaypwd(int paypwd) {
		this.paypwd = paypwd;
	}

	public String getCardcom() {
		return cardcom;
	}

	public void setCardcom(String cardcom) {
		this.cardcom = cardcom;
	}

	public int getCvc() {
		return cvc;
	}

	public void setCvc(int cvc) {
		this.cvc = cvc;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "CardVO [cdno=" + cdno + ", cardno=" + cardno + ", cardpwd=" + cardpwd + ", paypwd=" + paypwd
				+ ", cardcom=" + cardcom + ", cvc=" + cvc + ", no=" + no + "]";
	}
}
