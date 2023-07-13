package com.semi.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int noticeNo;
	private String noticeName;
	private String noticeBody;
	private Timestamp noticeRegdate;
	
	public NoticeVO() {
		super();
	}

	public NoticeVO(int noticeNo, String noticeName, String noticeBody, Timestamp noticeRegdate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeName = noticeName;
		this.noticeBody = noticeBody;
		this.noticeRegdate = noticeRegdate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeName() {
		return noticeName;
	}

	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}

	public String getNoticeBody() {
		return noticeBody;
	}

	public void setNoticeBody(String noticeBody) {
		this.noticeBody = noticeBody;
	}

	public Timestamp getNoticeRegdate() {
		return noticeRegdate;
	}

	public void setNoticeRegdate(Timestamp noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeName=" + noticeName + ", noticeBody=" + noticeBody
				+ ", noticeRegdate=" + noticeRegdate + "]";
	}
	
	
}