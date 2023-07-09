package com.semi.faq.model;

public class FAQVO {
	public int faqNo;
	public String faqTitle;
	public String faqBody;
	public String faqCategory;
	public int readCount;
	
	public FAQVO() {
		super();
	}

	public FAQVO(int faqNo, String faqTitle, String faqBody, String faqCategory, int readCount) {
		super();
		faqNo = faqNo;
		faqTitle = faqTitle;
		faqBody = faqBody;
		faqCategory = faqCategory;
		this.readCount = readCount;
	}

	public int getfaqNo() {
		return faqNo;
	}

	public void setfaqNo(int faqNo) {
		faqNo = faqNo;
	}

	public String getfaqTitle() {
		return faqTitle;
	}

	public void setfaqTitle(String faqTitle) {
		faqTitle = faqTitle;
	}

	public String getfaqBody() {
		return faqBody;
	}

	public void setfaqBody(String faqBody) {
		faqBody = faqBody;
	}

	public String getfaqCategory() {
		return faqCategory;
	}

	public void setfaqCategory(String faqCategory) {
		faqCategory = faqCategory;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "FAQVO [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqBody=" + faqBody + ", faqCategory="
				+ faqCategory + ", readCount=" + readCount + "]";
	}
	
	
}//
