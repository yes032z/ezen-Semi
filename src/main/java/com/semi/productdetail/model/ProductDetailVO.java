package com.semi.productdetail.model;

public class ProductDetailVO {
	private int pdno;
	private String filename;
	private Long filesize;
	private String originalfilename;
	
	public ProductDetailVO() {
		super();
	}
	
	public ProductDetailVO(int pdno, String filename, Long filesize, String originalfilename) {
		super();
		this.pdno = pdno;
		this.filename = filename;
		this.filesize = filesize;
		this.originalfilename = originalfilename;
	}
	
	public int getPdno() {
		return pdno;
	}
	
	public void setPdno(int pdno) {
		this.pdno = pdno;
	}
	
	public String getFilename() {
		return filename;
	}
	
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public Long getFilesize() {
		return filesize;
	}
	
	public void setFilesize(Long filesize) {
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
		return "ProductDetailVO [pdno=" + pdno + ", filename=" + filename + ", filesize=" + filesize
				+ ", originalfilename=" + originalfilename + "]";
	}
	
	
}
