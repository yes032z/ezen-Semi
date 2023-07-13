package com.semi.qna.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.view.model.ViewVO;

public class QnAService {
	private QnADAO qnaDao;
	
	public QnAService() {
		qnaDao=new QnADAO();
	}
	//상품 QnA 등록 메서드
	public int insertQnA(QnAVO vo) throws SQLException {
		return qnaDao.insertQnA(vo);
	}
	//마이페이지 > 내가 쓴 Q&A 목록조회
	public List<ViewVO> selectQnAByid(String id, String startDate, String lastDate) throws SQLException{
		return qnaDao.selectQnAByid(id, startDate, lastDate);
	}
	
	//상품 디테일에 Q&A 전체 조회
	public List<QnAVO> selectQnAAll(int pdno) throws SQLException {
		return qnaDao.selectQnAAll(pdno);
	}
}
