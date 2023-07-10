package com.semi.product.model;

import java.sql.Timestamp;

public class ProductVO {
	private int pdno;
	private String pdname;
	private int price;
	private String kind;
	private String brand;
	private Timestamp pdregdate;
	private String filename;
	private long filesize;
	private String originalfilename;
	
	public ProductVO() {
		super();
	}

	public ProductVO(int pdno, String pdname, int price, String kind, String brand, Timestamp pdregdate,
			String filename, long filesize, String originalfilename) {
		super();
		this.pdno = pdno;
		this.pdname = pdname;
		this.price = price;
		this.kind = kind;
		this.brand = brand;
		this.pdregdate = pdregdate;
		this.filename = filename;
		this.filesize = filesize;
		this.originalfilename = originalfilename;
	}

	
	
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPdno() {
		return pdno;
	}

	public void setPdno(int pdno) {
		this.pdno = pdno;
	}

	public String getPdname() {
		return pdname;
	}

	public void setPdname(String pdname) {
		this.pdname = pdname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Timestamp getPdregdate() {
		return pdregdate;
	}

	public void setPdregdate(Timestamp pdregdate) {
		this.pdregdate = pdregdate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public String getOriginalfilename() {
		return originalfilename;
	}

	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}

	@Override
	public String toString() {
		return "ProductVO [pdno=" + pdno + ", pdname=" + pdname + ", price=" + price
				+ ", kind=" + kind + ", brand=" + brand + ", pdregdate=" + pdregdate + ", filename=" + filename
				+ ", filesize=" + filesize + ", originalfilename=" + originalfilename + "]";
	}

}
