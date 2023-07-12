package com.semi.notice.model;

import java.sql.SQLException;
import java.util.List;

public class NoticeService {
	private NoticeDAO noticeDao;
	
	public NoticeService() {
		noticeDao = new NoticeDAO();
	}
	
	public NoticeVO selectByNo(int no) throws SQLException {
		return noticeDao.selectByNo(no);
	}
	
	public List<NoticeVO> selectAll() throws SQLException {
		return noticeDao.selectAll();
	}
	
}//
