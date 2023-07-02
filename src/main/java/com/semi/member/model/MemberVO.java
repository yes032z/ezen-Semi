package com.semi.member.model;

import java.sql.Timestamp;

public class MemberVO {

	private int	no; /* 회원번호 */
	private String name; /* 이름 */
	private String	id;/* 아이디 */
	private String	pwd; /* 비밀번호 */
	private String	birth;/* 생년월일 */
	private String	email; /* 이메일 */
	private String	detailaddress;/* 주소 */
	private String	tel; /* 전화번호 */
	private int	footsize; /* 발 사이즈 */
	private Timestamp regdate;/* 가입일 */
	private int	zipno; /* 번호(우편) */

	public MemberVO() {
		super();
	}


	public MemberVO(int no, String name, String id, String pwd, String birth, String email, String detailaddress,
			String tel, int footsize, Timestamp regdate, int zipno) {
		super();
		this.no = no;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.birth = birth;
		this.email = email;
		this.detailaddress = detailaddress;
		this.tel = tel;
		this.footsize = footsize;
		this.regdate = regdate;
		this.zipno = zipno;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getFootsize() {
		return footsize;
	}
	public void setFootsize(int footsize) {
		this.footsize = footsize;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getZipno() {
		return zipno;
	}
	public void setZipno(int zipno) {
		this.zipno = zipno;
	}

	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", birth=" + birth + ", email="
				+ email + ", detailaddress=" + detailaddress + ", tel=" + tel + ", footsize=" + footsize + ", regdate="
				+ regdate + ", zipno=" + zipno + "]";
	}
}
