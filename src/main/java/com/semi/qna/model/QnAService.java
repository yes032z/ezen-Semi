package com.semi.qna.model;

import java.sql.SQLException;

public class QnAService {
	private QnADAO qnaDao;
	
	public QnAService() {
		qnaDao=new QnADAO();
	}
	//상품 QnA 등록 메서드
	public int insertQnA(QnAVO vo) throws SQLException {
		return qnaDao.insertQnA(vo);
	}
	
	
	
}
