package com.semi.refund.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.view.model.ViewVO;

public class RefundService {
	private RefundDAO refundDao;
	
	public RefundService() {
		refundDao=new RefundDAO();
	}
	
	public int refund(RefundVO vo) throws SQLException {
		return refundDao.insertRefund(vo);
	}

	public List<ViewVO> selectAll(String id) throws SQLException{
		return refundDao.selectAll(id);
	}
	
	public int deleterefundByRNo(String[] refundno) throws SQLException {
		return refundDao.deleterefundByRNo(refundno);
	}
}
