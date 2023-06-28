package com.myhw.person.model;

import java.sql.Timestamp;

public class personVO {
	private int no;
	private String name;
	private String tel;
	private Timestamp regdate;

	public personVO() {
		super();
	}

	public personVO(int no, String name, String tel, Timestamp regdate) {
		this.no = no;
		this.name = name;
		this.tel = tel;
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "personVO [no=" + no + ", name=" + name + ", tel=" + tel + ", regdate=" + regdate + "]";
	}
	
}
