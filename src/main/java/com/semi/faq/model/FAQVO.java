package com.semi.faq.model;

public class FAQVO {
	public int faqNo;
	public String faqTitle;
	public String faqBody;
	public String faqCategory;
	
	public FAQVO() {
		super();
	}

	public FAQVO(int faqNo, String faqTitle, String faqBody, String faqCategory) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqBody = faqBody;
		this.faqCategory = faqCategory;
	}

	public int getfaqNo() {
		return faqNo;
	}

	public void setfaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getfaqTitle() {
		return faqTitle;
	}

	public void setfaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getfaqBody() {
		return faqBody;
	}

	public void setfaqBody(String faqBody) {
		this.faqBody = faqBody;
	}

	public String getfaqCategory() {
		return faqCategory;
	}

	public void setfaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}

	@Override
	public String toString() {
		return "FAQVO [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqBody=" + faqBody + ", faqCategory="
				+ faqCategory + "]";
	}
	
	
}//