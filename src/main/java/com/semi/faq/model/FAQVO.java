package com.semi.faq.model;

public class FAQVO {
	public int FAQNo;
	public String FAQTitle;
	public String FAQBody;
	public String FAQCategory;
	public int readCount;
	
	public FAQVO() {
		super();
	}

	public FAQVO(int fAQNo, String fAQTitle, String fAQBody, String fAQCategory, int readCount) {
		super();
		FAQNo = fAQNo;
		FAQTitle = fAQTitle;
		FAQBody = fAQBody;
		FAQCategory = fAQCategory;
		this.readCount = readCount;
	}

	public int getFAQNo() {
		return FAQNo;
	}

	public void setFAQNo(int fAQNo) {
		FAQNo = fAQNo;
	}

	public String getFAQTitle() {
		return FAQTitle;
	}

	public void setFAQTitle(String fAQTitle) {
		FAQTitle = fAQTitle;
	}

	public String getFAQBody() {
		return FAQBody;
	}

	public void setFAQBody(String fAQBody) {
		FAQBody = fAQBody;
	}

	public String getFAQCategory() {
		return FAQCategory;
	}

	public void setFAQCategory(String fAQCategory) {
		FAQCategory = fAQCategory;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "FAQVO [FAQNo=" + FAQNo + ", FAQTitle=" + FAQTitle + ", FAQBody=" + FAQBody + ", FAQCategory="
				+ FAQCategory + ", readCount=" + readCount + "]";
	}
	
	
}//
