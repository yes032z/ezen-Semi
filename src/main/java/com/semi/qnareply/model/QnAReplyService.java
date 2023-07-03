package com.semi.qnareply.model;

import java.sql.SQLException;

public class QnAReplyService {
	private QnAReplyDAO qnaReplyDao;
	
	public QnAReplyService() {
		qnaReplyDao=new QnAReplyDAO();
	}
	//상품QnA 댓글등록 메서드
	public int insertQnAReply(QnAReplyVO vo) throws SQLException {
		return qnaReplyDao.insertQnAReply(vo);
	}
	
	
}
