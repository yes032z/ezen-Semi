package com.semi.zipcode.model;

public class ZipcodeVO {

	private int zipno; /*NOT NULL, 번호(우편) */
	private	String zipcodeno;  /* NOT NULL  우편번호 */
	private String	si;  /*  NOT NULL, 시 */
	private String	gu;  /* NOT NULL 구/군 */
	private String	dong; /*  NOT NULL 동 */
	private String	startbunji;  /*  NOT NULL,  번지1 */
	private String	endbunji;  /* 번지2 */

	public ZipcodeVO() {
		super();
	}

	public ZipcodeVO(int zipno, String zipcodeno, String si, String gu, String dong, String startbunji, String endbunji) {
		super();
		this.zipno = zipno;
		this.zipcodeno = zipcodeno;
		this.si = si;
		this.gu = gu;
		this.dong = dong;
		this.startbunji = startbunji;
		this.endbunji = endbunji;
	}
	public int getZipno() {
		return zipno;
	}
	public void setZipno(int zipno) {
		this.zipno = zipno;
	}
	public String getZipcodeno() {
		return zipcodeno;
	}
	public void setZipcodeno(String zipcodeno) {
		this.zipcodeno = zipcodeno;
	}
	public String getSi() {
		return si;
	}
	public void setSi(String si) {
		this.si = si;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getStartbunji() {
		return startbunji;
	}
	public void setStartbunji(String startbunji) {
		this.startbunji = startbunji;
	}
	public String getEndbunji() {
		return endbunji;
	}
	public void setEndbunji(String endbunji) {
		this.endbunji = endbunji;
	}


	@Override
	public String toString() {
		return "ZipcodeVO [zipno=" + zipno + ", zipcodeno=" + zipcodeno + ", si=" + si + ", gu=" + gu + ", dong=" + dong
				+ ", startbunji=" + startbunji + ", endbunji=" + endbunji + "]";
	}
}
